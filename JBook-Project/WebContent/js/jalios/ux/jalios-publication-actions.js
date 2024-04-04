!function ($) {

  // Plugin initialization on DOM ready
  var register = function() {
    $(document).on('show.bs.collapse hide.bs.collapse', function(event) {
      var $target = $(event.target);
      var $actionWrapper = $target.closest(".publication-actions");
      
      if ($actionWrapper) {
        var text = "";
        if (event.type === "hide") {
          text = $target.find(".actions-more").text()
        } else {
          text = $target.find(".actions-less").text()
        }
        $actionWrapper.find(".publication-actions-secondary .panel-title A").text(text);
      }
    });
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
  
}(window.jQuery);