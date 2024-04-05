/**
 * -----------------------------------------------------------------
 * 
 * JavaScript for CollaborativeSpace Hub APP.
 * 
 * -----------------------------------------------------------------
 */ 

!function ($) {
  
  // ------------------------------------------
  // PRIVATE CODE
  // ------------------------------------------

  var initSortable = function(event){
    var $sortableWrapper = $(".app-cs-hub .card-sortable-wrapper");
    
    if (!$sortableWrapper.exists() || $sortableWrapper.data("sortableInitialized")) {
      return;
    }
    $.console.debug("[cs-hub-app]", "[initSortable]");
    
    // This will add ".ui-sortable" class
    $sortableWrapper.sortable({
      containment: "parent",
      cursor: "move",
      delay: 150,
      tolerance: "pointer",
      placeholder: {
        element: function () {
          return $('<div>').addClass('csp-custom-placeholder card').append($('<div>').addClass('card'));
        },
        update: function (container, p) {
          return;
        }
      },
      // change: triggered during sorting, but only when the DOM position has changed.
      // update: triggered when the user stopped sorting and the DOM position has changed.
      update : function(event, ui) {
        // Send new index of dragged item to the server
        var $draggedItem = ui.item;
        if (!$draggedItem.exists()) {
          return;
        }
        var draggedItemId = $($draggedItem[0]).find(".card").data("jalios-data-workspace-id");
  
        var items = [];
        // Retrieve the items container
        var $wrapper = $(event.target);
        $wrapper.find(".ui-sortable-handle .card").each(function(index, element) {
          var currentItemId = $(element).data("jalios-data-workspace-id");
          items[index] = currentItemId;
        });
        
        $.ajax({
          url : "plugins/CollaborativeSpacePlugin/jsp/hub/reorderFavorites.jsp",
          method : "post",
          data : {
            favoriteIds : items, // Warning: may be only a slice of all favorites due to paging
            movedFavoriteId : draggedItemId // The item that has been moved
          },
          traditional : true // format must be favoriteIds=id1&favoriteIds=id2...
        });
      }
    });
    $sortableWrapper.data("sortableInitialized", true);
  };

  /**
   * Toggles Access Policy exclusive filter.
   */
  const toggleFilter = function(event, elm) {
    event.stopImmediatePropagation();
    
    // Toggle the radio of the selected item
    let $selectedCheckbox = $(elm.find(":radio").first());    
    $selectedCheckbox.prop("checked", !$selectedCheckbox.prop("checked"));
    $selectedCheckbox.data("ignore", true);
    
    // Unselect all radio under the selected item
    if ($selectedCheckbox.prop("checked")) {
      let subList = $(":radio", elm);
      subList.find(":radio").each(function() {
        let $that = $(this);
        if (!($that == elm)) {
          $that.attr('checked', false)
          $that.data("ignore", true);
        }
      });   
    }

    // Disable other radio if exclusive
    let filterList = $(elm.closest(".filter-exclusive"));
    filterList.find(":radio").each(function() {
      let $that = $(this);
      if (!$that.data("ignore")) {
        $that.attr('checked', false)
      }
    });   
    
    // Submit the form
    submitForm(elm);
  }; // toggleFilter

  const submitForm = function(elm) {
    let $form = $(elm.closest("form"));
    $form.refresh({
      isform: true
    });
  };

  /**
   * Updates the Type filter given selected:
   * - main level type (CS or WS)
   * - second (or descendant) levels (a Typology)
   */
  const handleTypeFilters = function(event){
    
    let $input = $(this);
    // If typology is being "enabled"
    if ($input.prop("checked") === false) {
      // Do nothing, simply refresh (POST) the FORM
      $input.refresh();
      return;
    }
    
    // Get other typos at the same level than the current changed one
    let closestContainer = $input.closest("UL");
    let sameLevelTypos = closestContainer.children("LI");
    
    sameLevelTypos.each(function() {
      let $itTypo = $(this);
      let $itInput = $itTypo.find("INPUT.type-filter-input");
      
      // Disable all at same level but the current enabled one
      let notTheCurrentOne = $itInput.val() !== $input.val();
      if (notTheCurrentOne) {
        uncheckIfChecked($itInput);
      }
    });
    
    // Uncheck all typo parent when a child Input is checked
    let $parentLI = $input.closest("UL.typology-menu").closest("LI.js-type-menu-item");
    let $parentInput = $parentLI.find(" > LABEL INPUT.type-filter-input");
    uncheckIfChecked($parentInput);

    // Uncheck root level inputs when a typology is selected
    let $mainMenu = $input.closest("UL.cs-hub-type-root-filter");
    $mainMenu.find(' > LI.js-type-menu-item.active > LABEL INPUT.type-filter-input').each(function(index, element){
      uncheckIfChecked($(element));
    });

    // Uncheck all typo childs when a parent Input is checked
    let $inputLI = $input.closest("LI.js-type-menu-item");
    $inputLI.find(" LI INPUT.type-filter-input").each(function(index, element){
      uncheckIfChecked($(element));
    });

    // Uncheck all typos when 'ws' root level is checked
    if ($input.attr('name') === 'csHubType' && $input.attr('value') === 'ws') {
      let $csLI = $mainMenu.find('LI.js-type-menu-item.root-type-collaborative-spaces');
      $csLI.find(" LI INPUT.type-filter-input").each(function(index, element){
        uncheckIfChecked($(element));
      });
    }
    
    // Process ajax request
    $input.refresh();
  }; // handleTypeFilters
  
  var uncheckIfChecked = function($element) {
    if (!$element || !$element.exists()) {
      return;
    }
    if ($element.prop("checked") === true) {
      $element.prop("checked", false);
    }
  };
  
  /**
   * Query addFavorite action in Ajax.
   * Refreshes the Hub after completion.
   */
  var addFavorite = function(event) {
    if (!$.jalios.a11y.isFocusedClick(event)) {
      return;
    }
    
    event.preventDefault();
    
    var wsId = $(event.currentTarget) ? $(event.currentTarget).data("jalios-ws-id") : null;
    if (!wsId) { return; }
    $.ajax({
      url : "jcore/member/action/addFavoriteWorkspace.jsp",
      data : {
        "ws" : wsId
      }
    })
    .then(function(){
      // Put favorite workspace as hidden input for UX after reload
      let $hubForm = $(".app-cs-hub").closest('FORM');
      let $favInput = $('<input>').attr('name', 'csHubAddedFavorite').attr('type', 'hidden').val(wsId);
      $hubForm.append($favInput);
      $('.topbar-wrapper .Portlet.PortletNavigate').addClass('favorite-workspaces-updated');
      // Refresh Hub
      $hubForm.refresh({
        "isform" : true,
        "nohistory" : true,
        "noscroll" : true
      });
    });
  }; // addFavorite

  /**
   * Query removeFavorite action in Ajax.
   * Refreshes the Hub after completion.
   */
  var removeFavorite = function(event) {
    if (!$.jalios.a11y.isFocusedClick(event)) {
      return;
    }
    
    event.preventDefault();
    
    var wsId = $(event.currentTarget) ? $(event.currentTarget).data("jalios-ws-id") : null;
    if (!wsId) { return; }
    $.ajax({
      url : "jcore/member/action/removeFavoriteWorkspace.jsp",
      data : {
        "ws" : wsId
      }
    })
    .then(function(){
      // Put favorite workspace as hidden input for UX after reload
      let $hubForm = $(".app-cs-hub").closest('FORM');
      let $favInput = $('<input>').attr('name', 'csHubRemovedFavorite').attr('type', 'hidden').val(wsId);
      $hubForm.append($favInput);
      $('.topbar-wrapper .Portlet.PortletNavigate').addClass('favorite-workspaces-updated');
      // Refresh Hub
      $hubForm.refresh({
        "isform" : true,
        "nohistory" : true,
        "noscroll" : true
      });
    });
  }; // removeFavorite

  /**
   * Query removeSuggestion action in Ajax.
   * Refreshes the Hub after completion.
   */
  var removeSuggestion = function(event) {
    if (!$.jalios.a11y.isFocusedClick(event)) {
      return;
    }
    
    event.preventDefault();
    
    var csId = $(event.currentTarget) ? $(event.currentTarget).data("jalios-id") : null;
    if (!csId) { return; }
    $.ajax({
      url : "plugins/CollaborativeSpacePlugin/jsp/hub/hubApp.jsp",
      data : {
        "opIgnoreSuggestion" : true,
        "suggestionId" : csId
      }
    })
    .then(function(){
      // Refresh Hub
      $(".app-cs-hub").refresh({"isform":true});
    });
  };
  
  /**
   * Toggles display card categories
   */
  var toggleCategories = function(event) {
    if (!$.jalios.a11y.isFocusedClick(event)) {
      return;
    }
    
    event.preventDefault();
    
    var $target = $(event.currentTarget);
    if (!$target || $target.length === 0) {
      return;
    }
    $target.siblings(".meta-category-toggler.hide").toggleClass("hide");
  };
  
  // ------------------------------------------
  // DOM READY CODE
  // ------------------------------------------

  var handleRefresh = function(event) {
    if (!event || !event.refresh || event.refresh.type !== "after") {
      return;
    }
    $.console.debug("[cs-hub-app]", "[handleRefresh]", event, $(event.refresh.target));

    // Refresh topbar navigate portlet if any after toggle favorite request is done
    if (event.refresh.target && event.refresh.url === "plugins/CollaborativeSpacePlugin/jsp/hub/hubApp.jsp") {
      $.console.debug("[cs-hub-app]", "[handleRefresh]", 'after HUB refresh');
      if ($('.topbar-wrapper .Portlet.PortletNavigate').hasClass("favorite-workspaces-updated")) {
        $.console.debug("[cs-hub-app]", "[handleRefresh]", 'after HUB refresh + topbar to be refreshed');
        $('.topbar-wrapper .Portlet.PortletNavigate').refresh();
      }
    }
      
    // Refresh topbar navigate portlet expanded state after it has been refreshed
    if (event.refresh.target && $(event.refresh.target).length > 0 && $('.topbar-wrapper .Portlet.PortletNavigate').length > 0
          && $(event.refresh.target).get(0) === $('.topbar-wrapper .Portlet.PortletNavigate').get(0)) {
      $.console.debug("[cs-hub-app]", "[handleRefresh]", 'after topbar refresh');
      if ($('.topbar-wrapper').hasClass('is-expanded')) {
        $('.topbar-wrapper').removeClass('is-expanded');
      }
    }
    initSortable();
  };
  
  /* Do stuff on DOM Ready */
  var register = function(){
    $(document).on("jalios:refresh", handleRefresh); 

    // Register click callback
    $(document).on("change", ".cs-hub-sidebar-type INPUT", handleTypeFilters); 
    $(document).on("click keydown", ".js-add-favorite", addFavorite); 
    $(document).on("click keydown", ".js-remove-favorite", removeFavorite); 
    $(document).on("click keydown", ".js-remove-suggestion", removeSuggestion); 
    $(document).on("click keydown", ".js-meta-category-toggler", toggleCategories); 
    $(document).on('click keydown', '.app-cs-hub .app-sidebar-menu.cs-hub-access-policy-root-filter LI', function(event){
      toggleFilter(event, $(this));
    });  
  };

  $(document).ready(function($) {
    initSortable();
    register();
  });

}(window.jQuery);
