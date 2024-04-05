!function ($) {


  const register = () => {
    registerClickActionsEvent();
    $(document).on("click", ".table-cs-migration TR, .table-cs-migration TD", (event) => {
      if ($(event.target).is(":input")) {
        return; // Default behaviour for inputs
      }
      
      event.stopPropagation();
      event.stopImmediatePropagation();
      
      let checkbox = $(event.currentTarget).closest("TR").find("input[type=checkbox]")[0];
      
      if (checkbox) {
        $(checkbox).prop('checked', !checkbox.checked);
      }
    });
  }
  
  const registerClickActionsEvent = () => {
    $(document).on("click", "[data-jalios-migration-action]", (event) => {
      event.preventDefault();
      event.stopPropagation();
      
      let $trigger = $(event.currentTarget);
      
      let actionName = $trigger.data("jalios-migration-action");
      
      switch (actionName) {
        case 'toggle-section':
          let target = $trigger.data("jalios-target");
          $(target).toggleClass("hide");
          break;
        case 'migrate-selected':
          let workspaceIds = [];
          let typologyId = $($trigger).data("jalios-migrate-typology");
          $("TR.typologies-" + typologyId).each(function(idx, element){
            let wsId = $(element).find("input:checked").val();
            if (wsId) {
              workspaceIds.push(wsId);
            }
          });
        
          let options = {
            params: {
              workspacesToUpdate: workspaceIds,
              currentTypology: typologyId
            }
          }
        
        
          $.jalios.ui.Modal.openFromUrl("plugins/CollaborativeSpacePlugin/jsp/migrate/migrateCollaborativeSpacesModal.jsp", options);
          break;          
        default:
      }
    });
  }

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function() {
    register();
  });

}(window.jQuery);
