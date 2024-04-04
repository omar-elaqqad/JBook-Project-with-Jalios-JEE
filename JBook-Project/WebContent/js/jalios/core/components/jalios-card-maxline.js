/*
Inspired by https://css-tricks.com/line-clampin/

*/
!function ($) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  var register = function () {

    $('[data-jalios-maxlines]').each(function (index, element) {
      $clamp(element, {
  	    clamp: element.dataset.jaliosMaxlines
  	  });
  	});

  }

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function() {
    register();
  });

}(window.jQuery);
