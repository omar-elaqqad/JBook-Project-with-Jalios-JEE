!(function($) {
  /* Do stuff on DOM Ready */
  const registerDomReady = function() {
    updateApplicationLauncherBadgeCount();
    document.addEventListener("visibilitychange", function() {
      if (!document.hidden) {
        updateApplicationLauncherBadgeCount();
      }
    });
  };

  const updateApplicationLauncherBadgeCount = function() {
    $.getJSON(
      "plugins/SmartPhonePlugin/jsp/service/launcher/launcherActions.jsp",
      function(data) {
        if (data) {
          var levelSuffix = data.badgeLevel;
          let config = {};
          config.value = parseInt(data.badgeCount, 10);
          config.level = $.jalios.smartPhone.Badge.levels[data.badgeLevel];
          config.$element = $(".bottom-nav-item-application-menu");
          $.jalios.smartPhone.Badge.setBadge(config);
        }
      }
    );
  };

  const updateApplicationItem = function($item) {
    var shortcutId = $item.data("jalios-dataid");
    $.getJSON(
      $item.data("jalios-application-async-url"), {
        shortcutId: shortcutId
      },
      function(data) {
        if (data) {
          var levelSuffix = data.badgeLevel;
          let config = {};
          config.value = parseInt(data.badgeText, 10);
          config.level = $.jalios.smartPhone.Badge.levels[data.badgeLevel];
          config.$element = $item;
          config.customCss = "application-badge";

          $.jalios.smartPhone.Badge.setBadge(config);
        }
      }
    );
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  $(document).ready(registerDomReady);

  $(document).on("pageshow", "#application-launcher", function() {
    updateApplicationLauncherBadgeCount();
    $(".application-launcher [data-jalios-application-async-url]").each(
      function(index, element) {
        var $element = $(element);
        updateApplicationItem($element);
      }
    );
  });


})(window.jQuery);