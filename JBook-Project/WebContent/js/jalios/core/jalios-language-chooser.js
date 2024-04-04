!function($) {
  function listMouseOver(rowEl) {
    rowEl.className += " listOverRow";
  }
  
  function listMouseOut(rowEl) {
    rowEl.className = rowEl.className.replace(" listOverRow", "");
  }
  
  function listToggleRow(rowID, isSelected) {
    var rowEl = document.getElementById(rowID);
    if (isSelected) {
      if (rowEl.className.indexOf("listSelectedRow") == -1) {
        rowEl.className += " listSelectedRow";
      }
    } else {
      if (rowEl.className.indexOf("listSelectedRow") != -1) {
        rowEl.className = rowEl.className.replace(" listSelectedRow", "");
      }
    }
  }

  function checkLang(inputID, rowID) {
    var inputEl = document.getElementById(inputID);
    var isMultiple = $('INPUT[name="multiple"]').val().toLowerCase() === 'true';
    if (!isMultiple) {
      checkAllLang(false);
      inputEl.checked = !inputEl.checked;
    }
    listToggleRow(rowID, inputEl.checked);
    if (!isMultiple) {
      selectLanguagesAndClose();
    }
  }
  
  function checkAllLang(checkValue) {
    for (var i = 0; i < document.langChooserForm.elements.length; i++) {
      var input = document.langChooserForm.elements[i]; 
      if (input.name != "lang") { continue; }
      if (input.checked != checkValue) {
        input.checked = checkValue;
        listToggleRow("row_" + input.value, checkValue);
      }
    }
  }

  var oldSearchedTextValue;
  function hideAndSeek() {
    var stext = document.langChooserForm.search.value;
    if (oldSearchedTextValue == stext) {
      return;
    }
    var regexp = new RegExp(stext, "gi");
    var languagesTable = document.getElementById("languages");
    var rows = languagesTable.getElementsByTagName("tr");
    for (var i = 0; i < rows.length; i++) {
      var match = (stext == "");
      var trEl = rows[i];
      if (trEl == undefined || trEl.id == undefined) {
        continue;
      }
      if (!match) {
        var cells = trEl.getElementsByTagName("td");
        // Try language code
        if (!match && cells[4] != undefined) {
          var lang = cells[4].innerHTML;
          match = (-1 != lang.search(stext));
        }
        // Try language name in userLang
        if (!match && cells[2] != undefined) {
          var userlangName = cells[2].innerHTML;
          match = userlangName != "" && (-1 != userlangName.search(regexp));
        }
        // Try language name in the language
        if (!match && cells[3] != undefined) {
          var nativeLangName = cells[3].innerHTML;
          match = nativeLangName != "" && (-1 != nativeLangName.search(regexp));
        }
      }
      // Hide or show column in 
      if (match) {
        if (trEl.style.display != "" || trEl.style.display != "table-row" || trEl.style.display != "block") {
          trEl.style.display = "";
        }
      } else {
        if (trEl.style.display != "none") {
          trEl.style.display = "none";
        }
      }
    }
    oldSearchedTextValue = stext;
  }
  
  function clearAndReset() {
    document.langChooserForm.search.value = "";
    hideAndSeek();
  }
  
  function toggleShortList() {
    // Toggle the value (input value is a String, with String("false") means true, thus, compare to "true" string)
    document.langChooserForm.shortList.value = $('INPUT[name="shortList"]').val().toLowerCase() !== "true";
    document.langChooserForm.submit();
  }
  
  function selectLanguagesAndClose() {
    var selectedLangsArray = new Array();
    var selectedLangsIdx = 0;
    for (var i = 0; i < document.langChooserForm.elements.length; i++) {
      var input = document.langChooserForm.elements[i]; 
      if (input.name != "lang") { continue; }
      if (input.checked) {
        selectedLangsArray[selectedLangsIdx++] = input.value;
      }
    }
    var selectedLangs = "";
    for (var i = 0; i < selectedLangsArray.length; i++) {
      selectedLangs += selectedLangsArray[i];
      if (i + 1 != selectedLangsArray.length) {
        selectedLangs += ",";
      }
    }
    if (selectedLangsArray.length == 0) {
      alert(I18N.glp("jcms.field.chooser.language.title"));
      return;
    }
    var jsCallback = $('INPUT[name="jsCallback"]').val();
    if (jsCallback && jsCallback !== '') {
      var fn = window.opener[jsCallback];
      if (typeof fn === "function") {
        fn.apply(null, [selectedLangs]);
      }
    }
    var targetInput = $('INPUT[name="targetInput"]').val();
    if (targetInput && targetInput !== '') {
      var $tartgetInput = window.opener.jQuery(targetInput)
      if(!$tartgetInput.exists()) {
        $tartgetInput = window.opener.jQuery('#' + targetInput);        
      }
      if ($tartgetInput.exists()) {
        $tartgetInput.val(selectedLangs);
      }
    }
    window.close();
  }

  $(document).ready(function() {
    $('INPUT[name="selectall"]').click(function() {
      checkAllLang(this.checked);
    });
    
    $('INPUT[name="search"]').keyup(function() {
      hideAndSeek();
    });
    
    $('BUTTON[name="clear"]').click(function() {
      clearAndReset();
    });
    
    $('.js-select-lang').click(function() {
      var $tr = $(this).closest('TR');
      var rowid = $tr.data('jalios-rowid');
      var lang = $tr.data('jalios-lang');
      checkLang(lang, rowid);
    });
    
    $('BUTTON[name="toggleShortList"]').click(function() {
      toggleShortList();
    });
    
    $('BUTTON[name="selectLanguage"]').click(function() {
      selectLanguagesAndClose();
    });
  });
}(window.jQuery);