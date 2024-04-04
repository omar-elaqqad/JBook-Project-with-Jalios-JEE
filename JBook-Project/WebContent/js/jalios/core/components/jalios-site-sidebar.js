!function ($) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  var displayLoadingBeforeAjax = function(event) {
    var refresh = $.jalios.Event.match(event,'refresh','before');
    if (!refresh){
      return;
    }
    //Check we are in an app-sidebar
    var $trigger = $(refresh.options.trigger);
    if (!$trigger.is(".sidebar-tabs > LI > A")) {
      return;
    }
    $(".sidebar-tab-content").html("");
    $(".sidebar-tab-content").displayLoadingWaves();
  }

  var register = function(){
    // Lazy load items in the sidebar
    $(document).on('show.jalios.sidebar', function (event) {
      var $siteSidebar = $(event.target);
      if (!$siteSidebar.hasClass("site-sidebar")) {
        return;
      }

      var $lazyElement = $(".site-sidebar .sidebar-lazyload");
      $lazyElement.each(function(index, element){
          var $element = $(element);
          $element.displayLoadingWaves();
          var lazyUrl = $element.data("jalios-sidebar-lazyload-url");
          $.jalios.AjaxRefresh.refresh(
            lazyUrl,
            $element,
            {
              'noscroll'   : true,
              'nohistory'  : true
            }
          );
      });
    });
    $(document).on('jalios:refresh', displayLoadingBeforeAjax);
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function() {
    register();
  });

}(window.jQuery);
