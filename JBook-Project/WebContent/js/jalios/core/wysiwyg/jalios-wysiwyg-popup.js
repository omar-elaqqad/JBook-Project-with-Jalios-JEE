!function($) {
  // The TinyMCE Editor instance, set on 'wysiwyg:ready'
  var editor;
  
  // The textarea id in the opener 
  var targetInputId;
  
  // On load, and on resize
  // Updat TinyMCE editor size to window size
  var resizeEditorToFitWindow = function() {
    $tinymceIframe = $(".mce-edit-area IFRAME")
    if (!$tinymceIframe.exists()) {
      return;
    }
    var newIframeHeight = $("body").height() - ($('form[name=editForm]').height() - $(".mce-edit-area").height()) - 20;
    $(".mce-edit-area IFRAME").css("height", newIframeHeight + "px");
  }
  
  // When page is loaded and TinyMCE editor is ready
  // --> retrieve HTML content from opener and initialize editor
  var setEditorContentFromTargetInput = function() {
    if (!editor) {
      return;
    }
    
    var contentValue = window.opener.jQuery('#' + targetInputId).val();    
    document.editForm.content.value = contentValue;
    editor.setContent(document.editForm.content.value);
  }
  
  // When user validate the form
  // --> retrieve HTML content from editor and update opener textarea and preview iframe
  var saveEditorContentToTargetInput = function() {
    if (!editor) {
      return;
    }
    
    // Save editor and set HTML in original textarea
    editor.save();
    window.opener.jQuery('#' + targetInputId).val(document.editForm.content.value);
    
    // Update preview iframe if any
    var $previewIframe = window.opener.jQuery('#' + targetInputId + '_preview_iframe');
    if ($previewIframe.exists()) {
      $previewIframe.attr('src', $previewIframe.attr('data-src'));
    }
  }
  

  $(document).on('wysiwyg:ready', function(event) {
    editor = event.editor;
    targetInputId = $(document.editForm).data('target-input-id');
    
    resizeEditorToFitWindow();
    $(window).on('resize', resizeEditorToFitWindow);
    
    setEditorContentFromTargetInput(editor);

    $('#validate-btn').on('click', function(event){
      event.preventDefault();
      saveEditorContentToTargetInput();
      window.close();
    });
    
    $('#close-btn').on('click', function(event){
      event.preventDefault();
      window.close();
    });
  });
  
  
}(window.jQuery);
