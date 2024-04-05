!function ($) {

  // Namespace
  if (!$.jalios) { $.jalios = {}; }
  
  /**
   * Jalios WYSIWYG Configuration.<br/>
   * <br/>
   * <h5>Description</h5>
   * 
   * @namespace $.jalios.WysiwygConfiguration
   */
  $.jalios.WysiwygConfiguration = {
    
    /**
     * Documentation of the publicFunction
     * @param {String} param1 the param1 description
     * 
     * @example
     * 
     * var value = $.jalios.WysiwygConfiguration.getConfiguration('default');
     */
    getConfiguration: function(configId){
      var wysiwygConfiguration = configurations[configId];
      return wysiwygConfiguration || configurations['default'];
    }
  };

  var configurations = {
  "default" : {
    "automatic_uploads" : true,
    "block_formats" : "Paragraph=p;Heading 2=h2;Heading 3=h3;Heading 4=h4;Heading 5=h5;Heading 6=h6;Pre=pre;Blockquote=blockquote;jabstract.title=abstract;jmessage.info.title=messageinfo;jmessage.success.title=messagesuccess;jmessage.warning.title=messagewarning;jmessage.error.title=messageerror",
    "branding" : false,
    "browser_spellcheck" : false,
    "codesample_languages" : [ {
      "text" : "HTML/XML",
      "value" : "markup"
    }, {
      "text" : "JavaScript",
      "value" : "javascript"
    }, {
      "text" : "CSS",
      "value" : "css"
    }, {
      "text" : "Java",
      "value" : "java"
    }, {
      "text" : "JSON",
      "value" : "json"
    }, {
      "text" : "Properties",
      "value" : "properties"
    } ],
    "color_cols" : 8,
    "color_map" : [ "#f3be5f", "#f3be5f", "#ff9400", "#ff9400", "#f57c00", "#f57c00", "#8f3800", "#8f3800", "#fff176", "#fff176", "#f4df60", "#f4df60", "#fdc032", "#fdc032", "#f4a20f", "#f4a20f", "#dce775", "#dce775", "#cddc39", "#cddc39", "#afb42b", "#afb42b", "#918e29", "#918e29", "#8ec255", "#8ec255", "#4caf50", "#4caf50", "#388e3c", "#388e3c", "#1b5e20", "#1b5e20", "#91ffff", "#91ffff", "#59d5e1", "#59d5e1", "#00adb8", "#00adb8", "#007480", "#007480", "#01ffff", "#01ffff", "#00ecfa", "#00ecfa", "#00cef1", "#00cef1", "#00b8ea", "#00b8ea", "#24adf5", "#24adf5", "#009ef5", "#009ef5", "#005db4", "#005db4", "#054c7c", "#054c7c", "#c56dd8", "#c56dd8", "#923ea6", "#923ea6", "#7a288e", "#7a288e", "#600476", "#600476", "#f06292", "#f06292", "#e91e63", "#e91e63", "#c2185b", "#c2185b", "#880e4f", "#880e4f", "#ff6b58", "#ff6b58", "#dd352e", "#dd352e", "#bf2c2c", "#bf2c2c", "#a30005", "#a30005", "#eab88b", "#eab88b", "#cb9d6a", "#cb9d6a", "#9b7250", "#9b7250", "#7f5c45", "#7f5c45", "#cccbca", "#cccbca", "#a4a4a4", "#a4a4a4", "#828282", "#828282", "#616161", "#616161", "#b0bec5", "#b0bec5", "#a4bec1", "#a4bec1", "#87a7b2", "#87a7b2", "#415c68", "#415c68", "#ffffff", "#ffffff", "#000000", "#000000" ],
    "content_css" : [ "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Ffonts%2Fwebfont-roboto.css&css=css%2Fjalios%2Fcore%2Ffont-icons.css", "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Fbootstrap.css&css=css%2Fjalios%2Fcore%2Fcore.css", "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Fjalios-wysiwyg-editor.css&css=js%2Fjalios%2Fcore%2Fwysiwyg%2Fplugins%2Fmention%2Fcss%2Frte-content.css" ],
    "contextmenu" : "link quickimage | inserttable cell row column deletetable | code | undo redo",
    "custom_elements" : "~jalios:link,~jalios:mention,~jalios:media,jalios:msg,jalios:toc,jalios:abstract,jalios:include",
    "deprecation_warnings" : false,
    "document_base_url" : JcmsJsContext.getBaseUrl(),
    "emoticons_images_url" : twemoji.base,
    "entity_encoding" : "raw",
    "extended_valid_elements" : "jalios:link[data-jalios-id|data-jalios-title|data-jalios-style|data-jalios-class|data-jalios-target],jalios:mention[data-jalios-id],jalios:msg[data-jalios-level],jalios:media[data-jalios-source|data-jalios-width|data-jalios-height|data-jalios-title|data-jalios-style|data-jalios-class],jalios:toc[data-jalios-level],jalios:abstract,jalios:include[data-jalios-type|data-jalios-params]",
    "formats" : {
      "abstract" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-abstract"
      },
      "messageinfo" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-info"
      },
      "messagesuccess" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-success"
      },
      "messagewarning" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-warning"
      },
      "messageerror" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-danger"
      }
    },
    "height" : 400,
    "image_advtab" : true,
    "images_upload_handler" :  function (blobInfo, success, failure, progress) {
  tinymce.activeEditor.jalios.plugins.jimagehandler.uploadImages(blobInfo, success, failure, progress, tinymce.activeEditor);
} ,
    "mentions" : {
      "queryBy" : "fullName",
      "insert" :  function(mbr) {
    // mention plugin uses the data attributes added, so 'fullName' can be lowercase
    if(mbr.fullname) {
      mbr.fullName = mbr.fullname;
    }

    // Cache the MemberInfos
    this.editor.jcms.setMemberInfos(mbr);

    return this.editor.jalios.plugins.mention.createHtmlTag(mbr) + '&nbsp;';
  } ,
      "renderDropdown" :  function() {
    return '<ul class="rte-autocomplete dropdown-menu"><li class="loading"> <div class="message-help">' + tinymce.i18n.translate('mentionextra.enter-text-to-search') + '</div></li></ul>';
  } ,
      "render" :  function(item, index) {
    var message = item.message;
    if(message) {
      if(message === 'mentionextra.no-result') {
        // No result
        return '<li> <a href="javascript:;"> <span>' + tinymce.i18n.translate(message) + '</span></a> </li>';
      } else if(message === 'mentionextra.enter-text-to-search') {
        // Query too short or empty
        return '<li class="loading"> <div class="message-help">' + tinymce.i18n.translate(message) + '</div></li>';
      }
    }
    let photo = item.photo || 'images/jalios/layout/silhouette.jpg';
    let useInitials = !item.photo && item.initials;
    return '<li' + (index == 0 ? ' class="active"' : '') + '>'
            + '<a href="javascript:;">'
              + (useInitials
                  ? ('<span class="initials-photo initials photo icon-photo" style="background-color: '+item.initialsColor+';">'+item.initials+'</span>') 
                  : ('<img src="' + photo + '" class="photo" />') 
              )
              +' <span>' + item[this.options.queryBy] + '</span>'
            +'</a>' 
          + '</li>';
  } ,
      "matcher" :  function(item) {
    // Always return true because the source is already filtered from server
    return true;
  } ,
      "sorter" :  function(items) {
    // Always return original items because they are already sorted on server
    return items;
  } ,
      "source" :  function (query, process, delimiter) {
    if (delimiter === '@' && query.length > 1) {
      $.getJSON('jcore/autocomplete/acmention.jsp', {autocomplete: query})
        .done(function (data) {
          if(!data || data.length == 0) {
            // Add an item to display the dropdown a specific message
            data = [{ message: 'mentionextra.no-result' }];
          }
          process(data);
        })
        .fail(function( jqxhr, textStatus, error ) {
          var err = textStatus + ', ' + error;
          jQuery.console.log('Request Failed: ' + err);
        });
    } else {
      process([{ message: 'mentionextra.enter-text-to-search' }]);
    }
  } 
    },
    "menubar" : false,
    "min_height" : 350,
    "min_width" : 250,
    "non_empty_elements" : "td th iframe video audio object script pre code area base basefont br col frame hr img input isindex link meta param embed source wbr track jalios:abstract jalios:link jalios:media jalios:mention jalios:msg jalios:toc jalios:include",
    "paste_data_images" : true,
    "plugins" : "anchor,autolink,charmap,code,codesample,emoticons,fullscreen,hr,image,link,lists,media,nonbreaking,pagebreak,paste,-pastelink,preview,searchreplace,table,-jcms,-jabstract,-jcodesample,-jimagehandler,-jinclude,-jmedia,-jmessage,-jlink,-jsmartinsert,-jtoc,-junifiedinsert,-mention,-mentionextra,-jfullscreen,-jspellchecker,textpattern,-emoji,emoticons",
    "resize" : "both",
    "schema" : "html5",
    "spellchecker_callback" :  function(method, text, success, failure) {
  tinymce.util.JSONRequest.sendRPC({
    url: JcmsJsContext.getBaseUrl() + "JSON-RPC",
    method: "TinyMceSpellChecker.spellcheck",
    params: [
      jQuery(tinymce.activeEditor.getElement()).attr('xml:lang'),
      text.match(this.getWordCharPattern())
    ],
    success: function(result) {
      success({"words" : result.map});
    },
    error: function(error, xhr) {
      failure(I18N.glp('warn.json.sessiontimeout'));
    }
  });
} ,
    "spellchecker_languages" : " ",
    "statusbar" : false,
    "textpattern_patterns" : [ {
      "start" : ":-)",
      "replacement" : "😊"
    }, {
      "start" : ":)",
      "replacement" : "😊"
    }, {
      "start" : ":-(",
      "replacement" : "😞"
    }, {
      "start" : ":(",
      "replacement" : "😞"
    }, {
      "start" : ";-)",
      "replacement" : "😉"
    }, {
      "start" : ";)",
      "replacement" : "😉"
    }, {
      "start" : ":-°",
      "replacement" : "😇"
    }, {
      "start" : ":°",
      "replacement" : "😇"
    }, {
      "start" : ":-\\",
      "replacement" : "😕"
    }, {
      "start" : ":\\",
      "replacement" : "😕"
    }, {
      "start" : ":-D",
      "replacement" : "😃"
    }, {
      "start" : ":-P",
      "replacement" : "😛"
    }, {
      "start" : ":-p",
      "replacement" : "😛"
    }, {
      "start" : ":-X",
      "replacement" : "😶"
    }, {
      "start" : "|-O",
      "replacement" : "😴"
    }, {
      "start" : "|O",
      "replacement" : "😴"
    }, {
      "start" : ":-o",
      "replacement" : "😲"
    }, {
      "start" : ":'(",
      "replacement" : "😢"
    }, {
      "start" : ";(",
      "replacement" : "😢"
    }, {
      "start" : ":-E",
      "replacement" : "😠"
    } ],
    "theme" : "silver",
    "toolbar" : [ "bullist numlist outdent indent | junifiedinsert | emoticons charmap codesample | link unlink anchor | cut copy paste pastetext pasteword | jspellchecker | fullscreen jfullscreensave", "bold italic underline strikethrough | forecolor backcolor | removeformat | formatselect | alignleft aligncenter alignright | table | hr | jtoc " ]
  },
  "light" : {
    "automatic_uploads" : true,
    "block_formats" : "Paragraph=p;Pre=pre;Blockquote=blockquote;jmessage.info.title=messageinfo;jmessage.success.title=messagesuccess;jmessage.warning.title=messagewarning;jmessage.error.title=messageerror",
    "branding" : false,
    "browser_spellcheck" : false,
    "codesample_languages" : [ {
      "text" : "HTML/XML",
      "value" : "markup"
    }, {
      "text" : "JavaScript",
      "value" : "javascript"
    }, {
      "text" : "CSS",
      "value" : "css"
    }, {
      "text" : "Java",
      "value" : "java"
    }, {
      "text" : "JSON",
      "value" : "json"
    }, {
      "text" : "Properties",
      "value" : "properties"
    } ],
    "color_cols" : 8,
    "color_map" : [ "#f3be5f", "#f3be5f", "#ff9400", "#ff9400", "#f57c00", "#f57c00", "#8f3800", "#8f3800", "#fff176", "#fff176", "#f4df60", "#f4df60", "#fdc032", "#fdc032", "#f4a20f", "#f4a20f", "#dce775", "#dce775", "#cddc39", "#cddc39", "#afb42b", "#afb42b", "#918e29", "#918e29", "#8ec255", "#8ec255", "#4caf50", "#4caf50", "#388e3c", "#388e3c", "#1b5e20", "#1b5e20", "#91ffff", "#91ffff", "#59d5e1", "#59d5e1", "#00adb8", "#00adb8", "#007480", "#007480", "#01ffff", "#01ffff", "#00ecfa", "#00ecfa", "#00cef1", "#00cef1", "#00b8ea", "#00b8ea", "#24adf5", "#24adf5", "#009ef5", "#009ef5", "#005db4", "#005db4", "#054c7c", "#054c7c", "#c56dd8", "#c56dd8", "#923ea6", "#923ea6", "#7a288e", "#7a288e", "#600476", "#600476", "#f06292", "#f06292", "#e91e63", "#e91e63", "#c2185b", "#c2185b", "#880e4f", "#880e4f", "#ff6b58", "#ff6b58", "#dd352e", "#dd352e", "#bf2c2c", "#bf2c2c", "#a30005", "#a30005", "#eab88b", "#eab88b", "#cb9d6a", "#cb9d6a", "#9b7250", "#9b7250", "#7f5c45", "#7f5c45", "#cccbca", "#cccbca", "#a4a4a4", "#a4a4a4", "#828282", "#828282", "#616161", "#616161", "#b0bec5", "#b0bec5", "#a4bec1", "#a4bec1", "#87a7b2", "#87a7b2", "#415c68", "#415c68", "#ffffff", "#ffffff", "#000000", "#000000" ],
    "content_css" : [ "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Ffonts%2Fwebfont-roboto.css&css=css%2Fjalios%2Fcore%2Ffont-icons.css", "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Fbootstrap.css&css=css%2Fjalios%2Fcore%2Fcore.css", "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Fjalios-wysiwyg-editor.css&css=js%2Fjalios%2Fcore%2Fwysiwyg%2Fplugins%2Fmention%2Fcss%2Frte-content.css" ],
    "contextmenu" : "pastetext | link quickimage | jcodesample | inserttable cell row column deletetable | code | undo redo",
    "custom_elements" : "~jalios:link,~jalios:mention,~jalios:media,jalios:msg,jalios:toc,jalios:abstract,jalios:include",
    "deprecation_warnings" : false,
    "document_base_url" : JcmsJsContext.getBaseUrl(),
    "emoticons_images_url" : twemoji.base,
    "entity_encoding" : "raw",
    "extended_valid_elements" : "jalios:link[data-jalios-id|data-jalios-title|data-jalios-style|data-jalios-class|data-jalios-target],jalios:mention[data-jalios-id],jalios:msg[data-jalios-level],jalios:media[data-jalios-source|data-jalios-width|data-jalios-height|data-jalios-title|data-jalios-style|data-jalios-class],jalios:toc[data-jalios-level],jalios:abstract,jalios:include[data-jalios-type|data-jalios-params]",
    "formats" : {
      "messageinfo" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-info"
      },
      "messagesuccess" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-success"
      },
      "messagewarning" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-warning"
      },
      "messageerror" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-danger"
      }
    },
    "height" : 200,
    "image_advtab" : true,
    "images_upload_handler" :  function (blobInfo, success, failure, progress) {
  tinymce.activeEditor.jalios.plugins.jimagehandler.uploadImages(blobInfo, success, failure, progress, tinymce.activeEditor);
} ,
    "mentions" : {
      "queryBy" : "fullName",
      "insert" :  function(mbr) {
    // mention plugin uses the data attributes added, so 'fullName' can be lowercase
    if(mbr.fullname) {
      mbr.fullName = mbr.fullname;
    }

    // Cache the MemberInfos
    this.editor.jcms.setMemberInfos(mbr);

    return this.editor.jalios.plugins.mention.createHtmlTag(mbr) + '&nbsp;';
  } ,
      "renderDropdown" :  function() {
    return '<ul class="rte-autocomplete dropdown-menu"><li class="loading"> <div class="message-help">' + tinymce.i18n.translate('mentionextra.enter-text-to-search') + '</div></li></ul>';
  } ,
      "render" :  function(item, index) {
    var message = item.message;
    if(message) {
      if(message === 'mentionextra.no-result') {
        // No result
        return '<li> <a href="javascript:;"> <span>' + tinymce.i18n.translate(message) + '</span></a> </li>';
      } else if(message === 'mentionextra.enter-text-to-search') {
        // Query too short or empty
        return '<li class="loading"> <div class="message-help">' + tinymce.i18n.translate(message) + '</div></li>';
      }
    }
    let photo = item.photo || 'images/jalios/layout/silhouette.jpg';
    let useInitials = !item.photo && item.initials;
    return '<li' + (index == 0 ? ' class="active"' : '') + '>'
            + '<a href="javascript:;">'
              + (useInitials
                  ? ('<span class="initials-photo initials photo icon-photo" style="background-color: '+item.initialsColor+';">'+item.initials+'</span>') 
                  : ('<img src="' + photo + '" class="photo" />') 
              )
              +' <span>' + item[this.options.queryBy] + '</span>'
            +'</a>' 
          + '</li>';
  } ,
      "matcher" :  function(item) {
    // Always return true because the source is already filtered from server
    return true;
  } ,
      "sorter" :  function(items) {
    // Always return original items because they are already sorted on server
    return items;
  } ,
      "source" :  function (query, process, delimiter) {
    if (delimiter === '@' && query.length > 1) {
      $.getJSON('jcore/autocomplete/acmention.jsp', {autocomplete: query})
        .done(function (data) {
          if(!data || data.length == 0) {
            // Add an item to display the dropdown a specific message
            data = [{ message: 'mentionextra.no-result' }];
          }
          process(data);
        })
        .fail(function( jqxhr, textStatus, error ) {
          var err = textStatus + ', ' + error;
          jQuery.console.log('Request Failed: ' + err);
        });
    } else {
      process([{ message: 'mentionextra.enter-text-to-search' }]);
    }
  } 
    },
    "menubar" : false,
    "min_height" : 200,
    "min_width" : 250,
    "non_empty_elements" : "td th iframe video audio object script pre code area base basefont br col frame hr img input isindex link meta param embed source wbr track jalios:abstract jalios:link jalios:media jalios:mention jalios:msg jalios:toc jalios:include",
    "paste_data_images" : true,
    "plugins" : "autolink,code,codesample,fullscreen,image,link,lists,media,paste,-pastelink,table,-jcms,-jcodesample,-jimagehandler,-jinclude,-jmedia,-jmessage,-jlink,-jsmartinsert,-junifiedinsert,-mention,-mentionextra,-jfullscreen,-jspellchecker,textpattern,-emoji,emoticons",
    "resize" : "both",
    "schema" : "html5",
    "spellchecker_callback" :  function(method, text, success, failure) {
  tinymce.util.JSONRequest.sendRPC({
    url: JcmsJsContext.getBaseUrl() + "JSON-RPC",
    method: "TinyMceSpellChecker.spellcheck",
    params: [
      jQuery(tinymce.activeEditor.getElement()).attr('xml:lang'),
      text.match(this.getWordCharPattern())
    ],
    success: function(result) {
      success({"words" : result.map});
    },
    error: function(error, xhr) {
      failure(I18N.glp('warn.json.sessiontimeout'));
    }
  });
} ,
    "spellchecker_languages" : " ",
    "statusbar" : false,
    "textpattern_patterns" : [ {
      "start" : ":-)",
      "replacement" : "😊"
    }, {
      "start" : ":)",
      "replacement" : "😊"
    }, {
      "start" : ":-(",
      "replacement" : "😞"
    }, {
      "start" : ":(",
      "replacement" : "😞"
    }, {
      "start" : ";-)",
      "replacement" : "😉"
    }, {
      "start" : ";)",
      "replacement" : "😉"
    }, {
      "start" : ":-°",
      "replacement" : "😇"
    }, {
      "start" : ":°",
      "replacement" : "😇"
    }, {
      "start" : ":-\\",
      "replacement" : "😕"
    }, {
      "start" : ":\\",
      "replacement" : "😕"
    }, {
      "start" : ":-D",
      "replacement" : "😃"
    }, {
      "start" : ":-P",
      "replacement" : "😛"
    }, {
      "start" : ":-p",
      "replacement" : "😛"
    }, {
      "start" : ":-X",
      "replacement" : "😶"
    }, {
      "start" : "|-O",
      "replacement" : "😴"
    }, {
      "start" : "|O",
      "replacement" : "😴"
    }, {
      "start" : ":-o",
      "replacement" : "😲"
    }, {
      "start" : ":'(",
      "replacement" : "😢"
    }, {
      "start" : ";(",
      "replacement" : "😢"
    }, {
      "start" : ":-E",
      "replacement" : "😠"
    } ],
    "theme" : "silver",
    "toolbar" : "bold italic | numlist bullist | junifiedinsert link emoticons | table | formatselect | jspellchecker | fullscreen jfullscreensave"
  },
  "portlet" : {
    "automatic_uploads" : true,
    "block_formats" : "Paragraph=p;Heading 2=h2;Heading 3=h3;Heading 4=h4;Heading 5=h5;Heading 6=h6;Pre=pre;Blockquote=blockquote;jabstract.title=abstract;jmessage.info.title=messageinfo;jmessage.success.title=messagesuccess;jmessage.warning.title=messagewarning;jmessage.error.title=messageerror",
    "branding" : false,
    "browser_spellcheck" : false,
    "codesample_languages" : [ {
      "text" : "HTML/XML",
      "value" : "markup"
    }, {
      "text" : "JavaScript",
      "value" : "javascript"
    }, {
      "text" : "CSS",
      "value" : "css"
    }, {
      "text" : "Java",
      "value" : "java"
    }, {
      "text" : "JSON",
      "value" : "json"
    }, {
      "text" : "Properties",
      "value" : "properties"
    } ],
    "color_cols" : 8,
    "color_map" : [ "#f3be5f", "#f3be5f", "#ff9400", "#ff9400", "#f57c00", "#f57c00", "#8f3800", "#8f3800", "#fff176", "#fff176", "#f4df60", "#f4df60", "#fdc032", "#fdc032", "#f4a20f", "#f4a20f", "#dce775", "#dce775", "#cddc39", "#cddc39", "#afb42b", "#afb42b", "#918e29", "#918e29", "#8ec255", "#8ec255", "#4caf50", "#4caf50", "#388e3c", "#388e3c", "#1b5e20", "#1b5e20", "#91ffff", "#91ffff", "#59d5e1", "#59d5e1", "#00adb8", "#00adb8", "#007480", "#007480", "#01ffff", "#01ffff", "#00ecfa", "#00ecfa", "#00cef1", "#00cef1", "#00b8ea", "#00b8ea", "#24adf5", "#24adf5", "#009ef5", "#009ef5", "#005db4", "#005db4", "#054c7c", "#054c7c", "#c56dd8", "#c56dd8", "#923ea6", "#923ea6", "#7a288e", "#7a288e", "#600476", "#600476", "#f06292", "#f06292", "#e91e63", "#e91e63", "#c2185b", "#c2185b", "#880e4f", "#880e4f", "#ff6b58", "#ff6b58", "#dd352e", "#dd352e", "#bf2c2c", "#bf2c2c", "#a30005", "#a30005", "#eab88b", "#eab88b", "#cb9d6a", "#cb9d6a", "#9b7250", "#9b7250", "#7f5c45", "#7f5c45", "#cccbca", "#cccbca", "#a4a4a4", "#a4a4a4", "#828282", "#828282", "#616161", "#616161", "#b0bec5", "#b0bec5", "#a4bec1", "#a4bec1", "#87a7b2", "#87a7b2", "#415c68", "#415c68", "#ffffff", "#ffffff", "#000000", "#000000" ],
    "content_css" : [ "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Ffonts%2Fwebfont-roboto.css&css=css%2Fjalios%2Fcore%2Ffont-icons.css", "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Fbootstrap.css&css=css%2Fjalios%2Fcore%2Fcore.css", "css/csspacker.jsp?css=css%2Fjalios%2Fcore%2Fjalios-wysiwyg-editor.css&css=js%2Fjalios%2Fcore%2Fwysiwyg%2Fplugins%2Fmention%2Fcss%2Frte-content.css" ],
    "contextmenu" : "link quickimage | inserttable cell row column deletetable | code | undo redo",
    "custom_elements" : "~jalios:link,~jalios:mention,~jalios:media,jalios:msg,jalios:toc,jalios:abstract,jalios:include",
    "deprecation_warnings" : false,
    "document_base_url" : JcmsJsContext.getBaseUrl(),
    "emoticons_images_url" : twemoji.base,
    "entity_encoding" : "raw",
    "extended_valid_elements" : "jalios:link[data-jalios-id|data-jalios-title|data-jalios-style|data-jalios-class|data-jalios-target],jalios:mention[data-jalios-id],jalios:msg[data-jalios-level],jalios:media[data-jalios-source|data-jalios-width|data-jalios-height|data-jalios-title|data-jalios-style|data-jalios-class],jalios:toc[data-jalios-level],jalios:abstract,jalios:include[data-jalios-type|data-jalios-params]",
    "font_formats" : "Andale Mono=andale mono,times; Arial=arial,helvetica,sans-serif; Arial Black=arial black,avant garde; Book Antiqua=book antiqua,palatino; Comic Sans MS=comic sans ms,sans-serif; Courier New=courier new,courier; Georgia=georgia,palatino; Helvetica=helvetica; Impact=impact,chicago; Roboto=embedded-roboto,Helvetica,Arial,sans-serif; Symbol=symbol; Tahoma=tahoma,arial,helvetica,sans-serif; Terminal=terminal,monaco; Times New Roman=times new roman,times; Trebuchet MS=trebuchet ms,geneva; Verdana=verdana,geneva; Webdings=webdings; Wingdings=wingdings,zapf dingbats",
    "formats" : {
      "abstract" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-abstract"
      },
      "messageinfo" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-info"
      },
      "messagesuccess" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-success"
      },
      "messagewarning" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-warning"
      },
      "messageerror" : {
        "block" : "div",
        "wrapper" : true,
        "classes" : "jalios-message alert alert-danger"
      }
    },
    "height" : 400,
    "image_advtab" : true,
    "images_upload_handler" :  function (blobInfo, success, failure, progress) {
  tinymce.activeEditor.jalios.plugins.jimagehandler.uploadImages(blobInfo, success, failure, progress, tinymce.activeEditor);
} ,
    "mentions" : {
      "queryBy" : "fullName",
      "insert" :  function(mbr) {
    // mention plugin uses the data attributes added, so 'fullName' can be lowercase
    if(mbr.fullname) {
      mbr.fullName = mbr.fullname;
    }

    // Cache the MemberInfos
    this.editor.jcms.setMemberInfos(mbr);

    return this.editor.jalios.plugins.mention.createHtmlTag(mbr) + '&nbsp;';
  } ,
      "renderDropdown" :  function() {
    return '<ul class="rte-autocomplete dropdown-menu"><li class="loading"> <div class="message-help">' + tinymce.i18n.translate('mentionextra.enter-text-to-search') + '</div></li></ul>';
  } ,
      "render" :  function(item, index) {
    var message = item.message;
    if(message) {
      if(message === 'mentionextra.no-result') {
        // No result
        return '<li> <a href="javascript:;"> <span>' + tinymce.i18n.translate(message) + '</span></a> </li>';
      } else if(message === 'mentionextra.enter-text-to-search') {
        // Query too short or empty
        return '<li class="loading"> <div class="message-help">' + tinymce.i18n.translate(message) + '</div></li>';
      }
    }
    let photo = item.photo || 'images/jalios/layout/silhouette.jpg';
    let useInitials = !item.photo && item.initials;
    return '<li' + (index == 0 ? ' class="active"' : '') + '>'
            + '<a href="javascript:;">'
              + (useInitials
                  ? ('<span class="initials-photo initials photo icon-photo" style="background-color: '+item.initialsColor+';">'+item.initials+'</span>') 
                  : ('<img src="' + photo + '" class="photo" />') 
              )
              +' <span>' + item[this.options.queryBy] + '</span>'
            +'</a>' 
          + '</li>';
  } ,
      "matcher" :  function(item) {
    // Always return true because the source is already filtered from server
    return true;
  } ,
      "sorter" :  function(items) {
    // Always return original items because they are already sorted on server
    return items;
  } ,
      "source" :  function (query, process, delimiter) {
    if (delimiter === '@' && query.length > 1) {
      $.getJSON('jcore/autocomplete/acmention.jsp', {autocomplete: query})
        .done(function (data) {
          if(!data || data.length == 0) {
            // Add an item to display the dropdown a specific message
            data = [{ message: 'mentionextra.no-result' }];
          }
          process(data);
        })
        .fail(function( jqxhr, textStatus, error ) {
          var err = textStatus + ', ' + error;
          jQuery.console.log('Request Failed: ' + err);
        });
    } else {
      process([{ message: 'mentionextra.enter-text-to-search' }]);
    }
  } 
    },
    "menubar" : false,
    "min_height" : 350,
    "min_width" : 250,
    "non_empty_elements" : "td th iframe video audio object script pre code area base basefont br col frame hr img input isindex link meta param embed source wbr track jalios:abstract jalios:link jalios:media jalios:mention jalios:msg jalios:toc jalios:include",
    "paste_data_images" : true,
    "plugins" : "anchor,autolink,charmap,code,codesample,emoticons,fullscreen,hr,image,link,lists,media,nonbreaking,pagebreak,paste,-pastelink,preview,searchreplace,table,-jcms,-jabstract,-jcodesample,-jimagehandler,-jinclude,-jmedia,-jmessage,-jlink,-jsmartinsert,-jtoc,-junifiedinsert,-mention,-mentionextra,-jfullscreen,-jspellchecker,textpattern,-emoji,emoticons",
    "resize" : "both",
    "schema" : "html5",
    "spellchecker_callback" :  function(method, text, success, failure) {
  tinymce.util.JSONRequest.sendRPC({
    url: JcmsJsContext.getBaseUrl() + "JSON-RPC",
    method: "TinyMceSpellChecker.spellcheck",
    params: [
      jQuery(tinymce.activeEditor.getElement()).attr('xml:lang'),
      text.match(this.getWordCharPattern())
    ],
    success: function(result) {
      success({"words" : result.map});
    },
    error: function(error, xhr) {
      failure(I18N.glp('warn.json.sessiontimeout'));
    }
  });
} ,
    "spellchecker_languages" : " ",
    "statusbar" : false,
    "textpattern_patterns" : [ {
      "start" : ":-)",
      "replacement" : "😊"
    }, {
      "start" : ":)",
      "replacement" : "😊"
    }, {
      "start" : ":-(",
      "replacement" : "😞"
    }, {
      "start" : ":(",
      "replacement" : "😞"
    }, {
      "start" : ";-)",
      "replacement" : "😉"
    }, {
      "start" : ";)",
      "replacement" : "😉"
    }, {
      "start" : ":-°",
      "replacement" : "😇"
    }, {
      "start" : ":°",
      "replacement" : "😇"
    }, {
      "start" : ":-\\",
      "replacement" : "😕"
    }, {
      "start" : ":\\",
      "replacement" : "😕"
    }, {
      "start" : ":-D",
      "replacement" : "😃"
    }, {
      "start" : ":-P",
      "replacement" : "😛"
    }, {
      "start" : ":-p",
      "replacement" : "😛"
    }, {
      "start" : ":-X",
      "replacement" : "😶"
    }, {
      "start" : "|-O",
      "replacement" : "😴"
    }, {
      "start" : "|O",
      "replacement" : "😴"
    }, {
      "start" : ":-o",
      "replacement" : "😲"
    }, {
      "start" : ":'(",
      "replacement" : "😢"
    }, {
      "start" : ";(",
      "replacement" : "😢"
    }, {
      "start" : ":-E",
      "replacement" : "😠"
    } ],
    "theme" : "silver",
    "toolbar" : "bullist numlist outdent indent | junifiedinsert | charmap codesample | link unlink anchor | cut copy paste pastetext pasteword | jspellchecker | fullscreen jfullscreensave | bold italic underline strikethrough | forecolor backcolor | removeformat | formatselect | fontselect fontsizeselect lineheight | alignleft aligncenter alignright | table | hr",
    "toolbar_mode" : "wrap"
  }
};

}(window.jQuery);