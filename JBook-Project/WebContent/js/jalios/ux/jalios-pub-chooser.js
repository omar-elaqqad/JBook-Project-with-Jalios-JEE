// Prevent dropzone to search for upload elements
// WARNING : strict mode has to be removed on IE 11 dropzone.js file to avoid js errors
Dropzone.autoDiscover = false;
!(function ($) {
  let PUB_ITEM_TEMPLATE;
  let isDropEnabled = false;

  var uploadCleaner;
  var initializeUploadCleaner = function () {
    uploadCleaner = setInterval(function () {
      if ($(".upload-previews-body .explorer-item-data.dz-error").length === 0 && $(".upload-previews-body .explorer-item-data:not(.dz-complete)").length === 0) {
        $(".upload-previews").removeClass("is-displayed");
        unbindUnload();
        clearInterval(uploadCleaner);
      }
    }, 3000);
  }

  const dropzoneCommonParams = {
    url: "jcore/pubchooser/handlePubChooserAction.jsp",
    paramName: "documents",
    clickable: false,
    autoQueue: false,
    params: {
      opUpload: true
    },
    uploadprogress: function (file, progress, bytesSent) {
      if (file.previewElement) {
        var progressElement = file.previewElement.querySelector(".dz-progress");
        progressElement.querySelector(".dz-upload").style.width = progress + "%";
        progressElement.querySelector(".progress-text").textContent = Math.round(progress) + "%";
      }
    },
    previewTemplate: document.querySelector("#template-container").innerHTML,
    previewsContainer: ".upload-previews-body",
    init: function () {
      this.on("addedfile", function (file) {
        file.accepted = true;
        this.enqueueFile(file);
        $(".upload-previews").addClass("is-displayed");
        initializeUploadCleaner();
      });
      this.on("error", function (event, errorMessage, xhr) {
      });
      this.on("queuecomplete", function (event) {

      });
      this.on("sending", function (file, xhr, formData) {
        formData.append("documentWorkspace", $(".chooser-navbar :input[name=chooserWorkspace]").val());
        formData.append("documentSuperClass", $(".add-button-wrapper").data("jalios-pubchooser-supertype"));
      });

      this.on("success", function (event) {
        window.scrollTo(0, 0);
        //Clean up some fields : 
        $("[name=mids],[name=gids], [name=text]").val("");
        $(".pub-chooser-results").refresh({
          isform: true
        });
        $(".dropzone-full").addClass("hide");

        var uploadStatus = JSON.parse(event.xhr.response);
        if (uploadStatus.actionStatus === "ERROR") {
          $(event.previewElement).find(".dz-progress").remove();
          $(event.previewElement).find(".dz-error-message > SPAN").text(uploadStatus.message);
          $(event.previewElement).removeClass("dz-success").removeClass("dz-complete").addClass("dz-error");
        } else {
          var dataId = JSON.parse(event.xhr.response).data.dataId;
          setTimeout(function () {
            $(event.previewElement).remove();
          }, 7000);
        }

      });
      this.on("dragover", function (event) {

      });
      this.on("dragleave", function (event) {
        $(".dropzone-full").addClass("hide");
        $(".dropzone-full-forbidden").addClass("hide");
      });
    }
  }



  const initDropzone = function () {
    window.addEventListener('dragenter', function (e) {
      if ($(".modal.in").exists()) {
        return;
      }
    
      if (isDropEnabled) {
        $(".dropzone-full").removeClass("hide");
      } else {
        $(".dropzone-full-forbidden").removeClass("hide");
      }
    });

    $(".dropzone-full-forbidden").on("drop", function (event) {
      event.preventDefault();
      $(".dropzone-full-forbidden").addClass("hide");
    });

    $(".dropzone-full-forbidden").on('dragleave', function (e) {
      $(".dropzone-full-forbidden").addClass("hide");
    });
    let fullDropzone = $(".dropzone-full").dropzone(dropzoneCommonParams)[0].dropzone;
  }

  const refreshNavbar = function () {
    $(".chooser-navbar").refresh({
      isform: true,
      callback: function () {
        $(".select2-enumerate").select2({
          theme: "bootstrap"
        });
        $(".pub-chooser-results .ajax-loading-component").remove();
      }
    });
  };

  const refreshAddButton = function () {
    let formData = $.jalios.Utils.formdata.getFormData(".pub-chooser FORM");
    let data = $.jalios.Utils.formdata.getFormDataAsJsonObject(formData);

    $(".add-button-wrapper").refresh({
      params: data,
      preventNextRefresh: true,
      callback: function () {
        isDropEnabled = !$(".add-button-wrapper").is(":empty") ? $(".add-button-wrapper").data("jalios-pubchooser-drop-enabled") : false;
      }
    });

  };

  const handleBodyRefresh = function (event) {
    if (event.refresh.type === "serialize") {
      if ($(event.refresh.target).hasClass("pub-chooser-results") && !event.refresh.options.showMore) {
        //Reset start
        $(".js-chooser-pager-start").val(0);
        window.scrollTo(0, 0);
      }
      return;
    }

    if (event.refresh.type === "before") {
      if (event.refresh.url === "jcore/pubchooser/pubChooserInner.jsp") {
        $(".pub-chooser-results").displayLoading();
      }
      if (event.refresh.options.fieldAutocomplete) {
        //Reset start
        event.refresh.options.params.start = 0;
        $(".js-chooser-pager-start").val(0);
        window.scrollTo(0, 0);
      }
    }

    if (event.refresh.type === "after") {
      if (!$(".pub-chooser").hasClass("has-hidden-filters")) {
        $(".show-more-filter").addClass("dropup");
      }


      $(".select2-enumerate").select2({
        theme: "bootstrap"
      });

      if ($(event.refresh.target).hasClass("pub-chooser-results")) {
        initIntersectionObserver();
        $(".pub-chooser-results .ajax-loading-component").remove();
        refreshAddButton();
      }
      if (event.refresh.url === "jcore/pubchooser/pubChooserInner.jsp") {
        if ($("TR.is-selectable").length > 0) {
          $(".table-chooser").removeClass("hide");
          $(".no-result-wrapper").addClass("hide");
        } else {
          $(".table-chooser").addClass("hide");
          $(".no-result-wrapper").removeClass("hide");
        }
      }
      return;
    }
  };

  const initIntersectionObserver = function () {
    if ("IntersectionObserver" in window) {
      observer = new IntersectionObserver(onIntersection, config);
      $(".btn-show-more").each(function (idx, element) {
        observer.observe(element);
      });
    }
  };

  const config = {
    rootMargin: "100px 0px",
    threshold: 0.01
  };

  const onIntersection = function (elements) {
    elements.forEach(function (element) {
      if (element.intersectionRatio > 0) {
        observer.unobserve(element.target);
        $(element.target).refresh({
          showMore: true,
          callback: function () {
            initIntersectionObserver();
          }
        });
      }
    });
  };

  const handleChooserAction = function (event) {
    let $tableItem = $(event.currentTarget).closest("TR");
    let action = $(event.currentTarget).data("jalios-chooser-action");
    let dataId = $tableItem.data("jalios-data-id");
    let dataLabel = $tableItem.find(".js-label").text();
    let dataUrl = $tableItem.find(".js-dataurl").prop("href");

    switch (action) {
      case "toggleFilters":
        $(".pub-chooser").toggleClass("has-hidden-filters");
        $(".show-more-filter").toggleClass("dropup");
        break;
      case "pubChooserMultipleInsertCheckbox":
        event.stopPropagation();
        if ($tableItem.hasClass("active")) {
          $tableItem.removeClass("active");
          $(".multi-select-values-wrapper .pub-item[data-jalios-data-id=" + dataId + "]").remove();
        } else {
          $tableItem.addClass("active");
          $(".multi-select-values-wrapper").append(
            PUB_ITEM_TEMPLATE({
              dataId: dataId,
              dataLabel: dataLabel
            })
          );
        }
        break;
      case "pubChooserMultipleInsert":
        event.preventDefault();

        if ($tableItem.hasClass("active")) {
          $tableItem.removeClass("active");
          $tableItem.find(".multiple-check").prop("checked", false);
          $(".multi-select-values-wrapper .pub-item[data-jalios-data-id=" + dataId + "]").remove();
        } else {
          $(".multi-select-values-wrapper").append(
            PUB_ITEM_TEMPLATE({
              dataId: dataId,
              dataLabel: dataLabel
            })
          );
          $tableItem.addClass("active");
          $tableItem.find(".multiple-check").prop("checked", true);
        }
        break;
      case "multipleInsert":
        let ids = [];
        $(".multi-select-values-wrapper .pub-item").each(function (idx, element) {
          ids.push($(element).data("jalios-data-id"));
        });
        $.jalios.Browser.callback(ids.join(" "), $(event.currentTarget).data("jalios-insert-label"), undefined, undefined);
        window.close();
        break;
      case "removeItem":
        dataId = $(event.currentTarget).data("jalios-data-id");
        $(event.currentTarget).closest(".pub-item").remove();
        $(".table-chooser tr[data-jalios-data-id=" + dataId + "]").removeClass("active");
        $(".table-chooser tr[data-jalios-data-id=" + dataId + "] .multiple-check").prop("checked", false);
        break;
      case "resetSearch":
        event.preventDefault();
        $(".pub-chooser-search").val("");
        window.scrollTo(0, 0);
        $(".pub-chooser-results").refresh({
          isform: true
        });
        break;
      case "unifiedInsertSelect":
        event.preventDefault();
        $.jalios.UnifiedInsert.insertLink(dataId, true);
        break;
      case "jsFuncInsert":
        event.preventDefault();
        // Specific case for namespace functions, we need to operate on opener like this : window["My"]["Namespace"]["functionName"](arguments);
        executeFunctionByName($(".js-func").val(), window.opener, dataId, dataLabel, dataUrl);
        window.close();
        break;
      case "pubChooserInsert":
        event.preventDefault();
        JcmsLogger.info("insertLink", dataId, dataLabel, dataUrl);
        $.jalios.Browser.callback(dataId, dataLabel, undefined, dataUrl);
        window.close();
        break;
      default:
    }
  };

  const executeFunctionByName = function (functionName, context /*, args */) {
    var args = Array.prototype.slice.call(arguments, 2);
    var namespaces = functionName.split(".");
    var func = namespaces.pop();
    for (var i = 0; i < namespaces.length; i++) {
      context = context[namespaces[i]];
    }
    return context[func].apply(context, args);
  };

  const register = function () {
    $(document).on("click", "[data-jalios-chooser-action]", handleChooserAction);
    $(document).on("click", ".pub-chooser-author", function(event) {
      event.preventDefault();
    });
    $(".select2-enumerate").select2({
      theme: "bootstrap"
    });
    initIntersectionObserver();
    $(document).on("jalios:refresh", handleBodyRefresh);
    initDropzone();
    $(document).on("click", ".close-preview", function (event) {
      $(".upload-previews").removeClass("is-displayed");
    });
    isDropEnabled = $(".add-button-wrapper").exists() ? $(".add-button-wrapper").data("jalios-pubchooser-drop-enabled") : false;
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function () {
    register();
    if ($("#pub-item").exists()) {
      PUB_ITEM_TEMPLATE = Handlebars.compile($("#pub-item").html());
    }
  });
})(window.jQuery);
