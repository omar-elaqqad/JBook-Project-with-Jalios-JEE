!function ($) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  var register = function(){
    $(document).on('click', ".card [data-jalios-action='card-flip']", function(event){
      event.stopPropagation();
      event.preventDefault();
      var $cardFlipWrapper = $(this).closest(".card-flip-wrapper");
      if ($cardFlipWrapper.exists()) {
        $cardFlipWrapper.toggleClass("hover");
      }
    });
  }

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function() {
    register();
  });

}(window.jQuery);
