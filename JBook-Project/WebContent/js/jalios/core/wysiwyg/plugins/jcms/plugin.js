!function($) {
  tinymce.PluginManager.add('jcms', function(editor, url) {

    var ignoredTags = []; // [ 'jalios:link', 'jalios:mention', 'jalios:media', 'jalios:toc', 'jalios:abstract' ];

    var mediaCache = [];

    var memberCache = [];

    var pluginsCache = {};

    editor.jcms = {
      getContext : function() {
        return editor.jcms.context || {};
      },
      getWysiwygEditorInfos : function() {
        if (editor.jcms.wysiwygEditorInfos) {
          return editor.jcms.wysiwygEditorInfos;
        }
        
        var wysiwygEditorInfos;
        try {
          let $textarea = $(editor.getElement());
          if (!$textarea || !$textarea.exists()) {
            wysiwygEditorInfos = "{}";
          } else {
            var wysiwygEditorInfosElm = $textarea.closest('.wysiwyg-editor').find('.wysiwyg-editor-infos');
            var value = wysiwygEditorInfosElm.exists() ? wysiwygEditorInfosElm[0].value : '{}';
            wysiwygEditorInfos = value === null || value === "" ? {} :  $.parseJSON(value);
          }
        } catch (ex) {
          $.console.log('Could not parse wysiwyg-editor-infos', $textarea, value, ex); 
        }
        if (wysiwygEditorInfos) {
          // Retrieve the wysiwyg editor infos
          editor.jcms.wysiwygEditorInfos = wysiwygEditorInfos;
  
          // Retrieve and cache the existing data infos
          var dataInfos = wysiwygEditorInfos.dataInfos;
          if (dataInfos) {
            for (var i = 0; i < dataInfos.length; i++) {
              var dataInfo = dataInfos[i];
              if (dataInfo.type === "Member") {
                editor.jcms.setMemberInfos(dataInfo);
              } else {
                editor.jcms.setMediaInfos(dataInfo);
              }
            }
          }
        } else {
          editor.jcms.wysiwygEditorInfos = {}
        }
      
        return editor.jcms.wysiwygEditorInfos || {};
      },
      getPluginDataInfos : function(pluginId, dataId) {
        var pluginCache = pluginsCache[pluginId] || [];
        var cachedPluginInfos = pluginCache[dataId];
        if (!cachedPluginInfos) {
          // $.console.log('Plugin Data with id "' + dataId + '" not found in the plugin cache -> ajax request');
          $.ajax({
            url : 'js/jalios/core/wysiwyg/plugins/jcms/jsp/pluginInfos.jsp',
            data : {
              pluginId : pluginId,
              dataId : dataId
            },
            async : false,
            dataType : 'json',
            success : function(data) {
              if (data && data.dataId) {
                cachedPluginInfos = data;
                // Cache the retrieved PluginInfos
                editor.jcms.setPluginDataInfos(pluginId, dataId, cachedPluginInfos);
              }
            },
            error : function(jqxhr, textStatus, error) {
              var err = textStatus + ', ' + error;
              $.console.log('Request Failed: ' + err);
            }
          });
        }
        return cachedPluginInfos || {};
      },
      setPluginDataInfos : function(pluginId, dataId, pluginDataInfos) {
        var pluginCache = pluginsCache[pluginId];
        if (!pluginCache) {
          pluginCache = [];
          pluginsCache[pluginId] = pluginCache;
        }
        pluginCache[dataId] = pluginDataInfos;
      },
      getMediaInfos : function(source) {
        var cachedMediaInfos = mediaCache[source];
        if (!cachedMediaInfos) {
          // $.console.log('Data with source "' + source + '" not found in the cache -> ajax request');
          $.ajax({
            url : 'js/jalios/core/wysiwyg/plugins/jcms/jsp/mediaInfos.jsp',
            data : {
              source : source
            },
            async : false,
            dataType : 'json',
            success : function(data) {
              if (data && data.source) {
                cachedMediaInfos = data;
                // Cache the retrieved MediaInfos
                editor.jcms.setMediaInfos(cachedMediaInfos);
              }
            },
            error : function(jqxhr, textStatus, error) {
              var err = textStatus + ', ' + error;
              $.console.log('Request Failed: ' + err);
            }
          });
        }
        return cachedMediaInfos || {};
      },
      setMediaInfos : function(mediaInfos) {
        mediaCache[mediaInfos.source] = mediaInfos;
      },
      getMemberInfos : function(mbrId) {
        var cachedMemberInfos = memberCache[mbrId];
        if (!cachedMemberInfos) {
          // $.console.log('Member with id "' + mbrId + '" not found in the cache -> ajax request');
          $.ajax({
            url : 'jcore/autocomplete/acmention.jsp',
            data : {
              memberId : mbrId
            },
            async : false,
            dataType : 'json',
            success : function(data) {
              if (data.length > 0) {
                cachedMemberInfos = data[0];

                // Cache the retrieved member
                editor.jcms.setMemberInfos(cachedMemberInfos);
              }
            },
            error : function(jqxhr, textStatus, error) {
              var err = textStatus + ', ' + error;
              $.console.log('Request Failed: ' + err);
            }
          });
        }
        return cachedMemberInfos || {};
      },
      setMemberInfos : function(memberInfos) {
        memberCache[memberInfos.id] = memberInfos;
      }
    };
    
    editor.on('PreInit', function() {
      var $editorElm = $(editor.getElement());

      // propagate language from input to editor (required for example when using browser spellchecker)
      var documentHtml = jQuery("html");
      var editorDocumentHtml = jQuery(editor.getDoc()).find("html");
      editorDocumentHtml.attr("lang", documentHtml.attr("lang"));
      editorDocumentHtml.attr("xml:lang", documentHtml.attr("xml:lang"));
      var editorBody = jQuery(editor.getBody());
      editorBody.attr("lang", $editorElm.attr("lang"));
      editorBody.attr("xml:lang", $editorElm.attr("xml:lang"));
      
      // Initialize the context
      var context = $editorElm.data();
      editor.jcms.context = $.extend({}, context, {
        getWorkspace : function() {
          var workspace = editor.jcms.context.workspace;

          // Check if the editor is in a publication editing form (eg. edit a generated type)
          var $editPubForm = $editorElm.closest('.edit-pub');
          if ($editPubForm.exists()) {
            var $wsInput = $editPubForm.find(':input[name="ws"]')
            if ($wsInput.exists()) {
              workspace = $wsInput.val() || workspace; // if the input is empty, use the current workspace
            }
          }

          return workspace;
        }
      });

      // Initialize editor infos
      editor.jcms.getWysiwygEditorInfos();
    });

    // --------------------------------------------------------------------------------
    // Header rewrite H1->H2, H2-H3...
    // --------------------------------------------------------------------------------

    editor.on('LoadContent', function() {
      let $editorBody = $(editor.getBody());
      let block_formats = editor.settings.block_formats;
      let block_formats_defined = block_formats && block_formats !== '';
      let hasH1InConf = block_formats_defined && block_formats.indexOf('h1') !== -1;
      let hasH2InConf = block_formats_defined && block_formats.indexOf('h2') !== -1;
      let hasH1 = $editorBody.find('H1').exists();
      let migrateHeaders = !hasH1InConf && hasH2InConf && hasH1;
      if (!migrateHeaders) {
        return;
      }
      for (var headerLevel = 6; headerLevel > 0; headerLevel--) {
        let newHeaderLevel = headerLevel + 1;
        let headers = $editorBody.find('H'+headerLevel);
        headers.each(function() {
          var curHeaderNode = $(this).get();
          var newHeaderNode = editor.dom.create((newHeaderLevel < 7) ? 'h'+(newHeaderLevel) : 'div', editor.dom.getAttribs(curHeaderNode));
          editor.dom.replace(newHeaderNode, curHeaderNode, true);
          if (newHeaderLevel >= 7) {
            editor.dom.setAttribs(newHeaderNode, {"role":"heading", "aria-level":newHeaderLevel});
          }
        });
      }
    });

    // --------------------------------------------------------------------------------
    // SpellChecker workaround
    // --------------------------------------------------------------------------------
    
    // Workaround bug in TinyMCE spellchecker button which might not work properly
    // when focus was not yet defined :
    //  JCMS-7157 Spellchecker not using correct language on first attempt
    //  JCMS-7486 Content of rich text editor is corrupted when invoking spellchecker without prior focus on field
    // --> disable bundle until focus has been acquired
    var toggleSpellCheckerButtonEnabledStatus = function(enable) {
      
      var getButtonByIconName = function (editor, iconName, getEl){
        var ed = editor || tinymce.activeEditor;  
        if (!ed.theme.panel) {
          return null;
        }
        var toolbarObj = ed.theme.panel.find('toolbar *');

        var result = false;
        
        tinymce.each(toolbarObj, function(v, k) {
          if (v.type == 'button' && typeof v.settings !== 'undefined' && v.settings.icon === iconName) {
            result = v;
            return false;
          }
        });
        
        return result;
      }
      
      var spellcheckerButton = getButtonByIconName(editor, 'spellchecker');
      if (spellcheckerButton && spellcheckerButton.disabled) {
        spellcheckerButton.disabled(!enable) ;
      }
    };
    
    editor.on('PostRender', function() {
      toggleSpellCheckerButtonEnabledStatus(false);
    });
    editor.on('Focus', function() {
      toggleSpellCheckerButtonEnabledStatus(true);
    });
    editor.on('Blur', function() {
      toggleSpellCheckerButtonEnabledStatus(false);
    });
    
    // --------------------------------------------------------------------------------
    // Add the wrapper of the content
    // --------------------------------------------------------------------------------

    editor.on('PostProcess', function(event) {
      if (event.get && !event.selection) {
        event.content = wrapContent(event.content);
      }
    });

    /**
     * Wrapping : before being set back in the text area, the HTML is always wrapped in a surrounding <div clas="wysiwyg">. This behavior is
     * absolutely critical when working with Wiki field as they must be properly detected as JHTML (and not as wiki syntax): this is the purpose of
     * this surrounding div.
     */
    function wrapContent(content) {
      if (!content) {
        return '';
      }

      // Add a wrapper element only if the content is not empty
      // Use the regex found in tinymce to remove empty contents in the 'initContentBody' function
      if (content.match(/^(<p[^>]*>(&nbsp;|&#160;|\s|\u00a0|<br \/>|)<\/p>[\r\n]*|<br \/>[\r\n]*)$/)) {
        return content;
      }

      // Do not add wrapper if it already exists!
      if (content.trim().match(/^<div class="[^"]*wysiwyg[^"]*"/)) {
        return content;
      }

      var updated = '<div class="wysiwyg">' + content + '</div>';
      return updated;
    }

    editor.on('BeforeSetContent', function(event) {
      if (event.set && !event.selection) {
        event.content = unwrapContent(event.content);
      }
    });

    /**
     * Unwrapping : before being read from the text area into the editor, any surrounding <div class="wysiwyg" is remove from the HTML.
     */
    function unwrapContent(content) {
      if (!content) {
        return '';
      }

      // Remove wysiwyg div wrapper if found
      var matches = content.match(/^<div class="[^"]*wysiwyg[^"]*">([^]*)<\/div>$/);
      if (matches) {
        return matches[1];
      }

      return content;
    }
    
    /**
     * Add closing tags for <jalios:xxx> tags to prevent it from being added incorrectly automatically by the paste plugin of TinyMCE.
     * 
     * It calls <code>HtmlElement.innerHTML</code> which automatically adds the closing tag for jalios tags because they are custom tags and they don't have the right to be self-closing.
     * But it doesn't add them properly:
     * <pre><jalios: link data-jalios-id={"c_16867\" /> <jalios: link data-jalios-id={"c_11106\" /></pre> 
     * will result in
     * <pre><jalios:link data-jalios-id=\"c_16867{"> <jalios: link data-jalios-id=\"c_11106{"></jalios: link > </jalios: link ><pre>
     */
    function addJaliosClosingTags(content) {
      if (!content) {
        return '';
      }

      var regex = new RegExp('<(jalios:[^\\s]+)(.*?)/>', 'gi');
      return content.replace(regex, '<$1$2></$1>');
    }

    editor.on('PastePreProcess', function(event) {
      // When we paste a content, remove wysiwyg div wrapper if found
      event.content = unwrapContent(event.content);
      // Add closing tags for <jalios:xxx> tags to prevent it from being added automatically by the paste plugin of TinyMCE.
      event.content = addJaliosClosingTags(event.content);
    });

    // --------------------------------------------------------------------------------
    // Add / Remove the 'contenteditable' attribute on the custom tags not supported
    // --------------------------------------------------------------------------------

    editor.on('BeforeSetContent', function(event) {
      event.content = addExtraAttributes(event.content);
    });

    function addExtraAttributes(content) {
      var regex = new RegExp('(<jalios:[^\\s/>]+)([ />])', 'gi');
      return content.replace(regex, function($0, $1, $2) {
        if (matchIgnoredTag($0)) {
          return $0;
        }

        return $1 + ' contenteditable="false"' + $2;
      });
    }

    editor.on('PostProcess', function(event) {
      if (event.get) {
        event.content = removeExtraAttributes(event.content);
      }
    });

    function removeExtraAttributes(content) {
      var regex = new RegExp('(<jalios:[^\\s/>]+)(.*) contenteditable="[^"]+"', 'gi');
      return content.replace(regex, function($0, $1, $2) {
        if (matchIgnoredTag($0)) {
          return $0;
        }

        return $1 + $2;
      });
    }

    function matchIgnoredTag(match) {
      for (var i = 0; i < ignoredTags.length; i++) {
        if (match.startsWith('<' + ignoredTags[i])) {
          return true;
        }
      }
      return false;
    }
  });
}(window.jQuery);