/*
 * Javascript code used in displayWork.jsp to resize 
 * and show iframe containing the publication's preview
 * @since jcms-9.0.3
*/
!function ($) {

  // JCMS-8066: do not wait for "jalios:ready" event to listen to IFRAME's load event
  // Bind "onload" as soon as this JS code is executed
  $('#displayWorkIframe').on('load', function(){
    let $that = $(this);
    //Resize iframe height
    $.jalios.DOM.resizeIframeToViewport($that);
    $that.removeClass("invisible");
    //Hide info message
    $(".display-work-iframe-msg").remove();
  });

}(window.jQuery);