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
    
    editor.ui.registry.addButton('jfullscreensave', {
      icon: editor.settings.jfullscreensave_icon,
      text: tinymce.i18n.translate('jfullscreen.btn.save') + '<span class="jfullscreensavebuttonlocator"></span>',
      tooltip: tinymce.i18n.translate('jfullscreen.btn.save.tooltip'),
      onAction: function () {
        editor.execCommand('jfullscreensave');
      },
      hidden: true,
      onSetup: function(buttonApi) {
        var $locatorEl = $(editor.getContainer()).find(".jfullscreensavebuttonlocator");
        $locatorEl.closest("button").addClass("jfullscreen-button").hide();
        $locatorEl.remove();
      }
    });
    
    editor.on('FullscreenStateChanged', function (e) {
      var $jfullscreenSaveButton = $(editor.getContainer()).find(".jfullscreen-button");
      if ($jfullscreenSaveButton) {
        e.state ? $jfullscreenSaveButton.show() : $jfullscreenSaveButton.hide();
      }
    });
    
  });
}(window.jQuery);