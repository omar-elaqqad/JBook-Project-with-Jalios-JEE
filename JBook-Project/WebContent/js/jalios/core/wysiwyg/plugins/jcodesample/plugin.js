!function($) {
  tinymce.PluginManager.add('jcodesample', function(editor, url) {
    
    function isCodeButNotSample(elm) {
      return elm && elm.nodeName == 'CODE';
    }

    /* Override codesample button with our custom behavior */
    editor.addButton('codesample', {
      cmd: 'jcodesample',
      title: 'Insert/Edit code sample',
      stateSelector: 'pre,code' 
    });

    editor.addCommand('jcodesample', function () {
      var node = editor.selection.getNode();
      if (editor.selection.isCollapsed() && isCodeButNotSample(node)) {
        editor.formatter.remove('code');
        return;
      }
      editor.execCommand('codesample');
    });

    /* Provide ctx menu */
    editor.addMenuItem('jcodesample', {
      text: 'Insert/Edit code sample',
      icon: 'codesample',
      cmd: 'codesample'
    });
    
  });
}(window.jQuery);