!(function ($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.smartPhone) {
    $.jalios.smartPhone = {};
  }

  $.jalios.smartPhone.MobileApp = {
    contactInformation: {},
    config: {
      postMsgIntervalCheck: 200,
      postMsgTimeoutDelay: 5000,
    },
    saveAction: function (actionName, actionFunction, args) {
      if ($.jalios.smartPhone.isMobileApp()) {
        var actions = [];
        actions.push({
          actionName: actionName,
          action: actionFunction.toString(),
          args: typeof args === "string" ? args : JSON.stringify(args),
        });
        $.jalios.smartPhone.postMessageApp(
          JSON.stringify({
            type: "function",
            status: "success",
            msg: JSON.stringify(actions),
          })
        );
      }
    },
  };

  $.jalios.smartPhone.isMobileApp = function () {
    return localStorage.getItem("context") === "mobileApp";
  };

  //Sends message to the JMobile application using the Post Message API
  $.jalios.smartPhone.postMessageApp = function (msg, args) {
    //Postpone webkit call until ready.
    const postStartTime = new Date().getTime();
    let intervalCheck =
      $.jalios.smartPhone.MobileApp.config.postMsgIntervalCheck || 200;
    let timeoutDelay =
      $.jalios.smartPhone.MobileApp.config.postMsgTimeoutDelay || 5000;
    let onErrorCallback;
    let onSuccessCallback;

    //allow overriding options
    if (typeof args !== "undefined") {
      intervalCheck = args.intervalCheck || intervalCheck;
      timeoutDelay = args.timeoutDelay || timeoutDelay;

      onSuccessCallback = args.onSuccess;
      onErrorCallback = args.onError;
    }

    //Waits until wk view ready
    var wkLoadedLoop = setInterval(function () {
      if (
        window.webkit &&
        window.webkit.messageHandlers &&
        window.webkit.messageHandlers["cordova_iab"]
      ) {
        clearInterval(wkLoadedLoop);
        webkit.messageHandlers.cordova_iab.postMessage(msg);

        if (typeof onSuccessCallback === "function") {
          onSuccessCallback(msg);
        }
      } else {
        const currentTime = new Date().getTime();
        const elapsedTime = currentTime - postStartTime;
        if (elapsedTime >= timeoutDelay) {
          //postMessageApp: Could not send message to mobile device
          //post message could not be completed fast enough ; fallback

          clearInterval(wkLoadedLoop); //stop loop
          //add message to post message queue
          var messagesFallback = localStorage.getItem("jmobile-postMessageApp");
          if (
            messagesFallback == null ||
            typeof messagesFallback === "undefined"
          ) {
            messagesFallback = [];
          }
          messagesFallback[messagesFallback.length] = msg;
          localStorage.setItem(
            "jmobile-postMessageApp",
            JSON.stringify(messagesFallback)
          );

          if (typeof onErrorCallback === "function") {
            onErrorCallback(msg);
          }
        }
      }
    }, intervalCheck);
  };

  // Replace the target='_blank' by target='_system' to open these links
  // in the system's web browser
  // https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-inappbrowser/#cordovainappbrowseropen
  $.jalios.smartPhone.openExternalLinks = function (url) {
    if (typeof url != "undefined" && url != null) {
      $.jalios.smartPhone.MobileApp.saveAction(
        "OpenInSystemWebBrowser",
        function openInSystemWebBrowser(options) {
          this.openLinkService.openInSystemWebBrowser(options);
        },
        { url: url }
      );
      return false;
    }
  };
  $(document).on("update-alert-count", function (e) {
    $.jalios.smartPhone.MobileApp.saveAction(
      "updateJmobileBadge",
      function updateJmobileBadge(badgeValue) {
        if (this.badgeService != undefined) {
          this.badgeService.setBadge(badgeValue);
        }
      },
      e.badgeValue
    );
  });

  $(document).on("addContext", function (e) {
    localStorage.setItem("context", "mobileApp");
    var jwToken = e.param.token;
    $.ajaxSetup({ headers: { Authorization: "Bearer " + jwToken } });
  });

  $(document).on("addNotificationInfo", function (e) {
    localStorage.setItem("jmobileVersion", e.param.jmobileVersion);
    localStorage.setItem("deviceID", e.param.deviceID);
    localStorage.setItem("deviceOS", e.param.deviceOS);
    localStorage.setItem("deviceModel", e.param.deviceModel);
    localStorage.setItem(
      "notificationPermission",
      e.param.notificationPermission
    );
  });

  $(document).on("notification", function (e) {
    $.jalios.smartPhone.Alerts.updateAlertCount();
  });

  $(document).on("postMessagePlugin", function (event, msg) {
    const msgJson = JSON.parse(msg);
    if (msgJson.type === "share-data" && msgJson.msg != "") {
      const shareInfo = msgJson.msg;

      if ($(".service-explorer-upload-file, .form-upload-file").length) {
        try {
          var file = $.jalios.smartPhone.Forms.dataURLtoFile(
            shareInfo.data,
            "file." + shareInfo.extension
          );
          const dT = new DataTransfer();
          dT.items.add(file);
          $(".jmobile-upload-file")[0].files = dT.files;
          $form = $(".explorer-upload-file-form, .form-upload-file");
          $form.append("documents", file);
          $form.data("jalios-form-file", file, file.name);
          $(".explorer-upload-file-form, .form-upload-file").append(
            "<p>Attached file: " + file.name + " [" + file.size + " bytes]"
          );
          console.log(
            "Attached file: " + file.name + " [" + file.size + " bytes]"
          );
        } catch (error) {
          console.log("Could not attach file: " + JSON.stringify(error));
        }
      } else if ($("#share-image").length) {
        // Load Camera Image into ESN Page
        $(".upload-image-action-container").append(
          '<div class="imagepreview"><span class="icon-close ui-input-btn ui-btn delete-image-preview ui-icon-delete ui-btn-icon-notext ui-corner-all"></span><img alt="" src="' +
            shareInfo.data +
            '" /></div>'
        );
        var $form = $("form.adding-picture-file,.microblogging-form form");
        $form.find(".microBlogging-galery").hide();
        $form.find(".microBlogging-camera").hide();
        try {
          var file = $.jalios.smartPhone.Forms.dataURLtoFile(
            shareInfo.data,
            "image.jpeg"
          );
          $form.data("jalios-form-file", file);
          console.log(
            "PhotoService - Attached file: " +
              file.name +
              " [" +
              file.size +
              " bytes]"
          );
        } catch (error) {
          console.log(
            "PhotoService - Could not attach file: " + JSON.stringify(error)
          );
        }
      }
    }
  });

  $(document).on("pagecontainerbeforeshow", function (e) {
    if ($(".service-jmobileabout-content").length) {
      var data = {
        deviceID: localStorage.getItem("deviceID"),
        deviceModel: localStorage.getItem("deviceModel"),
        deviceOS: localStorage.getItem("deviceOS"),
        jmobileVersion: localStorage.getItem("jmobileVersion"),
      };
      var serviceUrl =
        "plugins/SmartPhonePlugin/jsp/action/jmobileActionHandler.jsp";
      $.ajax({
        type: "POST",
        dataType: "json",
        url: serviceUrl,
        data: data,
        success: function (result) {
          document.getElementById("jmobile-version-message").innerHTML =
            result.jmobileVersion;

          if (result.DeviceRegistred == "true") {
            document.getElementById("registred-deviceId").innerHTML =
              '<span class="jalios-icon icomoon-mobile jmobile-notification-post-icon"></span>' +
              result.deviceIdSMessage +
              '<span class="jalios-icon jmobile-config-status-correct icomoon-checkmark4"></span>';
          } else {
            document.getElementById("registred-deviceId").innerHTML =
              '<span class="jalios-icon icomoon-mobile jmobile-notification-post-icon"></span>' +
              result.deviceIdSMessage +
              '<span class="jalios-icon jmobile-config-status-warning icomoon-warning"></span>';
          }

          if (localStorage.getItem("notificationPermission") == "true") {
            document.getElementById("notification-permission").innerHTML =
              '<span class="jalios-icon icomoon-unlocked2 jmobile-notification-post-icon"></span>' +
              result.notificationPermission +
              '</span><span class="jalios-icon jmobile-config-status-correct icomoon-checkmark4"></span>';
          } else {
            document.getElementById("notification-permission").innerHTML =
              '<span class="jalios-icon icomoon-lock jmobile-notification-post-icon"></span>' +
              result.notificationPermission +
              '<span class="jalios-icon jmobile-config-status-warning icomoon-warning"></span>';
          }

          if (result.alertTypeActivated == "true") {
            document.getElementById("jmobile-alert-type").innerHTML =
              '<span class="jalios-icon icomoon-equalizer2 jmobile-notification-post-icon"></span>' +
              result.JmobileAlertTypeMessage +
              '<span class="jalios-icon jmobile-config-status-correct icomoon-checkmark4"></span>';
          } else {
            document.getElementById("jmobile-alert-type").innerHTML =
              '<span class="jalios-icon icomoon-equalizer2 jmobile-notification-post-icon"></span>' +
              result.JmobileAlertTypeMessage +
              '<span class="jalios-icon jmobile-config-status-warning icomoon-warning"></span>';
          }
        },
        error: function (err) {
          console.dir(err);
        },
      });
    }

    if ($.jalios.smartPhone.isMobileApp()) {
      $(".logout-link").on("vclick", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $.jalios.smartPhone.MobileApp.saveAction("logout", function logout() {
          this.logout();
        });
      });

      if ($.mobile.activePage.attr("id") === "member-profile") {
        if (
          !$.isEmptyObject($.jalios.smartPhone.MobileApp.contactInformation)
        ) {
          $.jalios.smartPhone.MobileApp.saveAction(
            "existContact",
            function existContact(contactData) {
              this.contactService.checkExistContact(contactData);
            },
            {
              mobilePhoneNumbers:
                $.jalios.smartPhone.MobileApp.contactInformation
                  .mobilePhoneNumbers,
              email: $.jalios.smartPhone.MobileApp.contactInformation.email,
            }
          );
        }
      }

      if ($.mobile.activePage.attr("id") === "share-image") {
        $(".toggle-microblogging-form").toggleClass("hide");
        $.jalios.smartPhone.postMessageApp(
          JSON.stringify({ type: "share-data" })
        );
      }

      if ($(".service-explorer-upload-file").length) {
        uploadDocument(e);
      }
    }
  });

  var handlePictures = function (e) {
    savePictureAction(e, "gallery", {
      // DATA_URL : return image as base64-encoded string
      destinationType: 0, // this.camera.DestinationType.DATA_URL
      encodingType: 0, // this.camera.EncodingType.JPEG
      sourceType: 0, // this.camera.PictureSourceType.PHOTOLIBRARY
      correctOrientation: true,
    });
  };

  var handleCamera = function (e) {
    savePictureAction(e, "camera", {
      destinationType: 0, // this.camera.DestinationType.DATA_URL
      correctOrientation: true,
    });
  };

  var downloadFile = function (urlDocument, filename, contentType) {
    if (typeof urlDocument != "undefined" && urlDocument != null) {
      $.jalios.smartPhone.MobileApp.saveAction(
        "downloadFile",
        function downloadFile(options) {
          this.fileService.downloadFile(options);
        },
        { url: urlDocument, filename: filename, contentType: contentType }
      );
    }
  };

  function uploadDocument(e) {
    if (
      $.jalios != null &&
      $.jalios.smartPhone != null &&
      typeof $.jalios.smartPhone.postMessageApp === "function"
    ) {
      // Ask app to send shared data (e.g. encoded media)
      $.jalios.smartPhone.postMessageApp(
        JSON.stringify({ type: "share-data" })
      );
    }
  }

  function savePictureAction(event, actionName, cameraOptions) {
    var $currentForm = $(event.target).closest("FORM");
    $currentForm.addClass("adding-picture-file");

    $.jalios.smartPhone.MobileApp.saveAction(
      actionName,
      function openCamera(cameraOptions) {
        this.photoService.addPictureToInappBrowser(cameraOptions);
      },
      cameraOptions
    );
  }

  function saveContact(e) {
    if (!$.isEmptyObject($.jalios.smartPhone.MobileApp.contactInformation)) {
      $.jalios.smartPhone.MobileApp.saveAction(
        "addContact",
        function addContact(contactData) {
          this.contactService.addContact(contactData);
        },
        $.jalios.smartPhone.MobileApp.contactInformation
      );
    }
  }

  var registerDomReadyForMobileApp = function () {
    // vclick used to listen for both touch events and also href links.
    $(document).on("vclick", function (e) {
      if ($.jalios.smartPhone.isMobileApp()) {
        var $target = $(e.target);

        // JMobile App Disconnect from site
        if ($target.closest(".jmobile-disconnect").length) {
          $.jalios.smartPhone.MobileApp.saveAction(
            "disconnect",
            function disconnect() {
              this.disconnect({ showPrompt: true });
            }
          );
        }
        if ($target.closest(".upload-image-action-icon").length) {
          if ($target.closest(".microBlogging-galery").length) {
            $target
              .addClass("jmobile-action-in-progress")
              .removeClass("jmobile-action-completed");
            e.preventDefault();
            e.stopPropagation();
            e.stopImmediatePropagation();
            handlePictures(e);
          }
          if ($target.closest(".microBlogging-camera").length) {
            $target
              .addClass("jmobile-action-in-progress")
              .removeClass("jmobile-action-completed");
            e.preventDefault();
            e.stopPropagation();
            e.stopImmediatePropagation();
            handleCamera(e);
          }
        }
        if ($target.closest(".icon-close").length) {
          $target
            .addClass("jmobile-action-in-progress")
            .removeClass("jmobile-action-completed");
          e.preventDefault();
          e.stopPropagation();
          e.stopImmediatePropagation();
          var $currentForm = $(e.target).closest("form");
          $currentForm.removeData("jalios-form-file");
          $currentForm.removeClass("adding-picture-file");
          $currentForm.find(".imagepreview").remove();
          $currentForm.find(".microBlogging-galery").show();
          $currentForm.find(".microBlogging-camera").show();
        }
        if (
          $target.closest(
            ".pub-filedocument-file-details ~",
            ".jmobile-download-action"
          ).length ||
          (typeof $target.attr("download") !== typeof undefined &&
            $target.attr("download") !== false)
        ) {
          var dataDocInfo = $target.data("jalios-document-info");
          if (typeof dataDocInfo !== "undefined") {
            $target
              .addClass("jmobile-action-in-progress ui-disabled")
              .removeClass("jmobile-action-completed");
            e.preventDefault();
            e.stopImmediatePropagation();
            $.mobile.loading("show", { textVisible: false });
            downloadFile(
              $target.context.href,
              dataDocInfo.title,
              dataDocInfo.contentType
            );
          }
        }
        if ($target.closest(".js-export-contact").length) {
          $target
            .addClass("jmobile-action-in-progress")
            .removeClass("jmobile-action-completed");
          e.preventDefault();
          e.stopImmediatePropagation();
          saveContact(e);
        }
        if (
          $target.closest('[rel="external"]', '[target="_blank"]').length ||
          $target.closest('[rel="external"], [target="_blank"]').length > 0 ||
          $target.attr("target") == "_blank"
        ) {
          // Standard behavior for context menus e.g. open drop down menus
          if (
            $target.data("jalios-jmobile-default") == null &&
            $target.data("jalios-ctxmenu") == null &&
            $target.closest("button").data("jalios-jmobile-default") == null &&
            $target.closest("button").data("jalios-ctxmenu") == null
          ) {
            $target
              .addClass("jmobile-action-in-progress")
              .removeClass("jmobile-action-completed");
            e.preventDefault();
            e.stopImmediatePropagation();
            $.jalios.smartPhone.openExternalLinks(
              $target.closest("a").attr("href")
            );
          }
        }
      }
    });

    // Turn off Ajax calls by default on login forms (header/footer) to allow SSO connections.
    $(
      ".ui-mobile:not(.login-ajax-enabled) #login .login-form-header form, .ui-mobile:not(.login-ajax-enabled) #login .login-form-footer form"
    ).attr("data-ajax", "false");
  };

  $(document).ready(registerDomReadyForMobileApp);
})(window.jQuery);
