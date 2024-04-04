!function ($) {
  
  var register = function(){
    $(document).on('click', '.pub-list-choice-mode', function(event) {
      let mode = $(event.currentTarget).data("jalios-display-mode");
      $(".pub-list-choice-mode").removeClass("active");
      $(".pub-list-choice-mode").find("input").prop("checked", false);
      $(event.currentTarget).addClass("active");
      $(event.currentTarget).find("input").prop("checked", "checked");
      $(".pub-list-choice-fields").addClass("hide");
      $("." + mode).removeClass("hide");
    });
  }
    
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);