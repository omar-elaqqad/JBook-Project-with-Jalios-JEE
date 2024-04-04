!function($) {

  var register = function(event) {
    $('.jalios-scrollbar').scrollbar();
  };

  $(document).on('jalios:ready', function(event) {
    register(event);
  });

}(window.jQuery);