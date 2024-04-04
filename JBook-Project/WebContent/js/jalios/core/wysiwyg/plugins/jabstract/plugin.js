!function($) {
  tinymce.PluginManager.add('jabstract', function(editor, url) {

    var tag = 'jalios:abstract';

    var htmlTag = 'div';
    var htmlClass = 'jalios-abstract';

    var template = editor.getParam('abstract_template', '<' + tag + '>@body@</' + tag + '>');
    var placeholder = editor.getParam('abstract_placeholder', '<' + htmlTag + ' class="' + htmlClass + '">@body@</' + htmlTag + '>');

    // Display the jalios tag name in element path
    editor.on('ResolveName', function(event) {
      var elt = event.target;
      if (isPluginHtmlTag(elt)) {
        event.name = 'jalios:abstract';
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
          className = node.attr('class');
          if (className && className.indexOf(htmlClass) !== -1) {
            var newNode = $.wysiwyg.utils.node(template.replace(/@body@/g, ''), editor);
            $.wysiwyg.utils.moveChildren(node, newNode);
            node.replace(newNode);
          }
        }
      });

      editor.parser.addNodeFilter(tag, function(nodes) {
        var i = nodes.length, node, className;

        while (i--) {
          node = nodes[i];
          var newNode = $.wysiwyg.utils.node(placeholder.replace(/@body@/g, ''), editor);
          $.wysiwyg.utils.moveChildren(node, newNode);
          node.replace(newNode);
        }
      });
    });

    /**
     * Add shortcut to jump out of the abstract block
     */
    $.wysiwyg.utils.addElementExitShortcut(editor, {
      rootElement : function(container) {
        var dom = editor.dom;
        var parentBlock = dom.getParent(container, dom.isBlock);
        var rootBlock = parentBlock.parentNode;
        return rootBlock.nodeName === 'DIV' && rootBlock.classList.contains('jalios-abstract') ? rootBlock : null;
      },
      paramName : 'jabstract_new_element'
    });

  });
}(window.jQuery);