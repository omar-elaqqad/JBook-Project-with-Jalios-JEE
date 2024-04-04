!function($) {
  tinymce.PluginManager.add('jcodesample', function(editor, url) {
    
    function isCodeButNotSample(elm) {
      return elm && elm.nodeName == 'CODE';
    }

    var isCodeOrCodeSampleSelection = function (editor) {
      var node = editor.selection.getStart();
      return editor.dom.is(node, 'code') ||
             editor.dom.is(node, 'pre[class*="language-"]');
    };
    
    /* Override codesample button with our custom behavior */
    const defaultCodeSampleButton = editor.ui.registry.getAll().buttons["codesample"];
    if (defaultCodeSampleButton) {
      // Our action add possibility to transform code for inline style
      defaultCodeSampleButton.onAction = function () {
        editor.execCommand('jcodesample');
      }
      // Our setups button as on/off for both inline code (<code>) and code sample (<pre>)      
      defaultCodeSampleButton.onSetup = function (api) {
        var nodeChangeHandler = function () {
          api.setActive(isCodeOrCodeSampleSelection(editor));
        };
        editor.on('NodeChange', nodeChangeHandler);
        return function () {
          return editor.off('NodeChange', nodeChangeHandler);
        };
      };
    }

    editor.addCommand('jcodesample', function () {
      var node = editor.selection.getNode();
      if (editor.selection.isCollapsed() && isCodeButNotSample(node)) {
        editor.formatter.remove('code');
        return;
      }
      editor.execCommand('codesample');
    });

    /* Provide ctx menu */
    editor.ui.registry.addMenuItem('jcodesample', {
      text: 'Insert/Edit Code Sample',
      icon: 'code-sample',
      onAction: function () {
        editor.execCommand('jcodesample');
      }
    });
    
  });
}(window.jQuery);