/**
 * Alerts related methods
 */
!(function($) {
  let _smartphoneAlertsUnreadInfo;

  const registerPagebeforeshow = function(event, ui) {
    $.jalios.smartPhone.Alerts.updateAlertCount();
  }; // registerPagebeforeshow

  // ------------------------------------------
  // PRIVATE CODE
  // ------------------------------------------

  /**
   * Compares given unreadInfo with the cached one.
   * Returns true if either count or max level has changed.
   * info1: the cached version
   * info2: the fresh info
   */
  const hasUnreadInfoChanged = function(count, level) {
    if (!_smartphoneAlertsUnreadInfo) {
      // There is no current cached version
      _smartphoneAlertsUnreadInfo = {
        count: count,
        level: level
      };
      return false;
    }
    // Compare count
    // compare max level
    let countChanged = _smartphoneAlertsUnreadInfo.count !== count;
    let levelChanged = _smartphoneAlertsUnreadInfo.level !== level;
    if (countChanged || levelChanged) {
      _smartphoneAlertsUnreadInfo = {
        count: count,
        level: level
      };
      return true;
    }
    return false;
  }; // hasUnreadInfoChanged

  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.smartPhone) {
    $.jalios.smartPhone = {};
  }

  // ==========================================
  //  $.jalios.smartPhone (Alerts)
  // ==========================================

  $.jalios.smartPhone.Alerts = {
    /**
     * Updates BottomBar's alert badge.
     */
    updateAlertCount: function() {
      $.ajax({
        url: "plugins/SmartPhonePlugin/jsp/common/doAlertCount.jsp"
      }).then(function(response, textStatus) {
        if (textStatus === "success" && typeof response === "object") {
          let prevUnreadInfo = _smartphoneAlertsUnreadInfo;
          let text = response.unreadCount;
          if (!text) {
            return;
          }
          let config = {};
          config.value = parseInt(text, 10);
          if (
            !_smartphoneAlertsUnreadInfo ||
            hasUnreadInfoChanged(config.value, response.maxLevel)
          ) {
            // Animate only if positive
            config.animate =
              /*count has increased*/ config.value > 0 &&
              (!prevUnreadInfo ||
                /*count has increased*/ prevUnreadInfo.count < config.value);
            _smartphoneAlertsUnreadInfo = {
              count: config.value,
              level: response.maxLevel
            };
          }
          if (response.maxLevel) {
            switch (response.maxLevel) {
              case "action":
                config.level = $.jalios.smartPhone.Badge.levels.WARN;
                break;
              case "warning":
                config.level = $.jalios.smartPhone.Badge.levels.DANGER;
                break;
              default:
                config.level = $.jalios.smartPhone.Badge.levels.INFO;
            }
          }

          config.$element = $(".bottom-nav-item-alerts");

          $.jalios.smartPhone.Badge.setBadge(config);
        }
      });
    } // $.jalios.smartPhone.Alerts.updateAlertCount
  }; // $.jalios.smartPhone.Alerts

  $(document).on("pagecontainerbeforeshow", registerPagebeforeshow);
})(window.jQuery);
