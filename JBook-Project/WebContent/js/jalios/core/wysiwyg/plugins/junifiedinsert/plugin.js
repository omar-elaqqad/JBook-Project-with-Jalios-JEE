!function($) {
  tinymce.PluginManager.add('junifiedinsert', function(editor, url) {

    /**
     * Callback invoked from the UnifiedInsert popup when a selection was performed
     */
    var performInsertCallback = function(unifiedinsert) {
      if (!unifiedinsert || !unifiedinsert.type) {
        return;
      }
      editor.execCommand('JaliosInsert-' + unifiedinsert.type, false, unifiedinsert.attributes);
    }

    /**
     * Open the Unified Insert window
     */
    var openUnifiedInsert = function(item) {
      var params = {
        ws : editor.jcms.getContext().getWorkspace(),
        configurationId : editor.jcms.getContext().configurationId
      };
      if (item) {
        params.select = item;
      }

      $.jalios.ui.Widget.Chooser.openDataChooser('unifiedinsert', performInsertCallback, {
        params : params,
        popup : {
          width : 1200,
          height : 800
        }
      });
    }

    /**
     * Returns the menu with the list of menu items
     */
    var getMenu = function() {
      var menu = [];

      var wysiwygEditorInfos = editor.jcms.getWysiwygEditorInfos();
      if (wysiwygEditorInfos && wysiwygEditorInfos.menuItems) {
        menu = wysiwygEditorInfos.menuItems;
      }

      return menu;
    }

    // Split Button
    editor.addButton('junifiedinsert', {
      type : 'splitbutton',
      icon : 'insert',
      tooltip : tinymce.i18n.translate('junifiedinsert.btn.tooltip'),
      menu : getMenu(),
      onselect : function(e) {
        openUnifiedInsert(e.control.settings.data);
      },
      onclick : function() {
        openUnifiedInsert();
      },
      onPostRender : function() {
        var btn = this;
        editor.on('init', function() {
          btn.menu = null;
          btn.settings.menu = btn.state.data.menu = getMenu();
        });
      }
    });
    
    // Add generic command to allow HTML insertion  
    editor.addCommand('JaliosInsert-html', function (ui, attributes) {
      if (!attributes) {
        return;
      }
      
      var html = attributes["data-jalios-html"];
      if (!html || html.trim() === '') {
        return;
      }
      editor.insertContent(html);
    });

  });
}(window.jQuery);
