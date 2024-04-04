! function($) {
  let mediaQuery = window.matchMedia("screen and (max-width: 480px)");

  const mediaQueryMatches = function() {
    if (mediaQuery.matches) {
      $(".js-body-search-input .control-textfield").prop("disabled", false);
      $(".js-sidebar-search-input .control-textfield").prop("disabled", true);
      $(".js-sidebar-search-input").addClass("hide", true);
      $(".js-body-search-input").removeClass("hide", false);
    } else {
      $(".js-body-search-input .control-textfield").prop("disabled", true);
      $(".js-sidebar-search-input .control-textfield").prop("disabled", false);
      $(".js-sidebar-search-input").removeClass("hide", true);
      $(".js-body-search-input").addClass("hide", false);
    }
  }

  const register = function() {
    mediaQueryMatches();
    $(window).resize(function() {
      mediaQueryMatches();
    });
    $(document).on('jalios:refresh', function(event) {
      mediaQueryMatches();
    });
    
    $(document).on("click", ".js-deselect-types", function(event) {
      $(".app-sidebar-section-types input").prop("checked", false);
      $(event.currentTarget).refresh({
        isform: true
      });
    });
  };


  $(document).ready(function() {
    register();
  });

}(window.jQuery);