 /** 
  * This javascript file handles type editor fields display, and templates display.
  * The two arrays define which field must be displayed depending on the field type.
  */
!function ($) {
  
  //This matrix defines which options are to be displayed when changing the editor
  //-1 => do not display
  // 0 => display, default value is off/disabled
  // 1 => display, default value is on/enabled
  
  var edits1 = new Array();
  var editsOptions1   = new Array( "prop1", "prop2", "qty", "requir", "comp", "mlang", "search", "enumch", "treecat", "catch", "ds", "sqlr", "dbr", "typech"  );  
  edits1["textfield"] = new Array( 1,        -1,      0,        0,     -1,       1,        1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["textarea"]  = new Array( 1,        -1,      0,        0,     -1,       1,        1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["wysiwyg"]   = new Array( 1,        -1,      0,        0,     -1,       1,        1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["document"]  = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["file"]      = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["image"]     = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["media"]     = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["url"]       = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["email"]     = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["password"]  = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["enumerate"] = new Array( 1,         0,      0,       -1,     -1,      -1,       -1,        0,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["color"]     = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["query"]     = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["type"]      = new Array( 1,        0,       0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,     0        );
  edits1["date"]      = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["boolean"]   = new Array( 1,        -1,      0,       -1,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["int"]       = new Array( 1,        -1,      0,       -1,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["double"]    = new Array( 1,        -1,      0,       -1,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["duration"]  = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["sqlquery"]  = new Array( 1,         1,     -1,        0,     -1,      -1,       -1,       -1,        -1,       -1,   0,     -1,    -1,    -1        );
  edits1["sqlresult"] = new Array( -1,        0,     -1,       -1,     -1,      -1,       -1,       -1,        -1,       -1,   0,      0,    -1,    -1        );
  edits1["dbrecord"]  = new Array( 1,         0,     -1,        0,     -1,      -1,       -1,       -1,        -1,       -1,   0,     -1,     0,    -1        );
  edits1["category"]  = new Array( 1,         0,      1,        0,     -1,      -1,       -1,       -1,         0,        0,  -1,     -1,    -1,    -1        );
  edits1["member"]    = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["group"]     = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["link"]      = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );
  edits1["default"]   = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1,    -1        );

  var edits2 = new Array();
  var editsOptions2   = new Array( "size", "rows", "cols", "wiki", "html", "checkHtml", "wysiwygConfigurationIdSection", "inline", "openwindow", "pattern", "resize");  
  edits2["textfield"] = new Array(      1,     -1,     -1,     -1,      0,           1,                              -1,        -1,          -1,         1,       -1);
  edits2["textarea"]  = new Array(     -1,      1,      1,      0,      0,           1,                               0,        -1,          -1,        -1,       -1);
  edits2["wysiwyg"]   = new Array(     -1,      1,      1,     -1,     -1,           1,                               0,         1,          -1,        -1,       -1);
  edits2["file"]      = new Array(      1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,       -1);
  edits2["image"]     = new Array(      1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,        0);
  edits2["media"]     = new Array(      1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,       -1);
  edits2["url"]       = new Array(      1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,           1,         1,       -1);
  edits2["email"]     = new Array(      1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,         1,       -1);
  edits2["password"]  = new Array(      1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,       -1);
  edits2["query"]     = new Array(     -1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,       -1);
  edits2["type"]      = new Array(     -1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,       -1);
  edits2["color"]     = new Array(     -1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,       -1);
  edits2["dbrecord"]  = new Array(     -1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,       -1);
  edits2["sqlquery"]  = new Array(     -1,     -1,     -1,     -1,     -1,          -1,                              -1,        -1,          -1,        -1,       -1);

  /**
   * Handle type fields display on a new field.
   * @param {event} the event triggered
   */
  var handleNewFieldOptionsDisplay = function(event) {
    var fieldType = event.target.value;
    handleOptionsDisplay(fieldType, edits1, editsOptions1, true);
  }
  
  /**
   * Handle type fields display on an existing field update.
   * @param {event} the event triggered
   */
  var handleExistingFieldOptionsDisplay = function(event) {
    var fieldType = event.target.value;
    handleOptionsDisplay(fieldType, edits2, editsOptions2, false);
  }
  
  /**
   * Handle type fields display
   * @param {fieldType} the type of the field (See table edits1 & edits2)
   * @param {edits} the array of edits (See table edits1 & edits2)
   * @param {editsOptions} the array of editsOptions (See table editsOptions1 & editsOptions2)
   * @param {checkradio} to define wether the radio must be checked or not
   */
  var handleOptionsDisplay = function(fieldType, edits, editsOptions, checkradio) {
    if (fieldType === undefined) {
      return;
    }
    
    if (fieldType.indexOf("link_") == 0) {
      fieldType = "link";
    }
    
    var edit = edits[fieldType] ;
    
    if (!edit) { 
     return;
    }

    for (i = 0; i < editsOptions.length; i++) {
      var $option = $("#" + editsOptions[i]);
      if ($option.exists()) {
        if (edit[i] < 0) {
          $option.addClass("hide");
        } else {
          $option.removeClass("hide");
          
          if (checkradio) {
            radio = document.getElementById(editsOptions[i] + edit[i]);
            if (radio) {
              radio.checked = true;
            }
          }
        }
      }
    }
  }
  
  /**
   * Remove template by emptying its fields and submitting the form
   * @param {event} the event triggered
   */
  var handleTemplateClearing = function(event) {
    var $elm = $(event.target);
    
    JCMS.window.Modal.confirm($elm[0].title , function(confirm){
      //Confirm callback
      if (!confirm) {
        return; 
      }
      
      //Clear field values
      var $wrapper = $elm.closest(".type-editor-template-wrapper");
      $wrapper.find("INPUT[type='text'], TEXTAREA").val('');
      
      //Submit form
      simpleSubmitForm(window,$elm[0].form,$elm[0].name);
    });
  }
  
  var register = function() {
    //Bind change event when the select value is changed
    $(document).on("change", ".js-new-field-option-changer", handleNewFieldOptionsDisplay);
    $(document).on("change", ".js-existing-field-option-changer", handleExistingFieldOptionsDisplay);
    //Display the right fields on dom ready
    handleOptionsDisplay($(".js-new-field-option-changer").val(), edits1, editsOptions1, true);
    handleOptionsDisplay($(".type-field-editor-string .js-existing-field-option-changer").val(), edits2, editsOptions2, true);
    //Bind click event when clearing an existing template
    $(document).on("click", ".js-clear-template", handleTemplateClearing);
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);