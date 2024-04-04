!function($) {

  /**
   * Moves every .child-menu in their expected .slide-wrapper container.
   */
  var register = function() {
    var $children = $(".topbar-admin-menu .child-menu");
    var $target = $(".topbar-admin-menu .slide-wrapper");
    if ($children.exists() && $target.exists()) {
      $children.each(function(i, elt) {
        $(elt).appendTo($target);
      });
    }
  };

  $(document).ready(function() {
    register();
  });
}(window.jQuery);