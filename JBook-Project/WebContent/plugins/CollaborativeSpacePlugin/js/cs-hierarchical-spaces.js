/**
 * -----------------------------------------------------------------
 * 
 * JavaScript for CollaborativeSpace PortletMyCollaborativeSpace Sub spaces template.
 * 
 * -----------------------------------------------------------------
 */ 

;(function($, window, document, undefined) {

  "use strict";
  
  // ------------------------------------------
  // PRIVATE CODE
  // ------------------------------------------

  const initShowSubspaces = function(event){
    let $toggleSubspaces = $('.cs-node-toggle-childs');
    
    if (!$toggleSubspaces.exists() || $toggleSubspaces.attr("data-toggle-subspaces-initialized")) {
      return;
    }
    
    $.console.debug("cs-hierarchical-spaces.js", "initShowSubspaces", $toggleSubspaces);

    $toggleSubspaces.on('click keydown', function(event) {
      if (!isFocusedClick(event)) {
        return;
      }
      let $elt = $(event.target);
      if (!$elt.exists()) {
        return;
      }
      let paramName = $elt.data('jalios-cs-tree-param-name');
      let paramValue = $elt.data('jalios-cs-tree-param-value');
      event.preventDefault();
      event.stopPropagation();
      
      // Trigger ajax-refresh with Identifier of toggled space
      let jsonParams = { };
      if (paramName && paramValue) {
        jsonParams[paramName] = paramValue;
      }
      $elt.closest('.ajax-refresh-div').refresh({
        "nohistory": true,
        "noscroll": true,
        params: jsonParams
      });
    });
    $toggleSubspaces.attr("data-toggle-subspaces-initialized", true);
  }; // initShowSubspaces

  const isFocusedClick = function(event){
    if (!event){
      return false;
    }
    if (event.type === 'click'){
      return true;
    } else if (event.type === 'keydown'){
      let code = event.charCode || event.keyCode;
      if (code === 32 || code === 13){
        return true;
      }
    }
    return false;
  } /* EOF.isFocusedClick*/

  // ------------------------------------------
  // DOM READY CODE
  // ------------------------------------------

  const handleRefresh = function(event) {
    if (!event || !event.refresh || event.refresh.type !== "after") {
      return;
    }
    initShowSubspaces();
  }; // handleRefresh
  
  /* Do stuff on DOM Ready */
  const register = function(){
    $(document).on("jalios:refresh", handleRefresh); 
  }; // register

  $(document).ready(function($) {
    initShowSubspaces();
    register();
  });

}(jQuery, window, document));