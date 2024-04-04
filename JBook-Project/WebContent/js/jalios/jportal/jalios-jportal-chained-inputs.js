! function($) {

  var register = function() {
    $(document).on('click', '.input-group-chained .input-group-addon', function(event) {
      var $currentInput = $(event.target);
      if ($currentInput.is(".input-chainer")) {
        $currentInput.closest(".input-group-addon").toggleClass("is-chained");
        return;
      }
    });

    $(document).on('input change propertychange', '.input-group-chained', function(event) {
      var $currentInput = $(event.target);
      var $chainedGroup = $currentInput.closest(".input-group-chained");


      if ($currentInput.is(".input-chainer")) {
        return;
      }
      if ($chainedGroup.find(".input-chainer").is(":not(:checked)")) {
        return;
      }

      var currentValue = $currentInput.val();
      $chainedGroup.find(":input").each(function(index, element) {
        $(element).val(currentValue);
      });
    });
  };


  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function() {
    register();
  });

}(window.jQuery);
