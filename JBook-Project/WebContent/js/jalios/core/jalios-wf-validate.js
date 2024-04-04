!function ($) {

  var changePstatus = function () {
    var $select = $(this);
    
    var pubId = $select.data('jalios-id');
    var redirect = $select.data('jalios-redirect');
    var pubCurrPstatus = $select.data('jalios-pstatus');
    
    // Check the selected pstatus
    var selectedPstatus = $select.val();
    if (selectedPstatus == pubCurrPstatus) { 
      return;
    }
    
    var callback = function(confirm) {
      if (!confirm) {
        // restore the previous value
        $select.val(pubCurrPstatus);
      }
    };
    
    // Prompt for confirmation/comment
    var jsp = "work/validateStateChange.jsp";
    jsp += "?id=" + pubId + "&pstatus=" + selectedPstatus +  "&redirect=" + encodeURIComponent(redirect);
    $.jalios.ui.Modal.openFromUrl(jsp , { 'callback' : callback});
  }
  
  $(document).ready(function($) {
    $('SELECT.wf-change-pstatus').on('change', changePstatus);
  });
  
}(window.jQuery);