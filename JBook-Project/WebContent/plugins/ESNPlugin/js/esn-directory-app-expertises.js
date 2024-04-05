;(function($, window, document, undefined) {

  //"use strict"; // commented as it prevents use of 'arguments.callee'

  let logPrefix = '[directory-app-esn-expertises]';

  let PARAM_NAME_COMPETENCE_ID = 'competenceSearch_competenceId';
  let PARAM_OP_SEARCH = 'competenceSearch_opSearch';
  
  let initDone = false;
  const register = function(){
    if (initDone) {
      return;
    } 
    initDone = true;
    // One time for all inits:
    $(document).on('jalios:refresh', handleBodyRefresh);
    initCompetenceCards();
    initClickHandlers();
    initHandlers();
    initDraggableAndDroppable();
  };
  

  
  const initCompetenceCards = function(){
    let $cards = $('.card.esn-competencies-item-category');
    consoleDebug(logPrefix, '[initCompetenceCards]', $cards, arguments.callee);
    
    $cards.each(function( i ) {
      // getTitle from data attribute
      let $e = $(this);

      let cardTitle = $e.data('esn-directory-filter-expertise-title');

      $e.attr("data-toggle", "tooltip");
      $e.attr("data-placement", "top");
      
      // setTitle if no one yet and new title not empty
      if (cardTitle && !$e.attr('title')) {
        $e.attr('title', cardTitle);
        // Clear
        $e.removeAttr('data-esn-directory-filter-expertise-title');
      }
    });
    // Init tooltip (again) AFTER cards' title have been set!
    initTooltips();
  };
  
  /**
   * Init tooltips. (element need a non empty title HTML attr).
   * Processes tooltips that are not yet initialied, ie, having no data-original-title
   */
  const initTooltips = function() {
    if ($.plugin && $.plugin.DirectoryApp 
        && typeof ($.plugin.DirectoryApp.initTooltips) === 'function') {
      $.plugin.DirectoryApp.initTooltips();
    }
  }; // initTooltips
  
  const initClickHandlers = function(){
    // Navigate / filter on an expertise:
    // 1. from a card:
    $(document).on('click keydown', '.card.esn-competencies-item:not(.esn-competencies-item-new-category)', handleCategoryNavigateClick);
    // 2. from a list item:
    $(document).on('click keydown', '.esn-competencies-item .js-filter-expertise', handleCategoryNavigateClick);
    // 3. from search expertise autocomplete
    $(document).on('select-expertise', handleCategoryAutocompleteSelect);
    // Competence contextual ctxmenu 
    // Close menus on click 
    $(document).on('click keydown', hideCompetenceCtxMenu);
    // Right click on competence
    $(document).on("contextmenu", '.esn-competencies-item-category', handleCompetenceRightClick);
    // Disable right click default browser behavior
    $(".esn-competencies-item-category").mousedown(function (event) {event.preventDefault();});
    // Comptence actions 
    $(document).on("click keydown", "[data-jalios-competence-action]", handleCompetenceAction);
    $(document).on("click keydown", ".esn-competencies-item-new-category", function(event) {
      if (!$.plugin.DirectoryUI.isFocusedClick(event)) {
        return;
      }
      $(event.currentTarget).find("[data-jalios-competence-action]").click();
    });
    // Toggle (pin/unpin) an expertise 
    $(document).on('click keydown', '.esn-competencies-item .js-activate-card', handleCategoryPinClick);
    $(document).on('click keydown', '.esn-directory-explore-breadcrumb .breadcrumb-item', handleCategoryBreadcrumbClick);
    // pinned categories
    $(document).on('click keydown', '.expertise-filters .category-filter-item-remove', handleRemovePinnedCategory);
  }; // initClickHandlers
  
  const initHandlers = function(){
    $(document).on('mouseover', '.card.esn-competencies-item .js-activate-card', handleMouseOverActivateCompetence);
    $(document).on('mouseout', '.card.esn-competencies-item .js-activate-card', handleMouseOutActivateCompetence);
  }; // initHandlers

  /**
   * Hides card main's tooltip to prevent double toolip.
   */
  const handleMouseOverActivateCompetence = function(event){
    let $card = $(this).closest('.card');
    let $cardTooltip = $card.next('DIV.tooltip');
    if ($cardTooltip.length) {
      $cardTooltip.addClass('hide');
    }
  }; // handleHoverActivateCompetence
  
  /**
   * Restores card main's tooltip.
   */
  const handleMouseOutActivateCompetence = function(event){
    let $card = $(this).closest('.card');
    let $cardTooltip = $card.next('DIV.tooltip');
    if ($cardTooltip.length) {
      $cardTooltip.removeClass('hide');
    }
  }; // handleMouseOutActivateCompetence
  
  const handleCategoryNavigateClick = function(event){
    if (!$.plugin.DirectoryUI.isFocusedClick(event)) {
      return;
    }
    let $item = $(event.currentTarget);
    // select/deselect category
    let competenceId;
    if ($item.hasClass('is-pinned') && $item.hasClass('is-node')) {
      // Do not submit search on click on a pinned folder (user need to unpin expertise)
      return;
    } else if ($item.hasClass('is-active')) {
      // Deselect, but return on the parent
      if ($item.data('esn-directory-parent-data-id')) {
        competenceId = $item.data('esn-directory-parent-data-id');
      } else {
        // Reset
        competenceId = null;
      }
    } else {
      // Select
      competenceId = /*on card*/$item.data('jalios-data-id') 
        || /*listItem*/$item.closest('.esn-competencies-item').data('jalios-data-id');
    }
    submitCurrentCompetence(event, competenceId);
  }; // handleCategoryNavigateClick

  // ------------------------------------------------
  // Competence Context Menu
  // ------------------------------------------------

  const CTXT_MENU_URL = "plugins/ESNPlugin/jsp/directoryApp/contextmenu/doDirectoryContextMenu_competenceActions.jsp";
  const hideCompetenceCtxMenu = function(event) {
    $('.competence-context-menu').hide();
  }
  const handleCompetenceRightClick = function(event) {
    let $currentTarget = $(event.currentTarget);
    let catId = $currentTarget.data("jalios-data-id");
    if (!catId) {
      return false;
    }
    
    $.ajax({
      url: CTXT_MENU_URL,
      data: {
        ctxId: catId
      },
      type: "post"
    }).done(function (html) {
      $("#competenceContextMenu .dropdown-menu").html(html);
      $("#competenceContextMenu").css({
        display: "block",
        top: 0,
        left: 0,
        right: "",
        bottom: ""
      });

      // Clean up menu dividers
      $("#competenceContextMenu .dropdown-menu .divider:first-child").remove();
      $("#competenceContextMenu .dropdown-menu .divider:last-child").remove();
      $("#competenceContextMenu .dropdown-menu .divider + .divider").remove();

      var element = $("#competenceContextMenu").get(0);
      var isInViewPortHorizontal = elementInViewportHorizontal(
        element,
        event.pageX
      );
      var isInViewPortVertical = elementInViewportVertical(
        element,
        event.pageY
      );

      $("#competenceContextMenu").css({
        right: !isInViewPortHorizontal ? 0 : "",
        left: !isInViewPortHorizontal ? "" : event.pageX,
        top: !isInViewPortVertical ?
          "" : event.pageY - document.documentElement.scrollTop,
        bottom: !isInViewPortVertical ? 0 : ""
      });
    });
    
    return false;    
  } // handleCategoryRightClick
  
  const elementInViewportHorizontal = function (el, xPosition) {
    return xPosition + el.offsetWidth < window.innerWidth;
  };

  const elementInViewportVertical = function (el, yPosition) {
    return (
      yPosition - document.documentElement.scrollTop + el.offsetHeight <
      window.innerHeight
    );
  };

  // ------------------------------------------------
  // Competence Action (from card or ctxmenu)
  // ------------------------------------------------

  const competenceAdd = function(promptText, parentId) {
    $.jalios.ui.Modal.prompt(promptText,
      function (newName) {
        if (newName === false) {
          return;
        }

        $.ajax({
            url: "plugins/ESNPlugin/jsp/directoryApp/doDirectoryApp_competenceHandler.jsp",
            data: {
              opCompetenceAdd: true,
              competenceParentId: parentId,
              competenceName: newName
            }
          }).done(function () {
            $('FORM.app-directory-form').refresh({isform:true});
          });
      }
    );
  };
  
  const competenceRename = function(promptText, catId, currentCatName) {
    $.jalios.ui.Modal.prompt(promptText,
      function (newName) {
        if (newName === false) {
          return;
        }

        $.ajax({
            url: "plugins/ESNPlugin/jsp/directoryApp/doDirectoryApp_competenceHandler.jsp",
            data: {
              opCompetenceRename: true,
              competenceId: catId,
              competenceName: newName
            }
          }).done(function () {
            $('FORM.app-directory-form').refresh({isform:true});
          });
      },
      currentCatName
    );
  };
  
  const competenceDelete = function(confirmText, catId, catParentId) {
     const deleteCat = function () {
        $.ajax({
            url: "plugins/ESNPlugin/jsp/directoryApp/doDirectoryApp_competenceHandler.jsp",
            data: {
              opCompetenceDelete: true,
              competenceId: catId
            }
          }).done(function () {
            // When deleted competence was active filter, use its parent as the new filter
            let $currentCompetenceIdInput = $('FORM.app-directory-form').find("input[name='competenceSearch_currentCompetenceId']");
            if ($currentCompetenceIdInput.val() === catId) {
              $currentCompetenceIdInput.val(catParentId);
            }
            $('FORM.app-directory-form').refresh({isform:true});
          });
      }
      
      // With new double confirm modal
      // Open a confirmation modal to the given URL
      /*
      $.jalios.ui.Modal.openFromUrl("plugins/ESNPlugin/jsp/directoryApp/categories/confirmCompetenceDeleteModal.jsp", {
        'params': {
          'cid': dataId
        },
        'callback': function(value) {
          if (value){ deleteCat(); }
        }
      });
      */
              
      $.jalios.ui.Modal.confirm(confirmText, deleteCat);
  };
  
  const competenceMove = function(catId, newParentId) {
    // Direct action if newParentId was specified (eg on drag&drop)
    if (newParentId) { 
      $.ajax({
          url: "plugins/ESNPlugin/jsp/directoryApp/doDirectoryApp_competenceHandler.jsp",
          data: {
            opCompetenceMove: true,
            competenceId: catId,
            competenceParentId: newParentId
          }
        }).done(function () {
          $('FORM.app-directory-form').refresh({isform:true});
        });
    }
    // Modal action if newParentId was not specified (eg on item in contextmenu)
    else {
      $.jalios.ui.Modal.openFromUrl("plugins/ESNPlugin/jsp/directoryApp/categories/moveToModal.jsp", {
        'params': {
          'competenceId': catId
        }
      });
    }
  };
  
  const handleCompetenceAction = function(event) {
    if (!$.plugin.DirectoryUI.isFocusedClick(event)) {
      return;
    }
    let $currentTarget = $(event.currentTarget);
    let action = $currentTarget.data("jalios-competence-action");
    let dataId = $currentTarget.data("jalios-data-id");
    let promptOrConfirmText = $currentTarget.data("jalios-text");
    
    if (!action || !dataId) {
      return;
    }
    
    hideCompetenceCtxMenu(); 
    event.stopPropagation();
    event.preventDefault();
    
    switch (action) {
        
      case "add": {
        competenceAdd(promptOrConfirmText, dataId);
        break;
      }
        
      case "rename": {
        let currentCatName = $currentTarget.data("jalios-current-value");
        competenceRename(promptOrConfirmText, dataId, currentCatName);
        break;
      }
        
      case "delete": {
        let parentDataId = $currentTarget.data("jalios-parent-data-id");
        competenceDelete(promptOrConfirmText, dataId, parentDataId);
        break;
      }
        
      case "moveto": {
        competenceMove(dataId);
        break;
      }
        
      default: {
        return;
      }
    }
  } // handleCategoryAction

  // ------------------------------------------
  //  Drag & Drop
  // ------------------------------------------

  const initDraggableAndDroppable = function () {
    initDraggable();
    initDroppable();
  };
  
  var $draggedItem;
  const initDraggable = function () {
    var dragSelector = ".esn-competencies-item-draggable";

    $(dragSelector).draggable({
      start: function (event, ui) {
        $(".app-directory-form").addClass("is-dragndropping");
        $draggedItem = $(event.currentTarget);
        $draggedItem.addClass("is-dragged");
        // Fill helper with info
        $(".competence-helper")
          .text( " " + $draggedItem.find(".js-title").text() )
          .prepend( $draggedItem.find(".js-icon").first().clone() );
      },
      drag: function (e, ui) { },
      stop: function (event, ui) {
        $(".is-dragged").removeClass("is-dragged");
        $draggedItem = undefined;
        $(".app-directory-form").removeClass("is-dragndropping");
      },
      containment: "body",
      scrollSensitivity: 100,
      scrollSpeed: 30,
      delay: 150,
      appendTo: ".app-body",
      helper: function () {
        return "<div class='competence-helper'></div>";
      },
      cursorAt: {
        left: 5,
        top: 0
      },
      cursor: "drag"
    });
  };
  
  const initDroppable = function () {
    var dropSelector = ".esn-competencies-item:not(.esn-competencies-item-new-category), .breadcrumb-item-category";
    $(dropSelector).droppable({
      //activeClass: "ui-state-highlight",
      // accept: ".explorer-item-folder",
      greedy: true,
      over: function (event, ui) {
        $(this).addClass("is-drag-hover");
      },
      drop: function (event, ui) {
        $(this).removeClass("is-drag-hover");
        let catId = $draggedItem.data("jalios-data-id");
        let newParentCatId = $(event.target).data("jalios-data-id");
        competenceMove(catId, newParentCatId);
      },
      out: function (event, ui) {
      },
      // drop: onBlockDroppedHandler,
      tolerance: "pointer"
    });
  };
  
  // ------------------------------------------------
  // Competence navigation
  // ------------------------------------------------
  
  /**
   * Handle click on an expertise autcomplete result.
   */
  const handleCategoryAutocompleteSelect = function(event, autocompleteInfos) {
    let clickedMenuItem = autocompleteInfos.typeahead.$menu.find('.active');

    // Handle click previous/next
    if (!(clickedMenuItem.hasClass("esn-competencies-item"))) {
      if ($(clickedMenuItem).hasClass('ajax-refresh')) {
        $(clickedMenuItem).find('A').refresh({
          'noscroll': true,
          'nohistory': true
        });
      }
    } else {
      let competenceId = clickedMenuItem.data('jalios-data-id');
      if (!competenceId) {
        // Do not submit when clicked item has no data-id
        return true;
      }
      submitCurrentCompetence(event, competenceId);
    }
  }; // handleCategoryAutocompleteSelect

  const handleCategoryBreadcrumbClick = function(event){
    if (!$.plugin.DirectoryUI.isFocusedClick(event)) {
      return;
    }
    let $item = $(event.currentTarget);
    let competenceId = $item.data('jalios-data-id');
    submitCurrentCompetence(event, competenceId);
  }; // handleCategoryBreadcrumbClick

  const handleRemovePinnedCategory = function(event) {
    if (!$.plugin.DirectoryUI.isFocusedClick(event)) {
      return;
    }
    let competenceId = $(this).data('jalios-data-id');
    if (competenceId) {
      removeExpertiseFilter(competenceId);
      if ($.plugin && $.plugin.DirectoryApp && typeof ($.plugin.DirectoryApp.refresh) === 'function') {
        $.plugin.DirectoryApp.refresh.apply(null);
      }
    }
  }; // handleRemovePinnedCategory

  /**
   * Submits given competence as current.
   * Allows empty competenceId to reset form.
   */
  // FIXME: use public function: "$.plugin.DirectoryApp.refresh"
  const submitCurrentCompetence = function(event, competenceId){
    //let $item = $(event.currentTarget);
    //let $form = $item.closest('FORM'); 
    // Retrieve FORM by class, rather than on event (which won't work when UL.typeahead being outside)
    let $form = $('FORM.app-directory-form');
    if (!$form.length) {
      return;
    }
    // Reset the hidden field(s) (the current one) if any, 
    // to prevent old current filter or null value to override new value
    $(':INPUT[name=competenceSearch_currentCompetenceId]').val('');
    $(':INPUT[name=competenceSearch_currentCompetenceId]').each(function(index, element) {
      // If no value, remove input
      let $elt = $(element);
      if (!$elt.val()) {
        $elt.remove();
      }
    });
    
    // Set new category if any
    if (competenceId) {
      let $input = $('<INPUT>')
      .attr('name', 'competenceSearch_currentCompetenceId')
      .attr('type', 'hidden')
      .val(competenceId);
      $form.append($input);
      
      // Trigger perform search (only if there is a competence id)
      let $opSearchInput = $('<INPUT>')
        .attr('name', PARAM_OP_SEARCH)
        .attr('type', 'hidden')
        .val("true");
      $form.append($opSearchInput);
    }
    $form.refresh({'isform': true});
  }; // submitCurrentCompetence
  
  const handleCategoryPinClick = function(event){
    if (!$.plugin.DirectoryUI.isFocusedClick(event)) {
      return;
    }
    consoleDebug(logPrefix, '[handleCategoryPinClick]', arguments.callee);
    event.stopImmediatePropagation();
    event.stopPropagation();
    event.preventDefault();
    
    // Retrieve the cart
    let $item = $(event.currentTarget).closest(".esn-competencies-item");
    
    // select/deselect category
    let competenceId = $item.data('jalios-data-id');
    
    if ($item.hasClass('is-pinned')) {
      consoleDebug(logPrefix, '[handleCategoryPinClick]', 'Remove item', competenceId);
      removeExpertiseFilter(competenceId);
      
    } else {
      consoleDebug(logPrefix, '[handleCategoryPinClick]', 'Add item', competenceId);
      addExpertiseFilter(competenceId);
    }
    submitPinnedCompetence(event);
  }; // handleCategoryPinClick
  
  /**
   * Injects given category as an hidden input in Form.
   */
  const addExpertiseFilter = function(competenceId){
    if (!competenceId) {
      return;
    }
    consoleDebug(logPrefix, '[addExpertiseFilter]', 'expertise', competenceId, arguments.callee);
    let $form = $('FORM.app-directory-form');
    let $input = $('<INPUT>')
        .attr('name', PARAM_NAME_COMPETENCE_ID)
        .attr('type', 'hidden')
        .val(competenceId);
    $form.append($input);
  }; // addExpertiseFilter

  /**
   * Finds category input by given value, and removes this input from FORM.
   */
  const removeExpertiseFilter = function(competenceId){
    if (!competenceId) {
      return;
    }
    consoleDebug(logPrefix, '[removeExpertiseFilter]', 'expertise', competenceId, arguments.callee);
    let $form = $('FORM.app-directory-form');
    let $pinnedInput = $form.find(':INPUT[name="'+PARAM_NAME_COMPETENCE_ID+'"][value="'+competenceId+'"]');
    $pinnedInput.remove();
  }; // removeExpertiseFilter
  
  /**
   * Submits given competence as current.
   */
  const submitPinnedCompetence = function(event, competenceId){
    let $item = $(event.currentTarget);
    let $form = $item.closest('FORM');
    if (!$form.length) {
      return;
    }
    // Set new category
    if (competenceId) {
      let $input = $('<INPUT>')
        .attr('name', PARAM_NAME_COMPETENCE_ID)
        .attr('type', 'hidden')
        .val(competenceId);
      $form.append($input);
    }
    // Whatever we add or remove a competence, add opSearch param to submit search
    let $opSearchInput = $('<INPUT>')
      .attr('name', PARAM_OP_SEARCH)
      .attr('type', 'hidden')
      .val("true");
    $form.append($opSearchInput);

    $form.refresh({'isform': true});
  }; // submitPinnedCompetence
  
  const handleBodyRefresh = function(event){
    let refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh || !refresh.target){ return; }
    
    initCompetenceCards();
    initDraggableAndDroppable();
  };
  
  // ------------------------------------------
  //  UTILS
  // ------------------------------------------

  const consoleDebug = function() {
    if ($.plugin && $.plugin.DirectoryApp && typeof ($.plugin.DirectoryApp.isDebugMode) === 'function') {
      if ($.plugin.DirectoryApp.isDebugMode() && typeof ($.plugin.DirectoryApp.consoleDebug) === 'function') {
        $.plugin.DirectoryApp.consoleDebug.apply(null, Array.apply(null, arguments));
      }
    } else {
      let messages = [];
      Array.prototype.push.apply( messages, arguments );
      $.console.debug(logPrefix, messages);
    }
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function() {
    register();
  });
}(jQuery, window, document));