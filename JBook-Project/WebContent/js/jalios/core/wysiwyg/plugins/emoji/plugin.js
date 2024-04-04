!(function ($) {
  tinymce.PluginManager.add('emoji', function (editor, url) {
    function getEmojiPickerIFrameId() {
      return editor.id + '_emoji_iframe';
    }
    function getHtml() {
      return (
        '<iframe id="' +
        getEmojiPickerIFrameId() +
        '" src="jcore/emoji/emoji.jsp" scrolling="no" style="overflow:hidden;border:0;width:254px;height:337px;"></iframe>'
      );
    }

    var panelButton = editor.addButton('emoji', {
      tooltip: tinymce.i18n.translate('emoji.btn.tooltip'), // See properties wysiwyg.plugins.emoji.btn.tooltip
      icon: 'mce-ico mce-i-emoticons', // reuse icon of TinyMCE emoticons plugin
      type: 'panelbutton',
      panel: {
        role: 'application',
        autohide: true,
        html: getHtml,
        minWidth: 257,
        minHeight: 340
      },
      stateSelector: ['img.emoji']
    });

    // Listen to even triggered by jalios-emoji-picker.js on iframe to insert in editor
    const emojiSelectionHandler = function (event) {
      editor.execCommand('mceInsertContent', false, event.emoji);
      editor.controlManager.buttons.emoji.panel.hide();
      editor.focus();
    };

    // Global event must be cleaned when editor is removed
    let emojiPickerIframeIdSelector = '#' + getEmojiPickerIFrameId();
    $(document).on('emoji-selected', emojiPickerIframeIdSelector, emojiSelectionHandler);
    editor.on('remove', function (_event) {
      $(document).off('emoji-selected', emojiPickerIframeIdSelector, emojiSelectionHandler);
    });

    var emojiClass = 'emoji';

    // Display "emoji" in element path ("breadcrumb")
    editor.on('ResolveName', function (e) {
      if (e.target.nodeName == 'IMG' && editor.dom.hasClass(e.target, emojiClass)) {
        e.name = 'emoji';
      }
    });

    // Convert raw HTML to edited HTML containing placeholder
    // --> emoji codepoints are convert to image
    editor.on('SetContent', function (e) {
      $.jalios.Emoji.parse(editor.contentWindow.document.body, {
        className: emojiClass,
        attributes: function attributesCallback(icon, variant) {
          return {
            'data-mce-placeholder': 'true',
            'data-mce-resize': 'false'
          };
        }
      });

      // Remove emojis image from pre tag as they gets removed by TinyMCE
      // Preserve raw text. (fix DEVJCMS-2332)
      var emojisInCode = $(editor.contentWindow.document.body).find('PRE IMG.emoji');
      emojisInCode.each(function () {
        var $img = $(this);
        $img.replaceWith($img.attr('alt'));
      });
    });

    // Convert edited HTML (containing placeholder) to raw HTML
    // --> emoji image are converted back to emoji codepoint
    editor.on('PreInit', function () {
      editor.serializer.addNodeFilter('img', function (nodes) {
        var i = nodes.length,
          node,
          className,
          alt;

        while (i--) {
          node = nodes[i];
          className = node.attr('class');
          alt = node.attr('alt');
          if (alt && alt !== '' && className && className.indexOf('emoji') !== -1) {
            node.type = 3;
            node.value = alt;
            node.raw = true;
          }
        }
      });
    });
  });
})(window.jQuery);
