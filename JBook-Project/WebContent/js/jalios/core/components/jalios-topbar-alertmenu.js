;( function( $, window, document, undefined ) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  /**
   * Handle a "Mark as read" client action either from level 1 or level 2 menu.
   * Handle a "Mark as unread" client action only available from level 2 menu, when auto read is on.
   */
  var markAsRead = function(event){
    $.console.debug("[alert-topbar-menu]", "markAsRead");
    // Prevent display preview
    event.stopImmediatePropagation();

    var alertId;
    // Read from main-menu (alerts list)
    var $alert = $(event.currentTarget).closest(".alert-menu-item");
    if ($alert.exists()) {
      alertId = $alert.data("jalios-dataid");
    }

    // Read from child-menu (alert preview)
    if (!alertId) {
      var $alertPreview = $(event.currentTarget).closest(".alert-preview");
      var $alertPreviewCard = $alertPreview.find(".alert-card");
      if ($alertPreviewCard.exists()) {
        alertId = $alertPreviewCard.data("jalios-alert-id");
      }
    }
    if (!alertId) {
      return;
    }
    // Ensure we retrieved the main-menu alert
    if (!$alert || !$alert.exists()) {
      $alert = $(".topbar-alert-menu .main-menu .alert-menu-item[data-jalios-dataid="+ alertId +"]");
    }
    // Retrieve alert's level
    var alertLevel = $alert.data("jalios-alert-level");
    // Attach flag to event to indicate alert has been unread while autoRead mode is on
    event.isAutoRead = $.jalios.alert.topbar.isAutoRead(alertLevel);
    if ($(event.currentTarget).hasClass("card-action-item-mark-as-unread")) {
      $.jalios.alert.markAsUnread(alertId, event);
    } else {
      $.jalios.alert.markAsRead(alertId, event);
    }
  }; // markAsRead

  var confirmMarkAllRead = function(event) {
    $.console.debug("[alert-topbar-menu]", "confirmMarkAllRead");

    $.ajax({
      url : $.jalios.alert._ACTION_URL,
      dataType : "json"
    })
    .done(function(data) {
      $.console.debug("[alert-topbar-menu]", "after refreshUnreadInfo (by confirmMarkAllRead)");
      if (!data) {
        return;
      }
      if (data.count === 0) {
        // "You have no unread alerts." (Prevents "Really mark as read 0 alerts?")

        // Hack to close the menu (else, menu remains opened with unread alerts which are in fact already read)
        $(document).click();

        var message = $.jalios.I18N.glp(/*js.*/"alerts.no-unread-alerts");
        toastr.options.timeOut = 2000;
        toastr.options.positionClass = "toast-top-center";
        toastr.info(message);

      } else if (data.count > 0) {
        // Compute customized confirmation message: "Mark {0} alerts as read?"
        var msg = data.count == 1
        ? $.jalios.I18N.glp(/*js.*/"alerts.mark-all-read.confirm", data.count)
        : $.jalios.I18N.glp(/*js.*/"alerts.mark-all-read.confirm-2", data.count);
        // Ask for confirmation
        $.jalios.ui.Modal.confirm(msg, $.jalios.alert.markAllAsRead);
      }
    });
  }; // confirmMarkAllRead

  /**
   * Updates UI after an alert has been read either from list or preview alert.
   */
  var afterRead = function(event) {
    if (!event || !event.alert) { return; }
    if (!event.alert.originalEvent) { return; }
    $.console.debug("[alert-topbar-menu]", "afterRead", "event.alert.type=" + event.alert.type);

    var isAutoRead = event.alert.originalEvent.isAutoRead;

    // Read from LIST
    var $alert;
    if (isAutoRead) {
      $alert = $(event.alert.originalEvent.target).closest(".alert-menu-item");
    } else {
      $alert = $(event.alert.originalEvent.currentTarget).closest(".alert-menu-item");
    }
    if ($alert.exists()) {
      removeMainMenuAlert($alert);
    }

    // Accept alert preview removal only if it has read by user.
    // If read automatically due to "auto read" mode, only remove main menu alert.
    // Read from PREVIEW
    var $alertPreview = $(event.alert.originalEvent.currentTarget).closest(".alert-preview");
    if ($alertPreview.exists()) {
      $alert = $(".topbar-alert-menu .list-group .alert-menu-item[data-jalios-dataid="+ event.alert.alertId +"]");
      if ($alert.exists()) {

        if (isAutoRead) {
          // When being on preview alert + auto read = on, remove main menu alert from DOM
          removeMainMenuAlert($alert);
        } else {
          // Else, add custom class to indicate alert has been read
          // used to handle properly "back to main menu" event
          $alert.addClass("has-been-read");
        }
      }
      var $currentChildMenu = $alertPreview.closest(".child-menu");
      getSlideMenuPlugin().returnToMainMenu($currentChildMenu); // returns to the main menu (requires $alertPreview element)
    }
  }; // afterRead

  /**
   * Restores main menu alert after alert has been unread from preview, while auto read mode is on.
   */
  var afterUnread = function(event) {
    if (!event || !event.alert) { return; }
    if (!event.alert.originalEvent) { return; }
    $.console.debug("[alert-topbar-menu]", "afterUnread", "event.alert.type=" + event.alert.type);

    if (!event.alert.originalEvent.isAutoRead) {
      // Do nothing when auto read mode is off
      return;
    }

    // Restore main menu alert
    var $childMenu = $(event.alert.originalEvent.target).closest(".child-menu");
    if ($childMenu.exists()) {
      var $alert = getMainMenuAlertFromChildMenu($childMenu);
      if ($alert) {
        restoreMainMenuAlert($alert);
      }
    }

    // Alert preview: Toggle "Mark as read" / "Mark as unread"
    var alertPreviewSelector = ".topbar-alert-menu .child-menu .alert-preview [data-jalios-alert-id='"+$alert.data("jalios-dataid")+"']";
    $(alertPreviewSelector + " .js-alert-mark-as-read").toggleClass("hide");
  }; // afterUnread

  /**
   * When dropdown menu is filled, process menu items.
   */
  var handleTopbarDropdown = function(event){
    var isAlertMenuEvent = event.dropdown && event.dropdown.type === "done" && event.dropdown.trigger && event.dropdown.trigger.hasClass("topbar-alert-menu");
    if (isAlertMenuEvent){
      truncateItems();
      displayHideMarkAllAsRead();
      recomputeMenuHeight();
    }
  }; // handleTopbarDropdown

  /**
   * Checks if "Mark all as read" action should be displayed/hidden.
   */
  var displayHideMarkAllAsRead = function() {
    var alertMenuCount = getAlertMenuCount();
    var $markAll = $(".js-alert-mark-all-as-read");
    if (alertMenuCount === 0 ) {
      if (!$markAll.hasClass("hide")) {
        $markAll.addClass("hide");
      }
    } else if (alertMenuCount > 0) {
      // When first load had no alert, action has .hide class. If alerts have been created
      if ($markAll.hasClass("hide")) {
        $markAll.removeClass("hide");
      }
    }
  }; // displayHideMarkAllAsRead

  /**
   * Limit item's height.
   **/
  var truncateItems = function(){
    if ($.jalios && $.jalios.alert && $.jalios.alert.topbar && $.jalios.alert.topbar.truncateItems) {
      $.jalios.alert.topbar.truncateItems();
    }
  }; // truncateItems

  /**
   * Check scroll to bottom, and if so, load next alerts (50 is when the bottom scroll is under 50px of the end)
   */
  var handleScroll = function(){
    var $that = $(this);
    if($that.scrollTop() + parseInt($that.innerHeight(),10) >= $that[0].scrollHeight - 50) {
      if ($that.find(".js-show-alerts-more-items").exists()) {
        $that.find(".js-show-alerts-more-items").displayLoading();
        $that.find(".js-show-alerts-more-items A")[0].click();
      }
    }
  }; // handleScroll

  /**
   * If there are no remaining alerts in menu:
   *  - displays the "All alerts read" message.
   *  - hides the "Mark all as read" action.
   */
  var handleMenuNoAlerts = function(event) {
    if (getAlertMenuCount() === 0) {
      // display the "No alerts" message
      $(".topbar-alert-menu .topbar-ctxmenu-no-result").removeClass("is-hidden");
    } else {
      $(".topbar-alert-menu .topbar-ctxmenu-no-result").addClass("is-hidden");
    }

    // Remove loading state if present
    $(".topbar-alert-menu .ajax-loading-component").remove();
    $(".topbar-alert-menu-dropdown").removeClass("is-loading");
    displayHideMarkAllAsRead();
  }; // handleMenuNoAlerts

  /**
   * Update menu's height given its content.
   */
  var recomputeMenuHeight = function() {
    if ($.jalios && $.jalios.alert && $.jalios.alert.topbar && $.jalios.alert.topbar.recomputeMenuHeight) {
      return $.jalios.alert.topbar.recomputeMenuHeight();
    }
  }; // recomputeMenuHeight

  var getMoreAndResize = function() {
    // If there's less than 5 items, load following items
    var alertMenuCount = getAlertMenuCount();
    var $moreButton = $(".topbar-alert-menu .js-show-alerts-more-items");
    if (alertMenuCount <= 5 && $moreButton.exists()) {
      $moreButton.displayLoading();
      $moreButton.find("A")[0].click();
    } else {
      // If no more button
      handleMenuNoAlerts();
      recomputeMenuHeight();
    }
  }; // getMoreAndResize

  /**
   * Handle "no alerts" message + resize after ajax request.
   */
  var moreCallback = function(event){
    // Handle an Ajax-Refresh After
    var refresh = $.jalios.Event.match(event, "refresh", "after");
    if (!refresh || !refresh.target){
      return;
    }

    // Check trigger is the "More" button
    if (refresh.options.topbarAlertMore !== true) {
      return;
    }

    // Refresh (detect new elements after ajax ended)
    truncateItems();
    handleNewPreviews();
    handleMenuNoAlerts();
    recomputeMenuHeight();

    // Check if there's a loading state (May be triggered by mark all as read button), if so, remove loading elements
    $(".topbar-alert-menu-dropdown .ajax-loading-component").remove();
    $(".topbar-alert-menu-dropdown").removeClass("is-loading");
  }; // moreCallback

  /**
   * Performed after "More" action to move previews next to other child-menu items.
   */
  var handleNewPreviews = function() {
    var $slideWrapper = $(".topbar-alert-menu-dropdown .slide-wrapper");
    var $previewsWrapper = $slideWrapper.find(".js-alert-previews");
    if (!$previewsWrapper.exists()) {
      return;
    }
    $slideWrapper.append($previewsWrapper.html());
    $previewsWrapper.remove();
  }; // handleNewPreviews

  /**
   * Call UI update after a "read" alert event is received.
   */
  var handleAlertEvent = function(event) {
    if (event.alert) {
      //$.console.debug("[alert-topbar-menu]", "handleAlertEvent", "event.alert.type=" + event.alert.type);
      if (event.alert.type === "action") {
        if (event.alert.action === "read") {
          afterRead(event);
        } else if (event.alert.action === "unread") {
          afterUnread(event);
        }
        // Note: no need to handle action "mark all read"
        // as confirmation modal closed Topbar alert menu, which is refreshed from server when reopened.
      } else if (event.alert.type === "read-all") {
        getMoreAndResize();
        // Remove empty menus
        $("BODY > .alert-menu-moved").each(function(index, element) {
          let $element = $(element);
          if (!$element.find("LI").exists()) {
            $element.remove();
          }
        });
      }
    }
  }; // handleAlertEvent

  /**
   * Listen to event sent by Topbar slide menu, when "back" transition ends.
   * Restores scroll position to the original alert.
   */
  var afterBackToMainMenu = function(event) {
    var $alert = getMainMenuAlertFromSlideMenuEvent(event);
    if (!$alert || !$alert.exists()) {
      return;
    }
    $.console.debug("[alert-topbar-menu]", "afterBackToMainMenu", event, $alert);
    restoreMainMenuScroll($alert);
  }; // afterBackToMainMenu

  /**
   * Listen to event sent by Topbar slide menu, when "returnToMainMenu" transition ends.
   * Restores scroll position to the original alert.
   * If alert has just been read, removes it from main menu.
   *
   * Note: "returnToMainMenu" is called when a preview alert is marked as read.
   */
  var afterReturnToMainMenu = function(event) {
    var $alert = getMainMenuAlertFromSlideMenuEvent(event);
    if (!$alert || !$alert.exists()) {
      return;
    }
    $.console.debug("[alert-topbar-menu]", "afterReturnToMainMenu", event, $alert);
    restoreMainMenuScroll($alert);
    if ($alert.hasClass("has-been-read")) {
      removeMainMenuAlert($alert);
    }
  }; // afterReturnToMainMenu

  /**
   * Scrolls main-menu to given main-menu alert.
   */
  var restoreMainMenuScroll = function($alert) {
    $.console.debug("[alert-topbar-menu]", "restoreMainMenuScroll", $alert);
    var $scrollableContainer = $(".topbar-alerts-item-wrapper"); // Get element
    if ($scrollableContainer.exists()) {
      var alertTop = $alert.offset().top;
      var $slideWrapper = $(".topbar-alert-menu-dropdown .slide-wrapper");
      var slideWrapperTop = $slideWrapper.offset().top;
      var scrollTop = alertTop - slideWrapperTop; // Substract header's offset top
      $.console.debug("[alert-topbar-menu]", "restoreMainMenuScroll", "update scrollTop: " + scrollTop);
      $scrollableContainer[0].scrollTop = scrollTop;
    }
  }; // restoreMainMenuScroll

  var removeMainMenuAlert = function($alert, remove) {
    $.console.debug("[alert-topbar-menu]", "removeMainMenuAlert");
    $alert.hide("fast", function(){
      // Add a state class to prevent hidden/read alerts from main menu to be retrieved by getAlertMenuAlerts
      $alert.addClass("is-read");
      if (remove) {
        $alert.remove();
      }
      getMoreAndResize();
    });
  }; // removeMainMenuAlert

  /**
   * Restores a temporary hidden/read alert in main menu.
   */
  var restoreMainMenuAlert = function($alert) {
    $.console.debug("[alert-topbar-menu]", "restoreMainMenuAlert");
    if ($alert && $alert.exists()) {
      // Reset state class to retrieve alert by getAlertMenuAlerts
      $alert.removeClass("is-read");
      // Restore "displayed" state
      $alert.show();
      handleMenuNoAlerts();
      recomputeMenuHeight();
    }
  }; // restoreMainMenuAlert

  /**
   * Display/hides settings FORM.
   * If main menu displayed => simple toggle.
   * If child menu displayed => slide back to main menu + simple toggle
   */
  var toggleSettings = function(event){
    $.console.debug("[alert-topbar-menu]", "toggleSettings");

    // When going to settings from a child-menu
    // then 1., slide back to main menu
    // then 2., toggle settings
    var isMainMenuActive = $(".topbar-alerts-menu .main-menu.list-group.is-active").exists();
    if (!isMainMenuActive) {
      // Retrieve the active alert preview (if any)
      var $alertPreview = $(".topbar-alerts-menu .child-menu.is-active .alert-preview");
      if ($alertPreview.exists()) {
        // If there is an active alert preview, then, display main menu back (where settings FORM is)
        var $currentChildMenu = $alertPreview.closest(".child-menu");
        getSlideMenuPlugin().returnToMainMenu($currentChildMenu); // returns to the main menu (requires $alertPreview element)
      }
    }
    // Toggle settings FORM
    $('.topbar-alert-menu').toggleClass("is-settings-displayed");
    recomputeMenuHeight();
  }; // toggleSettings

  /**
   * Hides settings FORM when clicking on "Back" from settings FORM.
   */
  var backFromSettings = function(event){
    if (!$.jalios.a11y.isFocusedClick(event)) {
      return;
    }
    $.console.debug("[alert-topbar-menu]", "backFromSettings");
    var isMainMenu = $(".topbar-alerts-menu .main-menu.list-group.is-active").exists();
    if (!isMainMenu) {
      getSlideMenuPlugin().returnToMainMenu();
    }
    toggleSettings();
  }; // backFromSettings

  // ------------------------------------------
  //  UTILS
  // ------------------------------------------

  var getSlideMenuPlugin = function() {
    if ($.jalios && $.jalios.alert && $.jalios.alert.topbar && $.jalios.alert.topbar.getSlideMenuPlugin) {
      var slideMenu = $.jalios.alert.topbar.getSlideMenuPlugin();
      return slideMenu;
    }
  }; // getSlideMenuPlugin

  /**
   * Retrieve unread alerts in main menu.
   */
  var getAlertMenuAlerts = function() {
    return $(".topbar-alert-menu .main-menu .alert-menu-item:not(.is-read)");
  }; // getAlertMenuAlerts

  var getAlertMenuCount = function() {
    return getAlertMenuAlerts().length;
  };

  /**
   * Retrieves main-menu alert that was clicked to go in child menu.
   * event: the slide-menu transition end event from child-menu to main-menu.
   */
  var getMainMenuAlertFromSlideMenuEvent = function(event) {
    if (!event.childMenu) {
      return;
    }
    $.console.debug("[alert-topbar-menu]", "getMainMenuAlertFromSlideMenuEvent", event);
    return getMainMenuAlertFromChildMenu(event.childMenu);
  }; // getMainMenuAlertFromSlideMenuEvent

  /**
   * Retrieves main-menu alert associated to given childMenu alert.
   */
  var getMainMenuAlertFromChildMenu = function($childMenu) {
    if (!$childMenu) {
      return;
    }
    $.console.debug("[alert-topbar-menu]", "getMainMenuAlertFromChildMenu", $childMenu);
    var boundItem = $childMenu.data("bound"); // "alert-12345_Alert"

    // Retrieve main-menu alert (given the data-bound)
    var $slideWrapper = $(".topbar-alert-menu-dropdown .slide-wrapper");
    var $alert = $slideWrapper.find(".list-group-item[data-bound='" + boundItem + "']");
    return $alert;
  }; // getMainMenuAlertFromChildMenu

  /**
   * Handle events triggered after a settings' modification.
   */
  var settingsCallback = function(event) {
    // Action regexp
    var readAutoPattern = /settingsReadAuto/i;

    var broker = $.jalios.Event.match(event, 'broker', readAutoPattern, true);
    if (!broker){ return; }

    // Element
    var elm = broker.source.currentTarget;
    broker.options._broked = true;

    $(elm).refresh({
      "params": {
        "opUpdate": true
      },
      noresponse: true,
      callback: function(event) {
        // Update "auto-read" class / behavior
        var isAutoRead = $(elm) && $(elm).prop("checked");
        var autoReadClass = $(elm).data("jalios-menu-class");
        if (isAutoRead) {
          $('.topbar .topbar-alert-menu').addClass(autoReadClass);
        } else {
          $('.topbar .topbar-alert-menu').removeClass(autoReadClass);
        }
        // Display toastr message
        var message = $.jalios.I18N.glp("update.success");
        toastr.options.timeOut = 1000;
        toastr.options.positionClass = "toast-top-center";
        toastr.info(message);
      }
    });
  }; // settingsCallback

  var onSlideTransitionEnd = function(event) {
    let $childMenu = event.childMenu;
    if (!$childMenu.exists() || !$childMenu.find('VIDEO').exists()) {
      // Return if no VIDEO tag has been found in alert
      return;
    }

    // JCMS-7143 - force responsive on VIDEO tag
    if ( typeof( Event ) === 'function' ) {
      window.dispatchEvent( new Event( 'resize' ) );
    }
  }; // onSlideTransitionEnd

  var onCloseAlertMenu = function(event) {
    if (!event) {
      return;
    }
    var $target = $(event.target);
    // Ensure it is topbar alert menu
    if (!$target.exists() || !$target.hasClass("topbar-alert-menu")) {
      return;
    }
    // Ensure the settings FORM won't stay displayed after menu reopens
    $target.removeClass("is-settings-displayed");

    // Remove menu inner DOM for clean reopen
    var $menuBody = $(".topbar-alert-menu .topbar-ctxmenu-body");
    if ($menuBody.exists()) {
      // Prevent a bad scrollbar positionning when menu has been:
      // - opened
      // - scrolled down (more)
      // - closed
      // - then, reopened
      // Bug: menu body is blank, because of previous menu still in DOM + invalid absolute positionning
      $menuBody.empty();
    }
  }; // onCloseAlertMenu

  /**
   * If auto read is on, clicking on a main menu alert (display its preview) will trigger "mark as read" action (ajax).
   */
  var handleAutoRead = function(event){
    var $alert = $(event.currentTarget).closest(".alert-menu-item");
    if (!$alert) { return; }
    // Retrieve alert's level
    var alertLevel = $alert.data("jalios-alert-level");
    // Do nothing if corresponding level is not in auto read mode
    if (!$.jalios.alert.topbar.isAutoRead(alertLevel)) {
      return;
    }
    // Trigger "mark as read"
    var alertId = $alert.data("jalios-dataid");
    // Attach flag to event to indicate alert has been read due to auto read mode
    event.isAutoRead = true;
    $.jalios.alert.markAsRead(alertId, event);
    // Alert will be removed from main menu by afterRead method
    // Alert preview will not be removed though.

    // Alert preview: provide "Mark as unread" by default
    var alertPreviewSelector = ".topbar-alert-menu .child-menu .alert-preview [data-jalios-alert-id='"+$alert.data("jalios-dataid")+"']";
    $(alertPreviewSelector + " .js-alert-mark-as-read").toggleClass("hide");
  }; // handleAutoRead

  var onDisplayPreview = function(event){
    handleAutoRead(event);
    resizeAlertPreviewMedia(event);
  }; // onDisplayPreview

  /**
   * Resizes alert preview's media element when alert preview is displayed.
   */
  var resizeAlertPreviewMedia = function(event){
    var $alert = $(event.currentTarget).closest(".alert-menu-item");
    if (!$alert || !$alert.exists()) { return; }
    var alertId = $alert.data("jalios-dataid");

    var alertPreviewSelector = ".topbar-alert-menu .child-menu .alert-preview [data-jalios-alert-id='"+alertId+"']";

    var alertPreviewMediaSelector = $(alertPreviewSelector + " .mejs-container");
    if (!alertPreviewMediaSelector.exists()) {
      return;
    }
    var $media = $(alertPreviewMediaSelector[0]);

    // Skip if already resized
    if ($media.data("alert-preview-media-resized") === "true") {
      return;
    }

    // Get dimensions before resize (to get actual ratio)
    var oldWidth = $media.width();
    var oldHeight= $media.height();
    // Force media to fit the available width
    $media.attr("width", "100%");
    $media.css("width", "100%");
    // Update the height given the actual NEW width to keep media ratio
    var ratio = oldWidth / oldHeight;
    var newWidth = $media.width();
    var newHeight = newWidth / ratio;
    $media.height(newHeight);

    // Add a flag to prevent re-resize
    $media.data("alert-preview-media-resized", "true");
  }; // resizeAlertPreviewMedia

  // ------------------------------------------
  //  INIT
  // ------------------------------------------

  var register = function(){
    // Actions
 /*   $(document).on("click keydown",".topbar-alert-menu .js-alert-mark-as-read", markAsRead); // Handles both read and unread actions
    $(document).on("click keydown",".topbar-alert-menu .js-alert-mark-all-as-read", confirmMarkAllRead);
    $(document).on("click keydown",".topbar-alert-menu .js-alert-toggle-settings", toggleSettings);
    $(document).on("click keydown",".topbar-alert-menu .js-alert-back-from-settings", backFromSettings);
    $(document).on("click keydown",".topbar-alert-menu .main-menu > .alert-menu-item", onDisplayPreview);*/

    $(document).on("click keydown",".topbar-alert-menu [data-jalios-topbar-menu-action]", function(event) {
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
      
      event.preventDefault();

      var action = $(event.target).closest("[data-jalios-topbar-menu-action").data('jalios-topbar-menu-action');
      
      switch (action) {
        case 'markAsRead': 
          markAsRead(event)
          break;
        case 'confirmMarkAllRead': 
          confirmMarkAllRead(event)
          break;
        case 'toggleSettings':
          event.stopImmediatePropagation();
          toggleSettings(event)
          break;
        case 'backFromSettings':
          backFromSettings(event)
          break;
        case 'onDisplayPreview':
          onDisplayPreview(event)
        break;    
      }     
    });

    $(".topbar-alert-menu-dropdown .topbar-ctxmenu-body").on("scroll", handleScroll);
    // Events
    $(document).on("jalios:topbar-dropdown", handleTopbarDropdown);

    $(document).on('click',".alert-menu-opener", function (event) {
      event.stopImmediatePropagation();
      event.stopPropagation();
      var alertId = $(event.target).closest(".alert-menu-item").data("jalios-dataid");
      if (!$(event.target).closest(".dropdown").find(".dropdown-menu").exists()) {
        // When clicking on alert-menu-opener and menu is still appended to BODY
        var $movedDropdown = $(".alert-menu-moved[data-jalios-dataid="+ alertId +"]");
        $movedDropdown.appendTo(".alert-menu-item[data-jalios-dataid="+ alertId +"] .alert-menu-dropdown");
        $movedDropdown.removeClass("alert-menu-moved");
        $movedDropdown.removeClass("open");
        return;
      }

      // Close other menu in alert menu
      $("BODY > .alert-menu-moved").each(function(index, element) {
        var $element = $(element);
        $element.appendTo(".alert-menu-item[data-jalios-dataid="+ $element.data("jalios-dataid") +"] .alert-menu-dropdown");
        $element.removeClass("alert-menu-moved");
        $element.removeClass("open");
      });

      var $dropdown = $(event.target).closest(".dropdown").find(".dropdown-menu");
      $dropdown.addClass("alert-menu-moved");
      $dropdown.addClass("open");
      $dropdown.attr("data-jalios-dataid", $dropdown.closest(".alert-menu-item").data("jalios-dataid"));

      //Cross-platform scrollTop retrieval
      var scrollTop = Math.max(window.pageYOffset, document.documentElement.scrollTop, document.body.scrollTop);

      $dropdown.css({
        left: $(event.target)[0].getBoundingClientRect().left - $dropdown.width(),
        top: $(event.target)[0].getBoundingClientRect().top + scrollTop
      });
      $dropdown.closest(".topbar-ctxmenu-body")[0].addEventListener('ps-scroll-y', function(event) {
        $dropdown.appendTo(".alert-menu-item[data-jalios-dataid="+ alertId +"] .alert-menu-dropdown");
        $dropdown.removeClass("alert-menu-moved");
        $dropdown.removeClass("open");
      });

      $dropdown.appendTo("BODY");

      $dropdown.one("hide.bs.dropdown", function(event) {
        $dropdown.appendTo(".alert-menu-item[data-jalios-dataid="+ alertId +"] .alert-menu-dropdown");
        $dropdown.removeClass("alert-menu-moved");
        $dropdown.removeClass("open");
      });
    });

    $(document).on("jalios:refresh", moreCallback);
    $(document).on("jalios:alert", handleAlertEvent);
    $(document).on("jalios.topbar.slidemenu.backToMainMenu", afterBackToMainMenu);
    $(document).on("jalios.topbar.slidemenu.returnToMainMenu", afterReturnToMainMenu);
    $(document).on("jalios:broker", settingsCallback);
    $(document).on('hide.bs.dropdown', onCloseAlertMenu);
    $(document).on('jalios.topbar.slidemenu.transition.end', onSlideTransitionEnd);
  };

  $(document).ready(function() {
    register();
  });

})(jQuery, window, document);
