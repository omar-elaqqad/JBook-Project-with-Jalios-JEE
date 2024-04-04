!function($) {
  tinymce.PluginManager.add('jlink', function(editor, url) {

    var tag = 'jalios:link';
    var dataAttr = 'data-jalios-id';

    var htmlTag = 'a';
    var htmlDataAttr = 'data-jalios-link-id';

    var templateBlock = editor.getParam('link_template_block', '<' + tag + '@attributes@>@content@</' + tag + '>');
    var templateShortEnded = editor.getParam('link_template_short', '<' + tag + '@attributes@ />');
    var placeholder = editor.getParam('link_placeholder', '<' + htmlTag + '@attributes@>@content@</' + htmlTag + '>');

    var templateRegExp = $.wysiwyg.utils.getTagRegExp(tag, dataAttr);
    var placeholderRegExp = $.wysiwyg.utils.getTagRegExp(htmlTag, htmlDataAttr);

    editor.jalios.plugins.jlink = {
        insertTag: function(source) {
          var options = {
            // Insert only the source so that the title of the publication is resolved dynamically on the server side
            source : source
          }

          // Get the selected text
          var selectedHTML = editor.selection.getContent();
          if (!!$.trim(selectedHTML) && !selectedHTML.match(/[\r\n]+/gi)) {
            // Set the content if there is a selected text
            options.content = selectedHTML;
          }

          // Insert content into editor
          var content = editor.jalios.plugins.jlink.createTag(options);
          editor.insertContent(content + '&nbsp;');
        },

        createTag: function(options) {
          var attr = ' ' + dataAttr + '="' + $.wysiwyg.utils.escape(options.source) + '"';
          attr += options.title ? ' data-jalios-title="' + $.wysiwyg.utils.escape(options.title) + '"' : '';
          attr += options.style ? ' data-jalios-style="' + $.wysiwyg.utils.escape(options.style) + '"' : '';
          attr += options.classes ? ' data-jalios-class="' + $.wysiwyg.utils.escape(options.classes) + '"' : '';
          attr += options.target ? ' data-jalios-target="' + $.wysiwyg.utils.escape(options.target) + '"' : '';
          attr += options.displayUrl ? ' data-jalios-url="' + $.wysiwyg.utils.escape(options.displayUrl) + '"' : '';

          var tag;
          if (options.content) {
            tag = templateBlock.replace(/@attributes@/g, attr).replace(/@content@/g, options.content);
          } else {
            tag = templateShortEnded.replace(/@attributes@/g, attr);
          }
          return tag;
        },

        createHtmlTag: function(options) {
          var activeUrl = options.displayUrl || options.url;
          var attr = ' href="' + activeUrl + '" ' + htmlDataAttr + '="' + $.wysiwyg.utils.escape(options.source) + '"';
          attr += options.title ? ' title="' + $.wysiwyg.utils.escape(options.title) + '"' : '';
          attr += options.style ? ' style="' + $.wysiwyg.utils.escape(options.style) + '"' : '';
          attr += options.classes ? ' class="' + $.wysiwyg.utils.escape(options.classes) + '"' : '';
          attr += options.target ? ' target="' + $.wysiwyg.utils.escape(options.target) + '"' : '';
          attr += options.displayUrl ? ' data-jalios-url="' + $.wysiwyg.utils.escape(options.url) + '"' : '';
          return placeholder.replace(/@attributes@/g, attr).replace(/@content@/g, options.content);
        }
    }
    
    // Add a button
    editor.ui.registry.addIcon('jlink', '<span class="jalios-icon icomoon-file-text2"></span>' );
    editor.ui.registry.addToggleButton('jlink', {
      tooltip : tinymce.i18n.translate('jlink.btn.tooltip'),
      icon : 'jlink',
      onAction : openChooser,
      onSetup : function(buttonApi) {
        const nodeChangeHandler = function (eventApi) {
          buttonApi.setActive(isLink(eventApi.element));
        };
        editor.on('NodeChange', nodeChangeHandler);
        return function (buttonApi) {
          editor.off('NodeChange', nodeChangeHandler);
        }
      }
    });
    
    editor.addCommand('JaliosInsert-link', function (ui, attributes) {
      if (!attributes) {
        return;
      }
      
      var source = attributes["data-jalios-id"];

      var cachedMediaInfos = editor.jcms.getMediaInfos(source);
      if (cachedMediaInfos && cachedMediaInfos.source) { // data found
        editor.jalios.plugins.jlink.insertTag(cachedMediaInfos.source);
      }
    });

    // Adds a menu item
    /*
     * editor.ui.registry.addMenuItem('jlink', { text: 'JLink plugin', context: 'tools', onAction: openChooser });
     */

    // Display the jalios tag name in element path
    editor.on('ResolveName', function(event) {
      var elt = event.target;
      if (isLink(elt)) {
        event.name = 'jalios:link';
      }
    });

    /**
     * Bind the click event to select the whole element if the element on which the user clicked is an element of this plugin and make sure that if
     * the user selects another content it replaces this element completely.
     */
    editor.on('Click', function(e) {
      var elt = e.target;
      if (isLink(elt)) {
        editor.selection.select(elt);
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

    function isLink(node) {
      return (node.nodeName.toUpperCase() === htmlTag.toUpperCase() && editor.dom.getAttrib(node, htmlDataAttr));
    }

    function openChooser() {
      $.jalios.ui.Widget.Chooser.openDataChooser('publication', callback, {
        params : {
          ws : editor.jcms.getContext().getWorkspace()
        }
      });

      function callback(source, title, media, url, width, height) {
        var mediaInfos = {
          source : source,
          content : $.wysiwyg.utils.escape(title),
          title : title,
          type : media,
          url : url,
          width : width,
          height : height
        };

        // Cache the MediaInfos
        editor.jcms.setMediaInfos(mediaInfos);

        editor.jalios.plugins.jlink.insertTag(source);
      }
    }

    function replaceContent(content) {
      return content.replace(templateRegExp, function($0) {
        var $elt = $($0);

        var source = $elt.attr(dataAttr);

        var cachedMediaInfos = editor.jcms.getMediaInfos(source);
        var isSourceDataId = /^\w+_\w+$/.match(source);
        var isMissingData = isSourceDataId && (!cachedMediaInfos || cachedMediaInfos.source === cachedMediaInfos.url);
        if (cachedMediaInfos && cachedMediaInfos.source && !isMissingData) { // data found
          var mediaInfos = {
            source : source,
            content : $elt.html(),
            title : $elt.attr('data-jalios-title'),
            style : $elt.attr('data-jalios-style'),
            classes : $elt.attr('data-jalios-class'),
            target : $elt.attr('data-jalios-target'),
            url : cachedMediaInfos.url,
            displayUrl : cachedMediaInfos.displayUrl
          };

          if ($.wysiwyg.utils.validation.isHtmlBlank(mediaInfos.content)) {
            mediaInfos.content = $.wysiwyg.utils.escape(cachedMediaInfos.title) || (isSourceDataId ? "" : $.wysiwyg.utils.escape(source));
          }

          return editor.jalios.plugins.jlink.createHtmlTag(mediaInfos);
        } else { // data not found
          return $0;
        }
      });
    }

    function restoreContent(content) {
      content = content.replace(placeholderRegExp, function($0) {
        var $elt = $($0);

        var source = $elt.attr(htmlDataAttr);

        var cachedMediaInfos = editor.jcms.getMediaInfos(source);
        var activeHref = $elt.attr('data-jalios-url') || $elt.attr('href');

        if (activeHref === cachedMediaInfos.url) {
          var mediaInfos = {
            source : source,
            // if content == cached title -> do not insert it to be resolved dynamically on the server side
            content : (cachedMediaInfos.title || '').replaceAll(/\ +/g, ' ') !== $.wysiwyg.utils.unescape($elt.html()) ? $elt.html() : false,
            // if title == cached title -> do not insert it to be resolved dynamically on the server side
            title : cachedMediaInfos.title !== $elt.attr('title') ? $elt.attr('title') : false,
            style : $elt.attr('style'),
            classes : $elt.attr('class'),
            target : $elt.attr('target')
          };

          return editor.jalios.plugins.jlink.createTag(mediaInfos);
        } else {
          // The user modified the href, so we clean the element to remove specific attributes/classes to get a standard link
          return $elt.attr(htmlDataAttr, null).prop('outerHTML');
        }
      });

      return content;
    }
  });
}(window.jQuery);