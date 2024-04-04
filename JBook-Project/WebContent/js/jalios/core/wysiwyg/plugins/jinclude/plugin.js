!function($) {
  tinymce.PluginManager.add('jinclude', function(editor, url) {

    var tag = 'jalios:include';
    var dataAttr = 'data-jalios-type';
    var dataAttrParams = 'data-jalios-params';
    
    var htmlTag = 'iframe';
    var htmlDataAttr = 'data-jalios-include-type';
    var mceHtmlDataAttr = 'data-mce-p-' + htmlDataAttr;

    var includePreview = 'js/jalios/core/wysiwyg/plugins/jinclude/jsp/jincludePreview.jsp';
    
    // @formatter:off
    var template = editor.getParam('include_template', '<' + tag + '@attributes@ />');
    var placeholder = editor.getParam('include_placeholder', '<' + htmlTag + '@attributes@ contenteditable="false"></' + htmlTag + '>');
    
    var templateRegExp = '<' + tag + '[^>]*' + dataAttr + '="([^"]+)"[^>]*>(</' + tag + '>)?';
    var placeholderRegExp = '<' + htmlTag + '[^>]*' + htmlDataAttr + '="([^"]+)"[^>]*>[^<]*</' + htmlTag + '>';
    // @formatter:on

    editor.addCommand('JaliosInsert-include', function (ui, attributes) {
      if (!attributes) {
        return;
      }

      var includeType = attributes["data-jalios-type"];
      var includeParams = attributes["data-jalios-params"];
      if (includeType && includeParams) {
        var content = createHtmlTag(includeType, includeParams);
        editor.insertContent(content);
      }

    });
    editor.on('ResolveName', function(event) {
      var elt = event.target;
      if (isInclude(elt)) {
        event.name = 'jalios:include';
      }
    });

    editor.on('BeforeSetContent', function(event) {
      event.content = replaceContent(event.content);
    });

    editor.on('PostProcess', function(event) {
      if (event.get) {
        event.content = restoreContent(event.content);
      }
    });

    function isInclude(node) {
      return (node.nodeName.toUpperCase() === htmlTag.toUpperCase() && editor.dom.getAttrib(node, htmlDataAttr))
          // tinymce media plugin add a span wrapper around the jmedia htmlTag if it's an iframe
          || (node.nodeName.toUpperCase() === 'SPAN' && editor.dom.hasClass(node, 'mce-object-iframe') && editor.dom.getAttrib(node,
              mceHtmlDataAttr));
    }

    function replaceContent(content) {
      var regex = new RegExp(templateRegExp, 'gi');
      return content.replace(regex, function($0, $1) {
        var $elt = $($0);

        var includeType = $elt.attr(dataAttr);
        var includeParams = $elt.attr(dataAttrParams);
        if (includeType && includeParams) {
          return createHtmlTag(includeType, includeParams);
        } else { // data not found
          return $0
        }
      });
    }

    function restoreContent(content) {
      var regex = new RegExp(placeholderRegExp, 'gi');
      content = content.replace(regex, function($0, $1) {
        var $elt = $($0);
        var includeType = $elt.attr(htmlDataAttr);
        var includeParams = $elt.attr(dataAttrParams);
        return createTag(includeType, includeParams);
      });

      return content;
    }

    function createTag(includeType, includeParams) {
      var attr = ' ';
      attr += includeType ? ' data-jalios-type="' + includeType + '"' : '';
      attr += includeParams ? ' data-jalios-params="' + includeParams + '"' : '';
      return template.replace(/@attributes@/g, attr);
    }
    
    function createHtmlTag(includeType, includeParams) {
      var url = includePreview + '?type=' + encodeURIComponent(includeType) +
                (includeParams ? '&amp;params=' + encodeURIComponent(includeParams) : '');
      url = JCMS.Security.getUrlWithCSRFToken(url);

      var attr = ' src="' + url + '" ' + htmlDataAttr + '="' + includeType + '" data-mce-src="' + url + '"';
      attr += includeType ? ' data-jalios-type="' + includeType + '"' : '';
      attr += includeParams ? ' data-jalios-params="' + includeParams + '"' : '';

      return placeholder.replace(/@attributes@/g, attr);
    }

  });
}(window.jQuery);