;(function($, window, document, undefined) {
	
  var SCROLL_TO_TOP_SELECTOR = "#jportal-return-to-top";
	
  /*
   * Displays the scroll to top button when the user scrolls down
   */
	
  var handleDisplayScrollButton = function (event) {
    // If page is scrolled more than 100px
    if ($(this).scrollTop() >= 100) {       
      // Fade in the arrow
      $(SCROLL_TO_TOP_SELECTOR).fadeIn(200);    
    } else {
      // Else fade out the arrow
      $(SCROLL_TO_TOP_SELECTOR).fadeOut(200);   
    }
  }
  
  /*
   * Scroll to top function
   */
  var handleScrollToTop = function (event) {
    $('body,html').animate({
      scrollTop : 0
    }, 500);
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
	$(document).on("scroll", handleDisplayScrollButton);
	$(document).on("click", SCROLL_TO_TOP_SELECTOR, handleScrollToTop);	  
  });
  
})(jQuery, window, document);