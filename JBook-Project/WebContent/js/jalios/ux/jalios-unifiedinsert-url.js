!function ($) {

  // ---------------------------
  // URL Preview methods
  // 
  var lastPreviewedUrl = '';
  var handleUrlChange = function(){
    var url = $("#sourceUrl").val();
    var previewPath;
    if (url !== '') {
      previewPath = 'jcore/media/embed.jsp?autoresize=true&src=' +
                    encodeURIComponent(url);
    } else {
      previewPath = 's.gif';
    }
    var previewUrl = JcmsJsContext.getBaseUrl() + previewPath;
    if (previewUrl === lastPreviewedUrl) {
      return;
    }
    lastPreviewedUrl = previewUrl;
    $('#previewIFrame')[0].src = JCMS.Security.getUrlWithCSRFToken(previewUrl);
  }
  
  var changePendingTimeout = null;
  var deferUrlChange = function() {
    updateButtonState();
    if (changePendingTimeout) {
      clearTimeout(changePendingTimeout);
    }
    changePendingTimeout = setTimeout(function(){
      handleUrlChange();
      changePendingTimeout = false;    
    }, 800);
  }

  // ---------------------------
  // Button state methods
  var updateButtonState = function() {
    var url = $("#sourceUrl").val();
    url = url ? url.trim() : '';
    var $validateBtn = $('button[name=opValidate]');
    $validateBtn.prop('disabled', (url === ''));
    $validateBtn.data('jalios-source', url);
  } 
  
  /* Do stuff on DOM Ready */
  var register = function(){
    updateButtonState();
    $('#sourceUrl').on('change', deferUrlChange);
    $('#sourceUrl').on('keyup', deferUrlChange);
  }

// ------------------------------------------
//  DOM READY CODE
// ------------------------------------------
  
  $(document).ready(function() {
    register();
  });

}(window.jQuery);
