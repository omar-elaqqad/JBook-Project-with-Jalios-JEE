!function($) {
  tinymce.PluginManager.add('jfullscreen', function(editor, url) {
    var inlineEditionForm = jQuery(editor.getElement()).closest('.wysiwyg-inline-edit-form');
    var isInlineEdition = inlineEditionForm.exists();
    if (!isInlineEdition) {
      return;
    }
    
    editor.addCommand('jfullscreensave', function (ui, attributes) {
      inlineEditionForm.find('.wysiwyg-inline-btn-save').click()
      editor.execCommand('mceFullScreen', false);
    });
    
    var jfullscreenSaveButton;
    editor.addButton('jfullscreensave', {
      icon: editor.settings.jfullscreensave_icon,
      text: tinymce.i18n.translate('jfullscreen.btn.save'),
      tooltip: tinymce.i18n.translate('jfullscreen.btn.save.tooltip'),
      type: 'button',
      cmd: 'jfullscreensave',
      hidden: true,
      onpostrender: function() {
        jfullscreenSaveButton = this;
        jfullscreenSaveButton.$el.addClass("jfullscreen-button");
      }
    });
    
    editor.on('FullscreenStateChanged', function (e) {
      if (jfullscreenSaveButton) {
        e.state ? jfullscreenSaveButton.$el.show() : jfullscreenSaveButton.$el.hide();
      }
    });
    
  });
}(window.jQuery);