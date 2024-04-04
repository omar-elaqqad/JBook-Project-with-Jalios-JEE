!function($) {
  tinymce.PluginManager.add('jmessage', function(editor, url) {

    var tag = 'jalios:msg';
    var dataAttr = 'data-jalios-level';

    var htmlTag = 'div';
    var htmlClass = 'jalios-message';

    var template = editor.getParam('message_template', '<' + tag + '></' + tag + '>');
    var placeholder = editor.getParam('message_placeholder', '<' + htmlTag + ' class="' + htmlClass + '"></' + htmlTag + '>');

    // Display the jalios tag name in element path
    editor.on('ResolveName', function(event) {
      var elt = event.target;
      if (isPluginHtmlTag(elt)) {
        event.name = 'jalios:message';
      }
    });

    function isPluginHtmlTag(node) {
      return node.nodeName.toUpperCase() === htmlTag.toUpperCase() && editor.dom.hasClass(node, htmlClass);
    }

    editor.on('PreInit', function() {
      editor.serializer.addNodeFilter(htmlTag, function(nodes) {
        var i = nodes.length, node, className;

        while (i--) {
          node = nodes[i];
          classNames = node.attr('class');
          if (classNames && classNames.indexOf(htmlClass) !== -1) {
            var match = classNames.match(/alert-([^\s]+)/);
            var level = match && match.length > 1 ? match[1] : 'info';

            var newNode = $.wysiwyg.utils.node(template, editor);
            $.wysiwyg.utils.moveChildren(node, newNode);
            newNode.attr(dataAttr, level);
            node.replace(newNode);
          }
        }
      });

      editor.parser.addNodeFilter(tag, function(nodes) {
        var i = nodes.length, node, className;

        while (i--) {
          node = nodes[i];

          var level = node.attr(dataAttr) || 'info';

          var newNode = $.wysiwyg.utils.node(placeholder, editor);
          $.wysiwyg.utils.moveChildren(node, newNode);
          newNode.attr('class', 'alert alert-' + level + ' ' + htmlClass);
          node.replace(newNode);
        }
      });
    });

    /**
     * Add shortcut to jump out of the message block
     */
    $.wysiwyg.utils.addElementExitShortcut(editor, {
      rootElement : function(container) {
        var dom = editor.dom;
        var parentBlock = dom.getParent(container, dom.isBlock);
        /*
        // If the message block doesn't contains a 'p' tag but just text
        if(parentBlock.nodeName === 'DIV' && parentBlock.classList.contains('jalios-message')) {
          return parentBlock;
        }
        */
        var rootBlock = parentBlock.parentNode;
        return rootBlock.nodeName === 'DIV' && rootBlock.classList.contains('jalios-message') ? rootBlock : null;
      },
      paramName : 'jmessage_new_element'
    });

  });
}(window.jQuery);