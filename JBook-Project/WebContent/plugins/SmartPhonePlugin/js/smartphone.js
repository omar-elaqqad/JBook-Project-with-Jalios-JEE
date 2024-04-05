!(function ($) {
  // ------------------------------------------
  //  METHODS
  // ------------------------------------------

  var methods = {
    prefetchLinks: function () {
      $('.ajax-action[data-prefetch="true"]').each(function () {
        $.mobile.loadPage($(this).data("jalios-ajax-action"), {
          showLoadMsg: false,
        });
      });
    },
  };

  /**
   * Return the value of data-jalios-autodivider-value on given element
   * Fallbacks on first letter of the text if none data attribute is found
   */
  var autodividersSelector = function (elt) {
    var autodividerValue = elt.data("jalios-autodivider-value");
    if (autodividerValue) {
      return autodividerValue;
    } else {
      return defaultAutodividersSelector(elt);
    }
  };

  /**
   * Return the first letter of the text of the given element
   */
  var defaultAutodividersSelector = function (elt) {
    // look for the text in the given element
    var text = $.trim(elt.text()) || null;

    if (!text) {
      return null;
    }

    // create the text for the divider (first uppercased letter)
    text = text.slice(0, 1).toUpperCase();

    return text;
  };

  // ------------------------------------------
  //  PAGEINIT BINDING
  // ------------------------------------------

  /**
   * Performs the AJAX request for autocomplete, and displays the results in filterable
   *
   * @param e the event. unused.
   * @param data Object containing parameters:
   *      * "input": selector for the input that filters the results
   * @param target optionnal. jQuery object that can be used to override "this"
   */
  var listAutocompleteAjax = function (e, data, target) {
    var $ul = target ? target : $(this),
      $input = $ul.closest(".ui-page").find(data.input),
      value = $input.val(),
      html = "";
    $ul.html("");

    $ul.addClass("is-autocomplete-initialize");

    var minCharsData = $ul.data("jalios-autocomplete-minchar");
    var minChars = minCharsData === undefined ? 2 : minCharsData;

    var form = $ul.closest(".ui-page").find($ul.data("input")).closest("FORM");

    if (minChars === 0 || (value && value.length > minChars)) {
      var params = $.jalios.smartPhone.Ajax.resolveParams(undefined, form);
      var processAjaxData = true;
      if (params instanceof FormData) {
        processAjaxData = false;
      }

      $(".ui-loader").loader("show");
      $.ajax({
        url: $ul.data("jalios-autocomplete"),
        data: params,
        processData: processAjaxData,
        contentType: $.jalios.smartPhone.Ajax.resolveAjaxRefreshContentType(
          processAjaxData
        ),
        type: $.jalios.smartPhone.Ajax.resolveMethod(undefined, form),
      }).then(function (response) {
        $ul.html(response);
        //Trigger event after performing ajax request
        $.jalios.smartPhone.Util.trigger("after", e, $ul, "", "");
        handleExternalLinks($.mobile.activePage);
        
        /* Remove list dividers when there is only one result (used for the case when the "No results" message is displayed) */
        var numberOfLiInResponse = $($.parseHTML(response)).filter("LI").length;
        if (numberOfLiInResponse <= 1) {
          $ul.listview("option", "autodividers", false);
        } else {
          $ul.listview("option", "autodividers", $ul.data("autodividers"));
        }

        $.jalios.smartPhone.Util.enhanceComponent($ul);
        $(".ui-loader").loader("hide");
      });
    } else {
      // RESET AUTOCOMPLETE
      var params = $.jalios.smartPhone.Ajax.resolveParams(undefined, form);
      $(".ui-loader").loader("show");

      $.ajax({
        url: $ul.data("jalios-autocomplete"),
        data: params,
        processData: !(params instanceof FormData),
        contentType: $.jalios.smartPhone.Ajax.resolveAjaxRefreshContentType(
          !(params instanceof FormData)
        ),
        type: "post",
      }).then(function (response) {
        $ul.html(response);
        //Trigger event after performing ajax request
        $.jalios.smartPhone.Util.trigger("after", event, $ul, "", "");
        $.jalios.smartPhone.Util.enhanceComponent($ul);
        $(".ui-loader").loader("hide");
      });
    }
  };

  var handleAjaxRefresh = function (event) {
    event.preventDefault();

    $(document.activeElement).blur();

    var $target = $(event.target).hasClass("ajax-refresh")
      ? $(event.target)
      : $(event.target).closest(".ajax-refresh");
    var target = $target.get(0);

    //Avoid multiple submissions
    if (!target.submitting) {
      target.submitting = true;
    } else {
      return;
    }

    $target.refresh();
  };

  /**
   * On event.target, updates the params in form enclosing "data-jalios-target"
   * with the parameters in "data-jalios-params"
   *
   */
  var handleAutocompleteRefresh = function (event) {
    var params = $(event.target).data("jalios-ajax-params");
    var target = $(event.target).data("jalios-ajax-target");

    var $target = $(target);

    var $form = $($target.data("input")).closest("FORM");

    for (var param in params) {
      var paramElement = $form.find("[name=" + param + "]");

      if (paramElement.length > 0) {
        paramElement.val(params[param]);
      } else {
        $form.append(
          '<input type="hidden" name="' +
            param +
            '"value="' +
            params[param] +
            '" />'
        );
      }
    }

    $(".ui-popup").popup("close");

    listAutocompleteAjax(
      event,
      {
        input: $form.find(".ui-input-search input"),
      },
      $target
    );
  };

  // ------------------------------------------
  //  DOM READY BINDING
  // ------------------------------------------

  // Register click callback
  // Needs to be cleaned to avoid using of bind off / on (Use link instead)
  // Use functions if you have to use off / on
  var handleClickable = function (event) {
    event.stopPropagation();

    var $element = $(event.target);

    var $linkWrapper = $element.closest("A");

    if ($linkWrapper.length && !$linkWrapper.hasClass("clickable")) {
      return;
    }

    var $clickable = $element.closest(".clickable");

    $(":mobile-pagecontainer").pagecontainer(
      "change",
      $clickable.data("jalios-link"),
      {
        transition: $clickable.data("transition"),
      }
    );
  };

  var handleToggle = function (event) {
    var $element = $(event.currentTarget);
    var target = $element.data("jalios-target");
    var toggle = $element.data("jalios-toggle");

    // If we are in a ctx menu, close it
    let $ctxMenu = $element.closest(".topbar-menu-dropdown");
    if ($ctxMenu.length) {
      $ctxMenu.popup("close");
    }

    $(target).each(function () {
      if ($(this).hasClass(toggle)) {
        $(this).removeClass(toggle);
      } else {
        $(this).addClass(toggle);
      }
      $.jalios.smartPhone.Util.smartFocus(event);
    });
    return;
  };

  //Removes .unread class on tap event
  // TODO maybe we need a data-jalios-remove-class-ontap="MYCLASS"
  var handleUnread = function (event) {
    var $element = $(event.target);
    $element
      .closest("LI")
      .removeClass("list-item-unread")
      .addClass("list-item-read");
    return;
  };

  var handleCustomTopbarActions = function (ui) {
    // For custom actions that developer can include in pages: copy to topbar. See calendar.jsp service for an example
    $(".topbar .ui-bar .topbar-right").html("");
    $(".topbar .ui-bar .topbar-right").append(
      ui.toPage.find(".topbar-actions").html()
    );
  };

  var handleSmartphoneGoogleMaps = function (ui) {
    if (!ui || !ui.toPage) {
      return;
    }
    $(".smartphone-google-map", ui.toPage).each(function (index, elem) {
      var $elem = $(elem);
      var geocodingUrl = $elem.data("jalios-geocoding-url");
      var mapUrl = $elem.data("jalios-map-url");
      var staticMapUrl = $elem.data("jalios-static-map-url");

      if (geocodingUrl && mapUrl && staticMapUrl) {
        $.ajax({
          url: geocodingUrl,
        }).then(function (response, textStatus) {
          if (
            textStatus === "success" &&
            typeof response === "object" &&
            response.status === "OK"
          ) {
            $elem.append(
              '<a href="' +
                mapUrl +
                '" data-ajax="false"><img class="center-block" src="' +
                staticMapUrl +
                '" alt=""/></a>'
            );
          }
        });
      }
    });
  };

  var handleConfirm = function (event) {
    var openJConfirm = function () {
      $.jConfirm(
        jaliosSettings["confirm-dialog-text"],
        jaliosSettings["confirm-dialog-title"],
        function (result) {
          handleConfirmOK(result, $element, event);
        }
      );
    };
    event.preventDefault();
    var $element = $(event.target);

    if ($element.closest(".ui-popup").length !== 0) {
      $(document).one("popupafterclose", openJConfirm);
      $(".ui-popup").popup("close");
    } else {
      openJConfirm();
    }

    return false;
  };

  var handleAjaxAction = function (event) {
    event.preventDefault();

    var $target = $(event.target).hasClass("ajax-action")
      ? $(event.target)
      : $(event.target).closest(".ajax-action");
    var target = $target.get(0);

    //Avoid multiple submissions
    if (!target.submitting) {
      target.submitting = true;
    } else {
      return;
    }

    $(":mobile-pagecontainer").pagecontainer("change", $target.attr("href"), {
      transition: "",
      data: $.jalios.smartPhone.Ajax.resolveParams($target),
      changeHash: false,
    });

    return false;
  };

  /**
   * Save / Restore scroll position
   */
  var saveScrollPos = function () {
    //save scrolltop position to restore
    let scrollTop = $(".ui-page-active").scrollTop();
    $(".ui-page-active:jqmData(role='page')").data("last-scrolltop", scrollTop);
  };
  var restoreScrollPos = function () {
    let $activePage = $(".ui-page-active:jqmData(role='page')");
    let lastScrollPos = $activePage.data("last-scrolltop");
    if (lastScrollPos) {
      $activePage.scrollTop(lastScrollPos);
    } else {
      $activePage.scrollTop(0);
    }
  };

  var handleScrollingTouch = function () {
    //Ensure proper values for scrolling touch (avoid conflicts with menus)
    $(".ui-page").addClass("scrolling-touch");
    $(".ui-popup").on("popupbeforeposition", function (event, ui) {
      $(".ui-page").removeClass("scrolling-touch");
    });

    $(".ui-popup").on("popupafterclose", function (event, ui) {
      $(".ui-page").addClass("scrolling-touch");
    });
  };

  /**
   * Add a rel="external" attribute and a target="_blank" to all external links
   */
  var handleExternalLinks = function (toPage) {
    if (!toPage) {
      return;
    }

    $("a", toPage).each(function () {
      var $element = $(this);
      var a = new RegExp("/" + window.location.host + "/");
      if (
        this.href &&
        !this.href.startsWith("tel:") &&
        !this.href.startsWith("sms:") &&
        !this.href.startsWith("mailto:") &&
        !this.href.startsWith("#") &&
        !a.test(this.href) &&
        !$element.is('[rel="external"]')
      ) {
        $element.attr("target", "_blank");
        $element.attr("rel", "external");
      }
    });
  };

  /**
   * Manages photo actions (e.g. click to view in full screen)
   */
  var handlePhotoActions = function () {
    if (
      $(".pub-dataimage:not(.handler-photo-actions)")
        .parent()
        .hasClass("preview")
    ) {
      $(".pub-dataimage:not(.handler-photo-actions) img")
        .addClass("handler-photo-actions")
        .on("tap", function (e) {
          var pswpElement = $(".pswp")[0];
          var items = [
            {
              src: $(".pub-dataimage img").attr("src"),
              w: e.target.width,
              h: e.target.height,
            },
          ];
          var options = {
            // start at first slide
            index: 0,
            fullscreenEl: false,
            shareEl: false,
          };
          var gallery = new PhotoSwipe(
            pswpElement,
            PhotoSwipeUI_Default,
            items,
            options
          );
          gallery.init();
        });
    }

    // Zoomable images on wiki and wysiwyg
    $(".zoomable-images:not(.handler-photo-actions) IMG")
      .addClass("handler-photo-actions")
      .on("tap", function (event) {
        if (!$(".zoomable-images IMG").parent().is("a")) {
          var pswpElement = $(".pswp")[0];
          var items = [
            {
              src: $(event.target).attr("src"),
              w: event.target.width,
              h: event.target.height,
            },
          ];
          var options = {
            // start at first slide
            index: 0,
            fullscreenEl: false,
            shareEl: false,
          };
          var gallery = new PhotoSwipe(
            pswpElement,
            PhotoSwipeUI_Default,
            items,
            options
          );
          gallery.init();
        } else {
          window.location = $(".zoomable-images IMG").parent().attr("href");
        }
      });

    // handle photo closing event.
    $(document).on("tap", ".pswp__button--close", function (event) {
      event.stopImmediatePropagation(); //avoid conflicts with other menus.
      event.preventDefault();
    });
  };

  /**
   * Add search service input text value on the href attribute to access search desktop service
   */
  var handleSearchAppend = function (event) {
    event.preventDefault();
    var inputValue = $(".search-topbar-desktop-input").val();
    var linkHref = $(event.target).attr("href");
    window.open(linkHref + inputValue);
  };

  /**
   * Handle the confirm if user has chosen OK
   */
  var handleConfirmOK = function (result, $element, event) {
    if (!result) {
      return;
    }

    if ($element.hasClass("ajax-action")) {
      handleAjaxAction(event);
    } else if ($element.hasClass("ajax-refresh")) {
      handleAjaxRefresh(event);
    } else if ($element.is("A")) {
      //TODO constant
      var externalRegexp = /^https?:\/\//i;

      var link = $element.attr("href");
      if (externalRegexp.test(link)) {
        window.open(link);
      } else if ($element.data("ajax") == false) {
        window.open(link, "_self");
      } else {
        $(":mobile-pagecontainer").pagecontainer("change", link);
      }
    }
  };

  /**
   * Update recommendation select color depending on recommendation level
   */
  var handleRecommendationColor = function (event) {
    var $target = $(event.target);
    console.log($(event.target));
    console.log($(event.target).find(":selected"));
    var btnClass = $target
      .find(":selected")
      .data("jalios-ui-btn-recommendation-level");
    var $wrapper = $target.closest(".recommendation-level-wrapper");
    $wrapper
      .removeClass("ui-btn-alert-level-info")
      .removeClass("ui-btn-alert-level-action")
      .removeClass("ui-btn-alert-level-warning");
    $wrapper.addClass(btnClass);
  };

  //Manage homepage dom cache expiration
  var homepageSelector = function () {
    return $("div:jqmData(role='page')").filter(".index-portal").first();
  };
  var homePageOutdated = function () {
    let pageOutdated = true;

    //Check for dom expiration on (currently active) homepage
    let $homepage = homepageSelector();
    if ($homepage.attr("dom-cache-expiration")) {
      let nowDate = new Date();

      if (!$homepage.attr("dom-cache-last")) {
        $homepage.attr("dom-cache-last", nowDate.toString());
      } else {
        let cacheLastDate = new Date($homepage.attr("dom-cache-last"));
        let secondsSinceCached =
          (nowDate.getTime() - cacheLastDate.getTime()) / 1000;

        if (secondsSinceCached < $homepage.attr("dom-cache-expiration")) {
          pageOutdated = false;
        }
      }
    }

    return pageOutdated;
  };

  var navigateToPage = function (forceClearCache, page) {
    let clearCache = homePageOutdated() || forceClearCache;
    let targetPage = page || "plugins/SmartPhonePlugin/jsp/index.jsp";

    $(":mobile-pagecontainer").pagecontainer("change", targetPage, {
      reload: clearCache,
    });

    if (clearCache) {
      // update latest cache use
      let $homepage = homepageSelector();
      $homepage.attr("dom-cache-last", new Date().toString());
    }
  };

  // ------------------------------------------
  //  REGISTER
  // ------------------------------------------

  var registerDomReady = function () {
    $(document).on("change", ".ui-flipswitch", function () {
      event.stopPropagation();
      event.preventDefault();
    });

    $(document).on("tap", ".bottom-nav .bottom-nav-item-home.active", function (
      event
    ) {
      $(".ui-page-active").scrollTop(0);
    });

    /**
     * If user tap on home, we want to remove last-scrolltop data
     * to prevent scroll top to be restored
     */
    $(document).on("tap", ".bottom-nav .bottom-nav-item-home", function (
      event
    ) {
      $(".index-portal").removeData("last-scrolltop");
    });

    $(document).on(
      "change",
      ".pub-action-recommend-page .recommendation-level-select",
      handleRecommendationColor
    );
    $(document).on("tap", ".clickable", handleClickable);
    $(document).on("tap", ".toggle", handleToggle);
    $(document).on("tap", ".readable", handleUnread);
    $(document).on(
      "tap",
      ".ajax-autocomplete-refresh",
      handleAutocompleteRefresh
    );
    $(document).on("tap", ".confirm", handleConfirm);
    $(document).on("tap", ".ajax-action:not(.confirm)", handleAjaxAction);
    $(document).on("tap", ".search-topbar-desktop-link", handleSearchAppend);
    $(document).on("tap", ".toc A", function (event) {
      event.stopPropagation();
      var $link = $(event.target);
      var n = $link.attr("href").indexOf("#");
      var elementId = $link
        .attr("href")
        .substring(n, $link.attr("href").length);
      var topbarHeight = $(".topbar").height() + 5;
      $("html, body").animate(
        {
          scrollTop: $(elementId).offset().top - topbarHeight,
        },
        500
      );
    });
    $(document).on("tap", ".nohistory", function () {
      event.stopPropagation();
      $.mobile.changePage($(event.target).attr("href"), {
        changeHash: false,
      });
    });

    // For external topbar. See http://demos.jquerymobile.com/1.4.3/toolbar-external/
    $("[data-role='header'], [data-role='footer']").toolbar();

    // Init the imageUploader
    $(document).on("tap", ".uploader-preview-clear", function (event) {
      // Show upload image icons from the mobile app
      if ($.jalios.smartPhone.isMobileApp()) {
        $(".upload-image-action-icon").show();
      }

      var uploaderPreviewWrapper = $(event.target).closest(
        ".uploader-preview-wrapper"
      );
      var uploadWrapper = uploaderPreviewWrapper.prev();

      // display file input again
      uploadWrapper.removeClass("hide");

      // reset file input. See http://stackoverflow.com/questions/1043957/clearing-input-type-file-using-jquery/13351234#13351234
      // Input must be put in a form in order to be reset, and we want to avoid the reset of the whole form
      var fileInput = uploadWrapper.find("INPUT");
      fileInput.wrap("<form>").closest("form").get(0).reset();
      fileInput.unwrap();
      // remove stored canvas on the file input element
      fileInput.removeData("image-data-content");

      // Remove thumbnail
      uploaderPreviewWrapper.remove();
    });

    // AJAX Refresh
    $(document).on(
      "change",
      "SELECT.ajax-refresh, INPUT[type=radio].ajax-refresh",
      handleAjaxRefresh
    );

    $(document).on(
      "tap",
      "A.ajax-refresh, BUTTON.ajax-refresh, input[type=submit].ajax-refresh",
      function (event) {
        var $that = $(this);
        $that.submitting = false;
        handleAjaxRefresh(event);
      }
    );

    $(document).on("jalios:refresh", function (event) {
      if (event.broker.type === "before") {
        $(".ui-page-active").addClass("no-focus"); //avoid scroll to top on ios
        saveScrollPos();
      }

      if (event.broker.type === "after") {
        restoreScrollPos();
        $(".ui-page-active").removeClass("no-focus");
      }
    });

    // Smartfocus on expand
    $(document).on("collapsibleexpand", $.jalios.smartPhone.Util.smartFocus);

    // Return to home and clean DOM cache on click on "Home"
    $(document).on("tap", ".home-link", function (event) {
      // prevent bug when accessing directely a page other than index.jsp (e.g. alert.jsp)
      event.preventDefault();

      //
      $(document).one("pagecontainerchange", function () {
        // Activate first tab and remove "active" class on previous tabs (or the previous tabs will remain blue as well)
        $(".ui-tabs")
          .tabs({
            active: 0,
          })
          .find(".ui-btn-active")
          .removeClass("ui-btn-active");

        // Clean DOM cache
        $(".ui-page:not(.ui-page-active)").remove();
      });

      // Navigate to home
      navigateToPage();
    });
  };

  var registerPageCreate = function (event) {
    var page = event.target;
    $(".ajax-autocomplete", page).on(
      "filterablebeforefilter",
      listAutocompleteAjax
    );

    // Do not filter if it is an AJAX autocomplete
    $(".ajax-autocomplete", page).each(function () {
      $(this).filterable("option", "filterCallback", function () {
        return false;
      });
    });

    // Init the imageUploader
    $.jalios.smartPhone.Util.initImageUploader(page);
  };

  var registerMobileInit = new (function () {
    $.mobile.listview.prototype.options.autodividersSelector = function (elt) {
      return autodividersSelector(elt);
    };
  })();

  var registerPagebeforeshow = function (event, ui) {
    // handle footer active state
    if ($(".bottom-nav").size() > 0) {
      let currentUrl = window.location.pathname;
      $(".bottom-nav-item")
        .removeClass("active")
        .each(function (idx, element) {
          let itemUrl = $(element).prop("href");
          if (itemUrl.endsWith(currentUrl)) {
            $(element).addClass("active");
          }
        });
    }
    // Hide or display back button if necessary.
    // Code copied from jQM 1.4.5 "mobile.toolbar"'s "_updateBackButtod" method
    var isFirstPageInHistory =
      $.mobile.navigate &&
      $.mobile.navigate.history &&
      $.mobile.navigate.history.activeIndex === 0;
    var forceHideBackLink =
      ui && ui.toPage && ui.toPage.data("jalios-force-hide-back-btn");

    if (isFirstPageInHistory || forceHideBackLink) {
      $(".ui-toolbar-back-btn").addClass("hide");
      $("BODY").removeClass("is-back-btn-displayed");
      //      // Handle Home btn
      //      var parsedUrl = new URL(window.location.href);
      //      if (parsedUrl.pathname.endsWith("plugins/SmartPhonePlugin/jsp/index.jsp")) {
      //        $(".ui-toolbar-home-btn").addClass("hide");
      //      } else {
      //        $(".ui-toolbar-home-btn").removeClass("hide");
      //      }
    } else {
      $(".ui-toolbar-back-btn").removeClass("hide");
      $("BODY").addClass("is-back-btn-displayed");
    }

    handleCustomTopbarActions(ui);

    handleSmartphoneGoogleMaps(ui);

    handleExternalLinks(ui.toPage);

    handlePhotoActions();

    // Auto tabs enhancement when navigating to pages containing tabs with "local" content (not loaded with AJAX) is not working
    // Loading needs to be defered (data-role="none") and enhanced later.
    if (ui && ui.toPage) {
      $(
        ".defered-tabs-enhancement",
        ".defer-tabs-enhancement",
        ui.toPage
      ).tabs();
    }

    // Display background image only on main page
    if (ui.toPage.attr("id") === "index-default") {
      $("HTML").addClass("app-background-image-enabled");
    } else {
      $("HTML").removeClass("app-background-image-enabled");
    }
    restoreScrollPos();

    handleScrollingTouch();
    
    // Handle anchors in wysiwyg
    ui.toPage.find(".wysiwyg A").each(function(idx, element) {
      let url = $(element).prop("href");
      if (url && url.indexOf("#") > 0) {
        var hash = url.substring(url.indexOf("#")+1);
        if (hash) {
          try {
            if (ui.toPage.find(".wysiwyg #" + hash).length > 0) {
              $(element).addClass("anchor-link");
              $(element).on("tap", function(event) {
                var target = $("#" + hash).get(0).offsetTop;
                $(".ui-page-active").scrollTop(target);
              });
            }
          } catch(e) {
            //TODO
          }
        }
      }      
    });
  };

  var handleCenteredNoResult = function () {
    // Handle centered no result
    /*if ($(".ui-page-active .no-result.is-centered").length > 0) {
      let topbarHeight = $(".topbar").height();
      let bottomBarHeight = $(".bottom-nav").height();
      let navbarHeight = $(".ui-page-active .ui-navbar").height();
      let navTabsHeight = $(".ui-page-active .nav-tabs").height();

      let bodyHeight = window.innerHeight - (topbarHeight + bottomBarHeight + navbarHeight + navTabsHeight);
      $(".ui-page-active .ui-content").css("height", bodyHeight);
      $(".ui-page-active .ui-content").addClass("centered-no-result");
    } else {
      $(".ui-page-active .ui-content").removeClass("centered-no-result");
    }*/
  };

  let pullToRefreshFactory;

  /**
   * Checks if pull to refresh should be enabled on the page
   */
  var handlePullToRefresh = function () {
    if ($(".ui-mobile.pull-refresh-disabled").length) {
      return;
    }

    const viewportWidth = Math.max(
      document.documentElement.clientWidth,
      window.innerWidth || 0
    );
    const viewportHeight = Math.max(
      document.documentElement.clientHeight,
      window.innerHeight || 0
    );
    const maxScrollY = 10;

    let $ptrControlModel = $(
      "#mobile-content-wrapper-inner > .pull-to-refresh-material2__control"
    );

    //listen for pulling events + show puller.
    let $pullToRefreshContainer = $(".ui-page-active");
    // skip if pulling container not on page
    if (!$pullToRefreshContainer.length) {
      return;
    }
    // skip if not mobile app
    if (!$.jalios.smartPhone.isMobileApp()) {
      return false;
    }

    //check if pull to refresh container
    if (!$pullToRefreshContainer.is(".pull-to-refresh-wrapper")) {
      $pullToRefreshContainer.addClass("pull-to-refresh-wrapper");
    }

    if (typeof pullToRefreshFactory === "function") {
      pullToRefreshFactory();
    }

    //https://github.com/jiangfengming/pull-to-refresh
    pullToRefreshFactory = pullToRefresh({
      //  scrollable : document.querySelector('.ui-page-active'),
      container: document.querySelector(
        ".ui-page-active.pull-to-refresh-wrapper"
      ),
      animates: ptrAnimatesMaterial2,
      threshold: 300,
      onStateChange: function onStateChange(state, opts) {
        if (state === null) {
        } else if (state === "refreshing") {
          $(".ui-mobile").addClass("ptr-loading");
          $(".pull-to-refresh-loading").show();
        } else if (state === "restoring") {
          $(".pull-to-refresh-loading").hide();
          $(".ui-mobile").removeClass("ptr-loading");
        }

        //perform actions or apply styles based on should pull result
        if (state === "manual" && opts.shouldPull) {
          //enable pull to refresh style ; visibility of the pulling div
          if (!$(".pull-to-refresh-wrapper.pull-to-refresh-material2").length) {
            $(".pull-to-refresh-wrapper").addClass("pull-to-refresh-material2");
          }
        } else {
          $(".pull-to-refresh-wrapper").removeClass(
            "pull-to-refresh-material2"
          );
        }
      },
      shouldPull: function shouldPull(e) {
        //enable pull refreshing on dom-cached pages only
        if (
          !$(".ui-page-active[data-dom-cache='true']").length ||
          $pullToRefreshContainer.is(".pull-refresh-disabled") ||
          $pullToRefreshContainer.find(".pull-refresh-disabled").length ||
          $(".ui-mobile.pull-refresh-disabled").length
        ) {
          return false;
        }

        //show pulling near top of page
        if ($(".ui-page-active").scrollTop() >= maxScrollY) {
          return false;
        }

        //Don't pull on tiny pans
        let minPanY = Math.min(15, viewportHeight * 0.02);
        if (e.deltaY < minPanY) {
          return false;
        }

        return true;
      },
      refresh: function refresh() {
        return new Promise((resolve) => {
          $(".ui-page").remove(); //clean dom

          //quickly navigate to target page (passing page params)
          let pathname = window.location.pathname + window.location.search;
          navigateToPage(true, pathname);

          setTimeout(resolve, 1500);
        });
      },
    });

    //copy main control into the wrapper parent
    $(".pull-to-refresh-material2__control").not($ptrControlModel).remove();
    $ptrControlModel.clone().appendTo($(".pull-to-refresh-wrapper"));
  };

  var registerPageshow = function (event, ui) {
    $.jalios.smartPhone.Util.smartFocus(event);
    handleCenteredNoResult();

    restoreScrollPos();
  };

  var registerPagechange = function (event, ui) {
    // Clean the DOM cache when there is no more page in history
    if (
      $.mobile.navigate &&
      $.mobile.navigate.history &&
      $.mobile.navigate.history.stack
    ) {
      var stackLength = $.mobile.navigate.history.stack.length;
      var activeIndex = $.mobile.navigate.history.activeIndex;
      if (stackLength > activeIndex + 1) {
        var numberOfPagesBefore = $(".ui-page").length;
        ui.prevPage.remove();
      }

      var regex = new RegExp("[\\?&]scrollTo=([^&#]*)");
      var results = regex.exec(event.currentTarget.URL);
      if (
        event &&
        event.currentTarget &&
        event.currentTarget.URL &&
        ui &&
        ui.toPage
      ) {
        var anchor =
          results === null
            ? ""
            : decodeURIComponent(results[1].replace(/\+/g, " "));
        if (anchor) {
          var targetElem = $("#" + anchor, ui.toParam);
          if (targetElem.length > 0) {
            var target = targetElem.offset().top - 50; /* Height of topbar */
            $.mobile.silentScroll(target);
          }
        }
      }
    }

    handlePullToRefresh();
  };

  var registerPagebeforechange = function (event, ui) {
    saveScrollPos();
  };

  // ------------------------------------------
  //  INIT
  // ------------------------------------------

  //Bind to "mobileinit" before you load jquery.mobile.js
  $(document).on("mobileinit", registerMobileInit);
  $(document).on("pagecreate", ".ui-page", registerPageCreate);
  $(document).on("pagecontainerbeforeshow", registerPagebeforeshow);
  $(document).on("pagecontainershow", registerPageshow);
  $(document).on("pagecontainerbeforechange", registerPagebeforechange);
  $(document).on("pagecontainerchange", registerPagechange);

  $(document).on(
    "tap",
    ".autocomplete-reset-input + .ui-input-clear",
    function (event) {
      var params = $.jalios.smartPhone.Ajax.resolveParams(
        undefined,
        $(event.currentTarget).closest("FORM")
      );
      $(".ui-loader").loader("show");

      let $clearButton = $(event.currentTarget);

      // Remove the current input value
      params.delete(
        $(
          $clearButton
            .closest(".ui-input-search")
            .find(".autocomplete-reset-input")
        ).attr("name")
      );

      var $ul = $(
        $clearButton
          .closest(".ui-input-search")
          .find(".autocomplete-reset-input")
          .data("jalios-autocomplete-wrapper")
      );
      $.ajax({
        url: $ul.data("jalios-autocomplete"),
        data: params,
        processData: !(params instanceof FormData),
        contentType: $.jalios.smartPhone.Ajax.resolveAjaxRefreshContentType(
          !(params instanceof FormData)
        ),
        type: "post",
      }).then(function (response) {
        $ul.html(response);
        //Trigger event after performing ajax request
        $.jalios.smartPhone.Util.trigger("after", event, $ul, "", "");
        $.jalios.smartPhone.Util.enhanceComponent($ul);
        $(".ui-loader").loader("hide");
      });
    }
  );

  $(document).ready(registerDomReady);

  $(document).on("jalios:refresh", function (event) {
    if (event.broker.type != "after") {
      return;
    }
    $(".ui-page-active .ajax-autocomplete:not(.is-autocomplete-initialize)").on(
      "filterablebeforefilter",
      listAutocompleteAjax
    );
    handleCenteredNoResult();
  });

  $.fn.removeClassStartingWith = function (filter) {
    $(this).removeClass(function (index, className) {
      return (
        className.match(new RegExp("\\S*" + filter + "\\S*", "g")) || []
      ).join(" ");
    });
    return this;
  };
})(window.jQuery);
