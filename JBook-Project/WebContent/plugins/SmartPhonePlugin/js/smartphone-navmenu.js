(function($) {
  $.navmenu = function(element, options) {
    var defaults = {
      hiddenContainerClass: "hide"
    };

    var plugin = this;

    plugin.settings = {};

    var $element = $(element),
      element = element;

    plugin.init = function() {
      plugin.settings = $.extend({}, defaults, options);
    };

    plugin.handleLinkChange = function(element) {
      var $navmenu = $(element).closest(".nav-menu");
      var target = $(element).data("jalios-navmenu-target");

      //Disable all menu items
      $(".menu A", $navmenu).removeClass("selected ui-state-persist");
      //Enable selected menu item
      $(element).addClass("selected ui-state-persist");
      //Hide the other target
      $(".nav-menu-container", $navmenu).addClass(
        plugin.settings.hiddenContainerClass
      );
      //Show the selected target
      $(target, $navmenu).removeClass("hide");
    };

    plugin.init();
  };

  $.fn.navmenu = function(options) {
    return this.each(function() {
      if (undefined == $(this).data("navmenu")) {
        var plugin = new $.navmenu(this, options);
        $(this).data("navmenu", plugin);
        plugin.handleLinkChange(this);
      } else {
        var plugin = $(this).data("navmenu");
        plugin.handleLinkChange(this);
      }
    });
  };

  $(document).on("tap", ".nav-menu .menu A", function(e) {
    e.preventDefault();
    var $element = $(e.target);
    $element.navmenu();
  });
})(jQuery);
