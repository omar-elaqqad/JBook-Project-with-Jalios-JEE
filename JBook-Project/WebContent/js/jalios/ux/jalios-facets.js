! function($) {

  var register = function() {
    initCategoriesChecked();

    $(document).on('click', '#search-facets INPUT[type=checkbox], #search-facets INPUT[type=radio]', function(event) {
      doSubmitFacets($(event.currentTarget));
    });
    $(document).on('keydown', '#search-facets label', function(event) {
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
      doSubmitFacets($(event.currentTarget).find("input"));
    });
    $(document).on("jalios:autocomplete", doSubmitFacetsAfterAutocomplete);
  }

  /**
   * Variable to keep the checked categories of the facets separated by category panel (key = panel ID, value array of checked categories)
   * When we search a category by autocomplete, the checed categories is not unchecked after selection. We keep the ID to force the checkbox to be unchecked
   **/
  var treecatChecked = {};

  $(document).on('jalios:refresh', function(event) {
    var refresh = $.jalios.Event.match(event, 'refresh', 'after')

    if (!refresh) {
      return;
    }

    if (event.refresh.url === "jcore/portal/ajaxPortal.jsp") {
      initCategoriesChecked();
    }
  });

  var initCategoriesChecked = function() {
    treecatChecked = {};

    $('#search-facets .facet-categories .panel-collapse').each(function() {
      var currentPanelId = $(this).attr('id');
      $(this).find('UL.treeview LI INPUT:checked').each(function() {
        if (!treecatChecked[currentPanelId]) {
          treecatChecked[currentPanelId] = [];
        }
        treecatChecked[currentPanelId].push($(this).val());
      });
    });
  };

  var doSubmitFacets = function($element) {
    // CASE 1 : boolean checkbox (eg : catName, searchInFiles, ...)
    // Checkbox having the "boolean" class must always
    // be submitted (therefore always checked) but the value is changed
    if ($element.is('.boolean')) {
      $element.val(!$.jalios.Common.toBoolean($element.val(), true));
      $element.prop('checked', true);
    }
    // CASE 2 : multiple option checkbox with some exclusive behavior
    // eg:
    //   - when searchedAllFields is checked, we must uncheck all searchFields
    //   - when one searchFields is checked,  we must uncheck searchedAllFields
    // Only process checked case
    else {
      var $li = $element.closest('LI');
      if ($li.hasClass('exclusive')) {
        var $checkbox = $li.find('INPUT[type=checkbox]');
        if ($checkbox.is(":checked")) {
          // Uncheck all and check exclusive element
          $element.closest('UL.app-sidebar-menu-formitems').find('INPUT[type=checkbox]').prop('checked', false);
          $checkbox.prop('checked', true);
        }
      } else {
        // Uncheck exclusive element
        $element.closest('UL.facet-list').find('.exclusive INPUT[type=checkbox]').prop('checked', false);
      }
    }

    // Check the wrapper
    var $wrapper = $('#search-facets');

    // Advanced mode do not submit
    var isAdvanced = $wrapper.hasClass('advanced');

    // Explicit submit by the user
    if (isAdvanced) {
      return;
    }

    // Submit form
    $("FORM[name='queryForm']").refresh({
      isform: true,
      brokerTrigger: $element
    });
  };

  var doSubmitFacetsAfterAutocomplete = function(event) {
    var typeahead = jQuery.jalios.Event.match(event, 'autocomplete');
    if (typeahead) {
      var $wrapper = typeahead.$element.closest('#search-facets');
      if ($wrapper.exists()) {
        // Advanced mode do not submit
        var isAdvanced = $wrapper.hasClass('advanced');

        // Explicit submit by the user is it's Advanced
        if (!isAdvanced) {
          var $panel = typeahead.$element.closest('.panel-collapse');
          var panelId = $panel.attr('id');

          var value = typeahead.value;

          setTimeout(function() {
            if (value) {
              if (!treecatChecked[panelId]) {
                treecatChecked[panelId] = [];
              }
              var idx = $.inArray(value, treecatChecked[panelId]);
              if (idx < 0) {
                // The category is already checked, add this category to the array
                treecatChecked[panelId].push(typeahead.value);
              } else {
                // Remove the category and uncheck the checkbox related to the category
                treecatChecked[panelId].splice(idx, 1);
                $panel.find('INPUT[type="checkbox"]#' + value).prop('checked', false);
              }
            }

            // Submit form
            var $submit = $('#facets-submit');
            $.jalios.DOM.follow.defer($submit);
          }, 200);
        }
      }
    }
  };

  // ------------------------------------------
  //  READY
  // ------------------------------------------

  // Initialization on DOM ready
  $(document).ready(function($) {
    register();
  });

}(window.jQuery);