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
      
      for (var index = 0; index < menu.length; index++) {
        var menuItem = menu[index];
        if (menuItem.type) { // already converted
          continue;
        }
        
        menuItem.type = "choiceitem";
 
        menuItem.value = menuItem.data;
        delete menuItem.data;
        
        const fontIconCapturingRegex = /[a-z]+ ([a-z0-9-]+)/; // "icomoon icomoon-youtube", "glyphicons glyphicons-article", "fa fa-bars"
        const fontIconfound = menuItem.icon && menuItem.icon.match(fontIconCapturingRegex)
        const fontIconName = fontIconfound && fontIconfound[1] ? fontIconfound[1] : null;
        const imageIconPath = menuItem.image; 
        
        const registeredIconName = "junifiedinsert-" + menuItem.value;
        if (fontIconName) {
          editor.ui.registry.addIcon(registeredIconName, '<span class="jalios-icon '+fontIconName+'"></span>' );
          menuItem.icon = registeredIconName;
        } else if (imageIconPath) {
          editor.ui.registry.addIcon(registeredIconName, '<span class="jalios-icon"><img style="width:1em;" src="'+imageIconPath+'"></span>' );
          menuItem.icon = registeredIconName;
          delete menuItem.image;
        } else {
          menuItem.icon = "junifiedinsert";
        }
        
      }

      return menu;
    }

    // Split Button
    editor.ui.registry.addIcon('junifiedinsert', '<span class="jalios-icon icomoon-plus2"></span>' );
    editor.ui.registry.addSplitButton('junifiedinsert', {
      icon : 'junifiedinsert',
      tooltip : tinymce.i18n.translate('junifiedinsert.btn.tooltip'),
      onAction : function() {
        openUnifiedInsert();
      },
      onItemAction: function (api, value) {
        openUnifiedInsert(value);
      },
      fetch: function (callback) {
        var items = getMenu();
        callback(items);
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
