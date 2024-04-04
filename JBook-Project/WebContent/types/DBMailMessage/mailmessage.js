!function($) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  /**
   * Resize mails' IFRAME on dom ready.
   */
  var register = function(){
    //console.log('mailmessage.js', "register");

    // Finds each mail IFRAME that should be resized when IFRAME is loaded
    $('.block-email IFRAME')
      .each(function(){ $.jalios.DOM.resizeIframeToViewport.defer($(this)); })
      .load(function(){ $.jalios.DOM.resizeIframeToViewport.defer($(this)); });
  }

  // ------------------------------------------
  // PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }

  /**
   * Little script to improve IFRAME height resizing.
   * Called on toggle show/hide E-mail's IFRAME.
   * 
   * @namespace $.jalios.mailmessage
   */
  $.jalios.mailmessage = {
    resizeIframe: function(element){
      var $element = $(element);
      var $iframe = $element.closest('.mail-message').find('IFRAME');
      if (!$iframe || !$iframe.exists()){ return; }
      jQuery.jalios.DOM.resizeIframeToViewport($iframe);
    }
  }

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function() {
    register();
  });
}(window.jQuery);


var DBMailResizeIframe = function(event){
  jQuery.jalios.mailmessage.resizeIframe(event);
}
