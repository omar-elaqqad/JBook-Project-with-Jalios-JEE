! function($) {
  tinymce.PluginManager.add('jmedia', function(editor, url) {

    var tag = 'jalios:media';
    var dataAttr = 'data-jalios-source';

    var htmlTag = 'iframe';
    var htmlImgTag = 'img';
    var htmlDataAttr = 'data-jalios-media-source';
    var mceHtmlDataAttr = 'data-mce-p-' + htmlDataAttr;

    // var mediaUrl = 'js/jalios/core/wysiwyg/plugins/jmedia/jsp/media.jsp';
    var mediaUrl = 'jcore/media/embed.jsp';

    // @formatter:off
    var template = editor.getParam('media_template', '<' + tag + '@attributes@ />');
    var placeholder = editor.getParam('media_placeholder', '<' + htmlTag + '@attributes@ contenteditable="false"></' + htmlTag + '>');
    var placeholderImg = editor.getParam('media_img_placeholder', '<' + htmlImgTag + '@attributes@ />');

    var templateRegExp = $.wysiwyg.utils.getTagRegExp(tag, dataAttr);
    var placeholderRegExp = $.wysiwyg.utils.getTagRegExp(htmlTag, htmlDataAttr);
    var placeholderImgRegExp = $.wysiwyg.utils.getTagRegExp(htmlImgTag, htmlDataAttr);
    // @formatter:on

    editor.jalios.plugins.jmedia = {
      insertTag: function(options) {
        // Insert content into editor
        var content = editor.jalios.plugins.jmedia.createTag(options, true);
        editor.insertContent(content);
      },

      createTag: function(options, isInsertion) {
        var attr = ' ' + dataAttr + '="' + $.wysiwyg.utils.escape(options.source) + '"';
        attr += options.width ? ' data-jalios-width="' + options.width + '"' : '';
        attr += options.height ? ' data-jalios-height="' + options.height + '"' : '';
        // Only add title upon update (When title / alt has been set by user directly)
        if (!isInsertion) {
          attr += options.title ? ' data-jalios-title="' + $.wysiwyg.utils.escape(options.title) + '"' : '';
        }
        attr += options.style ? ' data-jalios-style="' + $.wysiwyg.utils.escape(options.style) + '"' : '';
        attr += options.classes ? ' data-jalios-class="' + $.wysiwyg.utils.escape(options.classes) + '"' : '';
        return template.replace(/@attributes@/g, attr);
      },

      createHtmlTag: function(options) {
        var url = mediaUrl + '?autoresize=true&src=' + encodeURIComponent(options.source) + (options.width ? '&width=' + options.width : '') + (options.height ? '&height=' + options.height : '');
        if (options.type === 'image') {
          url = options.url;
        }

        var attr = ' src="' + $.wysiwyg.utils.escape(url) + '" ' +
           htmlDataAttr + '="' + $.wysiwyg.utils.escape(options.source) + '" ' +
           'data-mce-src="' + $.wysiwyg.utils.escape(url) + '"';
        
        if (options.width) {
          attr += ' width="' + options.width + '"'; 
          options.classes = ((options.classes || '').replace(/\s*is-width-set/gi, '') + ' is-width-set').trim();
        }

        if (options.height) {
          attr += ' height="' + options.height + '"';
          options.classes = ((options.classes || '').replace(/\s*is-height-set/gi, '') + ' is-height-set').trim();
        }
        
        attr += options.title ? ' title="' + $.wysiwyg.utils.escape(options.title) + '" alt="' + $.wysiwyg.utils.escape(options.title) + '"' : '';
        attr += options.style ? ' style="' + $.wysiwyg.utils.escape(options.style) + '"' : '';
        attr += options.classes ? ' class="' + $.wysiwyg.utils.escape(options.classes) + '"' : '';

        var _placeholder = options.type === 'image' ? placeholderImg : placeholder;
        return _placeholder.replace(/@attributes@/g, attr);
      }
    };

    // Add a button
    editor.addButton('jmedia', {
      tooltip: tinymce.i18n.translate('jmedia.btn.tooltip'),
      icon: 'icomoon icomoon-film4',
      onclick: openChooser,

      onpostrender: function() {
        var btn = this;
        editor.on('NodeChange', function(e) {
          btn.active(isMedia(e.element));
        });
      }
    });

    editor.addCommand('JaliosInsert-media', function(ui, attributes) {
      if (!attributes) {
        return;
      }

      var source = attributes["data-jalios-source"];
      var cachedMediaInfos = editor.jcms.getMediaInfos(source);
      if (cachedMediaInfos && cachedMediaInfos.source) { // data found
        editor.jalios.plugins.jmedia.insertTag(cachedMediaInfos);
      }
    });

    // Adds a menu item
    /*
     * editor.addMenuItem('publication', { text: 'JMedia plugin', context: 'tools', onclick: openChooser });
     */

    // Display the jalios tag name in element path
    editor.on('ResolveName', function(event) {
      var elt = event.target;
      if (isMedia(elt)) {
        event.name = 'jalios:media';
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

    function isMedia(node) {
      return (node.nodeName.toUpperCase() === htmlTag.toUpperCase() && editor.dom.getAttrib(node, htmlDataAttr)) ||
        (node.nodeName.toUpperCase() === htmlImgTag.toUpperCase() && editor.dom.getAttrib(node, htmlDataAttr))
        // tinymce media plugin add a span wrapper around the jmedia htmlTag if it's an iframe
        ||
        (node.nodeName.toUpperCase() === 'SPAN' && editor.dom.hasClass(node, 'mce-object-iframe') && editor.dom.getAttrib(node,
          mceHtmlDataAttr));
    }

    function openChooser() {
      $.jalios.ui.Widget.Chooser.openDataChooser('media', callback, {
        params: {
          ws: editor.jcms.getContext().getWorkspace()
        }
      });

      function callback(source, title, media, url, width, height) {
        var mediaInfos = {
          source: source,
          title: title,
          type: media,
          url: url,
          width: width,
          height: height
        };

        // Cache the MediaInfos
        editor.jcms.setMediaInfos(mediaInfos);

        // Insert content when the window form is submitted
        editor.jalios.plugins.jmedia.insertTag(mediaInfos);
      }
    }

    function replaceContent(content) {
      return content.replace(templateRegExp, function($0, $1) {
        var $elt = $($0);

        var source = $elt.attr(dataAttr);

        var cachedMediaInfos = editor.jcms.getMediaInfos(source);
        var isSourceDataId = /^\w+_\w+$/.match(source);
        var isMissingData = isSourceDataId && (!cachedMediaInfos || cachedMediaInfos.source === cachedMediaInfos.url);
        if (cachedMediaInfos && cachedMediaInfos.source && !isMissingData) { // data found
          var mediaInfos = {
            source: source,
            width: $elt.attr('data-jalios-width'),
            height: $elt.attr('data-jalios-height'),
            title: $elt.attr('data-jalios-title'),
            style: $elt.attr('data-jalios-style'),
            classes: $elt.attr('data-jalios-class')
          };

          if (!$elt.attr('data-jalios-title')) {
            cachedMediaInfos.title = undefined;
          }

          mediaInfos = $.extend({}, cachedMediaInfos, mediaInfos);

          return editor.jalios.plugins.jmedia.createHtmlTag(mediaInfos);
        } else { // data not found
          return $0
        }
      });
    }

    function restoreContent(content) {
      content = content.replace(placeholderRegExp, function($0, $1) {
        var $elt = $($0);
        return editor.jalios.plugins.jmedia.createTag({
          source: $elt.attr(htmlDataAttr),
          width: $elt.attr('width'),
          height: $elt.attr('height'),
          title: $elt.attr('title'),
          style: $elt.attr('style'),
          classes: $elt.attr('class')
        }, false);
      });

      content = content.replace(placeholderImgRegExp, function($0, $1) {
        var $elt = $($0);
        return editor.jalios.plugins.jmedia.createTag({
          source: $elt.attr(htmlDataAttr),
          width: $elt.attr('width'),
          height: $elt.attr('height'),
          title: $elt.attr('alt') || $elt.attr('title'),
          style: $elt.attr('style'),
          classes: $elt.attr('class')
        }, false);
      });

      return content;
    }

  });
}(window.jQuery);
