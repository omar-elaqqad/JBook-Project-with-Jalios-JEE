!function($) {
  tinymce.PluginManager.add('emoji', function(editor, url) {

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
          className : emojiClass,
          attributes : function attributesCallback(icon, variant) {
            return {
              'data-mce-placeholder': 'true',
              'data-mce-resize': 'false'
            };
          }
        });
        
        // Remove emojis image from pre tag as they gets removed by TinyMCE
        // Preserve raw text. (fix DEVJCMS-2332)
        var emojisInCode = $(editor.contentWindow.document.body).find('PRE IMG.emoji');
        emojisInCode .each(function() {
          var $img = $(this);
          $img.replaceWith($img.attr('alt'));
        });
        
      });

      // Convert edited HTML (containing placeholder) to raw HTML
      // --> emoji image are converted back to emoji codepoint
      editor.on('PreInit', function () {
        editor.serializer.addNodeFilter('img', function (nodes) {
          var i = nodes.length, node, className, alt;

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
  
}(window.jQuery);
