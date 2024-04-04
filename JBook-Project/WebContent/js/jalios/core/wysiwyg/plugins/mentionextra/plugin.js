!function($) {
  tinymce.PluginManager.add('mentionextra', function(editor, url) {

    var tag = 'jalios:mention';

    var htmlTag = 'a';
    var htmlClass = 'mention';

    var template = editor.getParam('mention_template', '<' + tag + '@attributes@ />');
    var placeholder = editor.getParam('mention_placeholder',
        '<' + htmlTag + '@attributes@ class="' + htmlClass + '" contenteditable="false">'
        + '<span class="jalios-mention-fullname">@fullName@</span>'
        + '</' + htmlTag + '>');

    var templateRegExp = '<' + tag + '[^>]*>(</' + tag + '>)?';
    var placeholderRegExp = (
        '<' + htmlTag + '[^>]*class="' + htmlClass + '[^"]*"[^>]*>'
        + '<span[^>]*class="jalios-mention-fullname"[^>]*>[^<]*</span>'
        + '</' + htmlTag + '>'
        ).replace(/></g, '>[\\r\\n\\t\\s]*<'); // Manage potential line breaks

    editor.jalios.plugins.mention = {
      createTag : function(options) {
        var attr = '';
        attr += ' data-jalios-id="' + window.encodeURIComponent(options.memberId) + '"';
        return template.replace(/@attributes@/g, attr);
      },
      createHtmlTag : function(mbr) {
        var attr = '';
        attr += ' data-jalios-mention-id="' + window.encodeURIComponent(mbr.id) + '"';
        var fullName = mbr.fullName;
        return placeholder.replace(/@attributes@/g, attr).replace(/@fullName@/g, fullName);
      }
    };

    // Display the jalios tag name in element path
    editor.on('ResolveName', function(event) {
      var elt = event.target;
      if (isMention(elt)) {
        event.name = 'jalios:mention';
      }
    });

    function isMention(node) {
      return node.nodeName.toUpperCase() === htmlTag.toUpperCase() && editor.dom.hasClass(node, htmlClass);
    }

    editor.on('BeforeSetContent', function(event) {
      event.content = replaceContent(event.content);
    });

    function replaceContent(content) {
      var regex = new RegExp(templateRegExp, 'gi');
      return content.replace(regex, function($0) {
        var $elt = $($0);

        var mbrId = $elt.data('jalios-id');

        var mbr = editor.jcms.getMemberInfos(mbrId);

        return mbr && mbr.id ? editor.jalios.plugins.mention.createHtmlTag(mbr) : $0;
      });
    }

    editor.on('PostProcess', function(event) {
      if (event.get) {
        event.content = restoreContent(event.content);
      }
    });

    function restoreContent(content) {
      var regex = new RegExp(placeholderRegExp, 'gi');
      return content.replace(regex, function($0) {
        var $elt = $($0);
        return editor.jalios.plugins.mention.createTag({
          memberId: $elt.data('jalios-mention-id')
        });
      });
    }

  });
}(window.jQuery);