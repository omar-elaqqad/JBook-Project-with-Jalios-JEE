!function ($) {
  
  $(document).on("click", ".action-item-comment", function(event) {
    $([document.documentElement, document.body]).animate({
      scrollTop: $(".comment-list .add-comment").offset().top
	  }, 200);  	
    $(".comment-list .add-comment").trigger("tap");
    $(".comment-list .widget-name-description TEXTAREA").focus();
  });  	
  
}(window.jQuery);