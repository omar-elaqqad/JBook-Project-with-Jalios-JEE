;( function( $, window, document, undefined ) {

  var timer = new Date().getTime();
  var _$topbarAlertMenu = null;
  var alertCount = 0,
  _interval;
  var _truncate_lines = 2;

  // ------------------------------------------
  // PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.jalios) { $.jalios = {}; }
  if (!$.jalios.alert) { $.jalios.alert = {}; }
  if (!$.jalios.alert.topbar) { $.jalios.alert.topbar = {}; }

  /**
   * Documentation of the MyPlugin JavaScript class.<br/> <br/>
   * <h5>Description</h5>
   *
   * @namespace $.plugin.MyPlugin
   */
  $.jalios.alert.topbar = {
    _intervalTime : null,
    refreshCounter : function(event) {
      var $counter = $(".topbar-alert-menu .alert-count");
      if (!$counter.exists()) {
        // Topbar alert counter not found
        return;
      }
      if (!event.alert || !event.alert.unreadInfo) {
        return;
      }
      //$.console.debug("[alert-topbar]", "refreshCounter: " + JSON.stringify(event.alert));

      var info = event.alert.unreadInfo;
      if (info.count === 0) {
        $counter.removeClass("in");
        
        let alertCountAriaLive = $.jalios.I18N.glp("ui.topbar.alert-menu.title", info.count);
        let alertCountMenuTitle = $.jalios.I18N.glp("ui.topbar.alert-menu-opener.empty-title");    
        $(".js-topbar-alert-count-title").html(alertCountAriaLive);
        $("#topbar-alert-menu-opener").attr("title", alertCountMenuTitle);    
        
      } else if (info.count > 0) {
        // Update level color
        $counter.removeClass("alert-badge-info");
        $counter.removeClass("alert-badge-action");
        $counter.removeClass("alert-badge-warning");
        $counter.removeClass("two-digits");
        $counter.removeClass("three-digits");
        $counter.removeClass("bounce");
        // Update counter
        $counter.html(info.count);
        
        let alertCountAriaLive = $.jalios.I18N.glp("ui.topbar.alert-menu.title", info.count);
        let alertCountMenuTitle = $.jalios.I18N.glp("ui.topbar.alert-menu-opener.title", info.count);
        
        $(".js-topbar-alert-count-title").html(alertCountAriaLive);
        $("#topbar-alert-menu-opener").attr("title", alertCountMenuTitle);
        
        if (info.count > 9 && info.count < 100) {
          $counter.addClass("two-digits");
        } else if (info.count > 99) {
          $counter.addClass("three-digits");
          $counter.html("99+");
        }
        if (info.level) {
          $counter.addClass("alert-badge-" + info.level.toLowerCase());
        }

        if (!$counter.hasClass("in")) {
          $counter.addClass("in");
        }

        if (event.alert.prevUnreadInfo) {
          //Shake it baby
          $counter.addClass("bounce");
        }
      }
    }, // refreshCounter

    getSlideMenuPlugin : function(event) {
      var $menu = $(".topbar-alert-menu-dropdown .slide-wrapper");
      // Only if alert menu opened
      if ($menu.exists()) {
        var slideMenu = $menu.data("plugin_topbarSlideMenu");
        if (slideMenu) {
          return slideMenu;
        } else {
          $.console.warn("[alert-topbar]", "getSlideMenuPlugin", "Could not retrieve slideMenu");
        }
      }
    }, // getSlideMenuPlugin

    /**
     * topbar-slide-menu height will be recomputed on the active menu
     */
    recomputeMenuHeight : function(event) {
      var slideMenuPlugin = $.jalios.alert.topbar.getSlideMenuPlugin();
      if (slideMenuPlugin) {
        slideMenuPlugin.recomputeHeight();
      }
    }, // recomputeMenuHeight

    /**
     * Limit item's height.
     **/
    truncateItems : function(event) {
      var isTruncateAvailable = $.jalios && $.jalios.truncate;
      if (isTruncateAvailable) {
        var selector = ".topbar-alert-menu-dropdown .alert-menu-item:not(.js-truncated) .alert-description";
        $(selector).each(function (index, element) {
          // Remove the latest <p> but the first
          $(element).find("P:nth-child(n+2)").remove();
          $(element).addClass("js-truncated");
          // Truncate lines
          $(element).jalios_truncate({ value : _truncate_lines });
        });

        // After truncate, update menu height
        $.jalios.alert.topbar.recomputeMenuHeight();
      }
    }, // truncateItems

    /**
     * Returns true if given alert level should be marked as read automatically on preview.
     */
    isAutoRead: function(alertLevel){
      if (!alertLevel) {
        return;
      }
      return $(".topbar-alert-menu.is-auto-read-" + alertLevel).exists();
    }, // isAutoRead

    /**
     * Sets given alert levels as auto read levels on '.topbar-alert-menu' element.
     */
    setAutoRead : function(alertLevels){
      if (!alertLevels || !Array.isArray(alertLevels)) {
        return;
      }
      let $levelsElt = $(".topbar-alert-menu");
      if (!$levelsElt.exists()) {
        return;
      }
      // Remove all
      $levelsElt.removeClass('is-auto-read-info');
      $levelsElt.removeClass('is-auto-read-action');
      $levelsElt.removeClass('is-auto-read-warning');
      for (let i = 0; i < alertLevels.length; i++) {
        let alertLevel = alertLevels[i];
        if (alertLevel) {
          $levelsElt.addClass('is-auto-read-' + alertLevel);
        }
      }
    } // setAutoRead
  };

  // ------------------------------------------
  // PRIVATE CODE
  // ------------------------------------------

  // Perform actions on alert refresh
  var handleAlertEvent = function(event) {
    if (event.alert) {
      if (event.alert.type === "refresh") {
        $.jalios.alert.topbar.refreshCounter(event);
      }
    }
  };

  // Refresh counter on tab focusing
  var handleVisibilityChange = function() {
    if (document.hidden) {
      clearInterval(_interval);
      timer = new Date().getTime();
    } else  {
      var diff = timer - new Date().getTime();
      var diffInSeconds = Math.abs(diff);
      if (diffInSeconds > $.jalios.alert.topbar_intervalTime) {
        $.jalios.alert.refreshUnreadInfo();
      }
      _interval = setInterval(handleInterval, $.jalios.alert.topbar_intervalTime);
    }
  };

  // Refresh counter periodically
  var handleInterval = function() {
    if (!document.hidden) {
      $.jalios.alert.refreshUnreadInfo();
    }
  };

  // ------------------------------------------
  // INIT
  // ------------------------------------------

  var registerJaliosReady = function(){
    $(document).on("jalios:alert", handleAlertEvent);
    document.addEventListener("visibilitychange", handleVisibilityChange, false);
    $(document).on("jalios:ready", $.jalios.alert.topbar.truncateItems);
  };

  $(document).ready(function() {
    _$topbarAlertMenu = $(".topbar-item-alert-menu");
    $.jalios.alert.topbar_intervalTime = _$topbarAlertMenu.data("jalios-alert-refresh-interval");
    registerJaliosReady();
    _interval = setInterval(handleInterval, $.jalios.alert.topbar_intervalTime);
  });

})(jQuery, window, document);
