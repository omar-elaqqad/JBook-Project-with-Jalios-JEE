!function($) {
  tinymce.PluginManager.add('jtoc', function(editor, url) {

    /**
     * Default value used in dialog when inserting
     * Those value must provide a nice default behavior on insertion.
     */
    const AUTONUMBER_DEFAULT_VALUE = true;
    const LEVEL_DEFAULT_VALUE = 3;

    /** 
     * Default values used in display/edition if <jalios:toc> did not specified those information.
     * Those value must match the default values applied by JHTMLRenderer.
     */
    const AUTONUMBER_DEFAULT_VALUE_IF_UNSPECIFIED_IN_TOC = true;
    const LEVEL_DEFAULT_VALUE_IF_UNSPECIFIED_IN_TOC = 6;

    const i18n = tinymce.i18n;

    var tag = 'jalios:toc';

    var htmlTag = 'div';
    var htmlClass = 'jalios-toc';

    // @formatter:off
    var template = editor.getParam('toc_template', '<' + tag + '@attributes@ />');
    var placeholder = editor.getParam('toc_placeholder',
        '<' + htmlTag + '@attributes@ class="' + htmlClass + '" contenteditable="false">'
        + '<div class="jalios-toc-title">@title@</div>'
        + '<div class="jalios-toc-body"><ul><li>@autonumber@</li><li>@level@</li></ul></div>'
        + '</' + htmlTag + '>');
    // @formatter:on

    // @formatter:off
    var templateRegExp = '<' + tag + '[^>]*>(</' + tag + '>)?';
    var placeholderRegExp = (
        '<' + htmlTag + '[^>]*class="' + htmlClass + '[^"]*"[^>]*>'
        + '<div class="jalios-toc-title">([^<]+)</div>'
        + '<div class="jalios-toc-body"><ul><li>([^<]+)</li><li>([^<]+)</li></ul></div>'
        + '</' + htmlTag + '>'
        ).replace(/></g, '>[\\r\\n\\t\\s]*<'); // Manage potential line breaks
    // @formatter:on

    // Add a button
    editor.ui.registry.addIcon('jtoc', '<span class="jalios-icon icomoon-file-text"></span>' );
    editor.ui.registry.addToggleButton('jtoc', {
      tooltip : tinymce.i18n.translate('jtoc.btn.tooltip'),
      icon : 'jtoc',
      onAction : function(buttonApi) {
        showDialog();
      },
      
      onSetup : function(buttonApi) {
        const nodeChangeHandler = function (eventApi) {
          buttonApi.setActive(isToc(eventApi.element));
        };
        editor.on('NodeChange', nodeChangeHandler);
        return function (buttonApi) {
          editor.off('NodeChange', nodeChangeHandler);
        }
      }
    });

    // Display the jalios tag name in element path
    editor.on('ResolveName', function(event) {
      var elt = event.target;
      if (isToc(elt)) {
        event.name = 'jalios:toc';
      }
    });

    /**
     * Bind the click event to select the whole element if the element on which the user clicked is an element of this plugin and make sure that if
     * the user selects another content it replaces this element completely.
     */
    editor.on('Click', function(e) {
      var elt = e.target;
      if (isToc(elt)) {
        editor.selection.select(elt);
      }
    });

    function isToc(node) {
      return node.nodeName.toUpperCase() === htmlTag.toUpperCase() && 
             editor.dom.hasClass(node, htmlClass);
    }

    editor.on('BeforeSetContent', function(event) {
      event.content = replaceContent(event.content);
    });

    editor.on('PostProcess', function(event) {
      if (event.get) {
        event.content = restoreContent(event.content);
      }
    });

    function showDialog() {
      var selectedNode = editor.selection.getStart();
      var isTOC = isToc(selectedNode);

      var autonumber = AUTONUMBER_DEFAULT_VALUE;
      var level = LEVEL_DEFAULT_VALUE;
      if (isTOC) {
        var $selectedNode = $(selectedNode);
        autonumber = getTocAutoNumber($selectedNode);
        level = getTocLevel($selectedNode);
      }

      editor.windowManager.open({
        title : 'jtoc.form.title',
        body : {
          type: 'panel',
          items: [ {
            type : 'checkbox',
            name : 'autonumber',
            label : 'jtoc.form.label.autonumber'
          }, {
            type : 'selectbox',
            name : 'level',
            label : 'jtoc.form.label.level',
            items: [
              { text:'1', value: '1' },
              { text:'2', value: '2' },
              { text:'3', value: '3' },
              { text:'4', value: '4' },
              { text:'5', value: '5' },
              { text:'6', value: '6' }
            ]
          }
          ]
        },
        buttons: [
          {
            type: 'cancel',
            name: 'closeButton',
            text: 'Cancel'
          },
          {
            type: 'submit',
            name: 'submitButton',
            text: 'Save',
            primary: true
          }
        ],
        initialData: {
          autonumber: autonumber,
          level: ''+level
        },
        onSubmit : function(dialogApi) {
          var data = dialogApi.getData();
          var autonumber = data.autonumber;
          var level = data.level;

          if ($.wysiwyg.utils.validation.isEmpty(autonumber)) {
            e.preventDefault();
            editor.windowManager.alert(i18n.translate([ 'jtoc.form.error.required', i18n.translate('jtoc.form.label.autonumber') ]));
            return;
          }
          if (!$.wysiwyg.utils.validation.isBoolean(autonumber)) {
            e.preventDefault();
            editor.windowManager.alert(i18n.translate([ 'jtoc.form.error.invalid-boolean', i18n.translate('jtoc.form.label.autonumber') ]));
            return;
          }
          if ($.wysiwyg.utils.validation.isEmpty(level)) {
            e.preventDefault();
            editor.windowManager.alert(i18n.translate([ 'jtoc.form.error.required', i18n.translate('jtoc.form.label.level') ]));
            return;
          }
          if (!$.wysiwyg.utils.validation.isInteger(level)) {
            e.preventDefault();
            editor.windowManager.alert(i18n.translate([ 'jtoc.form.error.invalid-integer', i18n.translate('jtoc.form.label.level') ]));
            return;
          }

          var content = createTag({
            autonumber : autonumber,
            level : level
          });
          editor.insertContent(content);
          dialogApi.close();
        }
      });
    }

    function replaceContent(content) {
      var regex = new RegExp(templateRegExp, 'gi');
      return content.replace(regex, function($0) {
        var $elt = $($0);
        return createHtmlTag({
          autonumber : getTocAutoNumber($elt),
          level : getTocLevel($elt)
        });
      });
    }

    function restoreContent(content) {
      var regex = new RegExp(placeholderRegExp, 'gi');
      return content.replace(regex, function($0) {
        var $elt = $($0);
        return createTag({
          autonumber : getTocAutoNumber($elt),
          level : getTocLevel($elt)
        });
      });
    }

    function createTag(options) {
      var attr = '';
      attr += ' data-jalios-autonumber="' + options.autonumber + '"';
      attr += options.level ? ' data-jalios-level="' + options.level + '"' : '';
      return template.replace(/@attributes@/g, attr).replace(/@content@/g, options.content);
    }

    function createHtmlTag(options) {
      var attr = '';
      attr += ' data-jalios-autonumber="' + options.autonumber + '"';
      attr += options.level ? ' data-jalios-level="' + options.level + '"' : '';

      // @formatter:off
      return placeholder
                .replace(/@attributes@/g, attr)
                .replace('@title@', i18n.translate('jtoc.title'))
                .replace(/@autonumber@/g, i18n.translate(['jtoc.autonumber', i18n.translate('jtoc.autonumber.' + options.autonumber)]))
                .replace(/@level@/g, i18n.translate(['jtoc.level', options.level]));
      // @formatter:on
    }
    
    function getTocAutoNumber($elt) {
      var autonumber = $elt.data('jalios-autonumber');
      if (autonumber == undefined || autonumber === '') {
        autonumber = AUTONUMBER_DEFAULT_VALUE_IF_UNSPECIFIED_IN_TOC;
      }
      return autonumber;
    }

    function getTocLevel($elt) {
      var level = $elt.data('jalios-level');
      if (level == undefined || level === '') {
        level = LEVEL_DEFAULT_VALUE_IF_UNSPECIFIED_IN_TOC;
      }
      return level;
    }

  });
}(window.jQuery);