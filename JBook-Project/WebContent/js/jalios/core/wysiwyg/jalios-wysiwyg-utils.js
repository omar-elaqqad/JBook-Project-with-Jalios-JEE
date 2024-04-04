!function ($) {

  // Namespace
  if (!$.wysiwyg) {
    $.wysiwyg = {};
  }

  $.wysiwyg.utils = {
    validation: {
      isEmailAddress: function (str) {
        var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        return pattern.test(str);
      },
      isEmpty: function (str) {
        var pattern = /\S+/;
        return !pattern.test(str);
      },
      isBoolean: function (str) {
        var pattern = /^(true|false)$/i;
        return pattern.test(str);
      },
      isInteger: function (str) {
        var pattern = /^\d+$/;
        return pattern.test(str);
      },
      isNumber: function (str) {
        var pattern = /^-?\d*\.?\d*$/;
        return pattern.test(str);
      },
      isSame: function (str1, str2) {
        return str1 === str2;
      },
      isHtmlBlank: function (str) {
        var pattern = /^((&nbsp;|&#160;|\s+|\u00a0|<br\s*\/?>|)[\r\n]*)+$/;
        return str == null || pattern.test(str);
      }
    },
    escape: function (str) {
      return (str + '').replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/'/g, '&#039;')
        .replace(/"/g, '&quot;');
    },
    unescape: function (str) {
      return (str + '').replace(/&amp;/g, '&')
        .replace(/&lt;/g, '<')
        .replace(/&gt;/g, '>')
        .replace(/&#039;/g, "'")
        .replace(/&quot;/g, '"');
    },

    /**
     * Retrieve a RegExp object suitable to match an HTML tag 
     * with the specified name and the specified attribute.
     */
    getTagRegExp: function (tagName, attributeName) {
      var optionnalSpacesRegex = '[\\r\\n\\t\\s]*';
      var oneAttributeNameRegex = '([^\t\n\f \/>"\'=]+)'; // https://stackoverflow.com/questions/925994/what-characters-are-allowed-in-an-html-attribute-name
      var oneAttributeValueRegex = '(?:(?:"([^"]*)")|(?:\'([^\']*)\'))'; // "..." or '...'
      var severalOptionnalAttributesRegex = '(?:' + optionnalSpacesRegex + oneAttributeNameRegex + '=' + oneAttributeValueRegex + optionnalSpacesRegex + ')*';

      var tagRegExp = '<' + tagName +
        severalOptionnalAttributesRegex +
        optionnalSpacesRegex + attributeName + '=' + oneAttributeValueRegex + optionnalSpacesRegex +
        severalOptionnalAttributesRegex +
        '(?:' +
        '(?:/>)|' + // self closing tag, or...  
        '(?:>' + '[\\r\\n\\t\\s]*.*?[\\r\\n\\t\\s]*' + '</' + tagName + '>)' + // tag with a value
        ')';

      return new RegExp(tagRegExp, 'gi');
    },

    /**
     * Create a tinymce Node from the given html string.
     */
    node: function (html, editor) {
      // Do not validate the given html
      var settings = $.extend({}, editor.settings, {
        validate: false
      });
      var parser = new tinymce.html.DomParser(settings, editor.schema);
      var newNode = parser.parse(html, {
        forced_root_block: false
      });
      if (newNode.type == Node.DOCUMENT_FRAGMENT_NODE) { // BODY node
        newNode = newNode.firstChild;
      }
      return newNode;
    },
    /**
     * Moves the children nodes from source node to target node.
     */
    moveChildren: function (nodeSource, nodeTarget) {
      var childNode = nodeSource.firstChild;
      while (childNode) {
        var currentNode = childNode;
        childNode = childNode.next;
        nodeTarget.append(currentNode);
      }
    },
    /**
     * Add shortcut to jump out of the element matched by the 'rootElement' function defined in options parameter.<br>
     * A new element is added after the root element and the cursor is moved on this new element.
     * 
     * @example
     * <pre>
     * $.wysiwyg.utils.addElementExitShortcut(editor, {
     *   rootElement: function(container) {
     *     var dom = editor.dom;
     *     var parentBlock = dom.getParent(container, dom.isBlock);
     *     var rootBlock = parentBlock.parentNode;
     *     return rootBlock.nodeName === 'DIV' && rootBlock.classList.contains('jalios-message') ? rootBlock : null;
     *   },
     *   paramName: 'jmessage_new_element'
     * });
     * </pre>
     * 
     * @param {Object} editor wysiwyg editor
     * @param {Object} options
     * @param {function(container)} options.rootElement returns the root element or null/false if the cursor is not present in the matched root element. The function has a 'container' parameter, the element where is found the cursor. The new element wille be added after this root element.
     * @param {string} options.paramName optional parameter name which can be added in a wysiwyg configuration to define the new element to be added
     */
    addElementExitShortcut: function (editor, options) {
      editor.on('keydown', function (event) {
        if (event.keyCode === tinymce.util.VK.ENTER && event.shiftKey) {
          var dom = editor.dom;
          var rng = editor.selection.getRng();
          new tinymce.dom.RangeUtils(dom).normalize(rng);
          var container = rng.startContainer;

          var rootElement = options.rootElement(container);
          if (rootElement) {
            event.preventDefault();

            var newElementName = editor.getParam(options.paramName, 'p');
            newElementName = newElementName ? newElementName.toUpperCase() : '';

            var newElement = dom.create(newElementName);
            setForcedBlockAttrs(editor, newElement);
            dom.insertAfter(newElement, rootElement);

            newElement.appendChild(dom.doc.createTextNode('\u00a0'));

            rng = dom.createRng();
            newElement.normalize();

            rng.setStart(newElement, 0);
            rng.setEnd(newElement, 0);
            editor.selection.setRng(rng);

            editor.selection.scrollIntoView(newElement);
          }
        }
      });

      var setForcedBlockAttrs = function (editor, node) {
        var forcedRootBlockName = editor.settings.forced_root_block;

        if (forcedRootBlockName && forcedRootBlockName.toLowerCase() === node.tagName.toLowerCase()) {
          editor.dom.setAttribs(node, editor.settings.forced_root_block_attrs);
        }
      };
    }
  };
}(window.jQuery);