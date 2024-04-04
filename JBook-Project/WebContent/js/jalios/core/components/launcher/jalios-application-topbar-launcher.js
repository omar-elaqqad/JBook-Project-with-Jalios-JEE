(function($, window, document, undefined) {
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------
  var launcherMenuInit = false;
  const register = function() {
    $(document).on("shown.bs.dropdown", function(event) {

      var $menu = $(event.target);
      if (!$menu.hasClass("topbar-application-launcher")) {
        return;
      }

      if (!launcherMenuInit) {
        $.jalios.launcher.init(".topbar-application-launcher .application-launcher");
        launcherMenuInit = true;
      }

    });
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function() {
    register();
  });
})(jQuery, window, document);