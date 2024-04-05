!(function($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.smartPhone) {
    $.jalios.smartPhone = {};
  }

  // ==========================================
  //  $.jalios.smartPhone (BottomBar)
  // ==========================================

  $.jalios.smartPhone.BottomBar = {
    /**
     * Creates (or updates) a badge next to a Bottom bar item.
     *
     * @param config
     *          a JSON object to setup the badge
     * @param config.selector
     *          CSS selector to retrieve the bottom bar item to work on
     * @param config.css
     *          optional additional custom CSS classes to be added on the badge
     * @param config.text
     *          the text to set in the badge
     */
    setBadge: function(config) {
      if (!config) {
        return;
      }

      let selector = config.selector || "";
      if (!selector) {
        return;
      }
      let css = config.css || "";
      let text = config.text || "";

      let $targetItem = $(selector);
      if (!$targetItem.length) {
        return;
      }

      let $previousBadge = $targetItem.find(".bottom-nav-item-badge");
      let count = parseInt(text, 10);
      if (count === 0) {
        $targetItem.removeClass("has-badge");
        if ($previousBadge.length) {
          $previousBadge.remove();
        }
        return;
      }
      let badgeClasses = "bottom-nav-item-badge fade in";
      if ($previousBadge.length) {
        // Remove all classes
        $previousBadge.removeClass();
        // Add default classes
        $previousBadge.addClass(badgeClasses);
      }

      let $badge = $previousBadge.length
        ? $previousBadge
        : $("<SPAN>").addClass(badgeClasses);
      // Add custom classes
      $badge.addClass(css);

      if (count < 10) {
        $badge.addClass("one-digit");
      } else if (count >= 10 && count < 100) {
        $badge.addClass("two-digit");
      } else if (count >= 100) {
        $badge.addClass("three-digit");
        text = "99+";
      }
      $badge.text(text);

      $targetItem.addClass("has-badge");

      // Inject badge only if was not already here
      if (!$previousBadge.length) {
        $targetItem.append($badge);
      }
    } // $.jalios.smartPhone.BottomBar.setBadge
  };
})(window.jQuery);
