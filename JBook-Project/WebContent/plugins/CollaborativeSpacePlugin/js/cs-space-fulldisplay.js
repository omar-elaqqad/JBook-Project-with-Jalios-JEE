/**
 * -----------------------------------------------------------------
 *
 *  JavaScript for CollaborativeSpace full display.
 *
 * -----------------------------------------------------------------
 */

!(function ($) {
  const ACTION_URL = 'plugins/CollaborativeSpacePlugin/jsp/portal/collaborativeSpaceActions.jsp';

  // ------------------------------------------
  //  Public API
  // ------------------------------------------

 // Namespace
  if (!$.plugin) {
    $.plugin = {};
  }

  /**
   * Documentation of the ExplorerApp public API.<br/>
   *
   * @namespace $.plugin.ExplorerApp
   */
  $.plugin.CollaborativeSpace = {
  
    /**
     * Returns the current collaborative space id
     * @name  $.plugin.CollaborativeSpace.getCSId
     * @function
     * @returns the current collaborative space id
     */
    getCSId: function () {
      return $('.cs-portal').data('jalios-data-id');
    },
    /**
     * Returns the current collaborative space id
     * @name  $.plugin.CollaborativeSpace.getCSId
     * @function
     * @returns the current collaborative space id
     */
    getJPortalId: function () {
      return $(".cs-portal").data("jalios-jportal-id");
    },
    /**
     * Refreshes target portlet and JPortal css
     * @name  $.plugin.CollaborativeSpace.refreshPortletWithUpdatedParams
     * @function
     */
    refreshPortletWithUpdatedParams: function(portletId) {
      let $portlet = $("div[data-portlet-id=" + portletId + "]");
      $.jalios.AjaxRefresh.refreshPortlet(
        portletId, 
        function() {
          $portlet.find(".ajax-loading-component").remove();
        },null,{noscroll:true});
      $portlet.displayLoading();
      $.jalios.jportal.utils.refreshJPortalCSS();
    }
    
    

  }


  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------


  const toggleFavorite = function (event) {
    let $trigger = $(event.currentTarget);
    $.ajax({
      url: ACTION_URL,
      data: {
        opToggleFavorite: true
      },
      type: 'post'
    }).done(function (data) {
      toastr.options = {
        'positionClass': 'toast-top-center'
      };
      toastr.info(data.message);
      //$trigger.closest('.dropdown').removeClass('open');
      $trigger.html(data.data.menuImage + data.data.label);
    
    });
  };

  const updateTab = function($trigger)  {
    let url = new URL('plugins/CollaborativeSpacePlugin/jsp/portal/editApplicationModal.jsp', document.baseURI);
    url.searchParams.set('editedPortlet', $trigger.closest("LI.cs-tab").data("portlet-id"));
    url.searchParams.set('id', $trigger.closest("LI.cs-tab").data("portlet-id"));
    url.searchParams.set('jportal', $.plugin.CollaborativeSpace.getJPortalId());
    url.searchParams.set('applicationEdit', true);
    
    $.jalios.ui.Modal.openFromUrl(url.href);
  }

  const deleteTab = function($trigger) {
    $.jalios.ui.Modal.confirm($("#cs-header-tabs > .nav-tabs").data("remove-app-confirm-message"), function () {
      $.ajax({
        url: ACTION_URL,
        traditional: true,
        method: 'post',
        data: {
          appId: $trigger.closest("LI.cs-tab").data("portlet-id"),
          opRemoveApp: true,
          csId: $.plugin.CollaborativeSpace.getCSId(),
        },
        success: function (_event) {
          $.jalios.Browser.redirect($("#TabHeader_home a").prop("href"));
        },
      });
    });
  }

  const registerClickActionsEvent = function() {
    $(document).on('click keydown', '[data-jalios-cs-action]', function(event){
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
      event.preventDefault();
      event.stopPropagation();

      let $trigger = $(event.currentTarget);

      let actionName = $trigger.data('jalios-cs-action');

      switch (actionName) {
        case 'toggleMetas':
          handleToggleMeta($trigger);
          break;
        case 'deleteTab': 
          deleteTab($trigger);
          break;
        case 'updateTab':
          updateTab($trigger);
          break;
        case 'toggle-favorite':
          toggleFavorite(event);
          break;
        default:
      }
    });
  };

  let _init = false;

  /* Do stuff on DOM Ready */
  const register = function () {
    if (_init) {
      return;
    }
    _init = true;
    $(document).on('jalios:refresh', function(event) {
      if (event.refresh.type === "serialize") {
        if (event.refresh.url === "jcore/wysiwyg/wysiwygInline.jsp") {
          event.refresh.options.params.csOverride = true;
          event.refresh.options.params.collaborativeSpace = $.plugin.CollaborativeSpace.getCSId();
        }
      }
    });
    
    registerClickActionsEvent();
  }; // register

  const handleToggleMeta = function ($trigger) {
    let $metaWrapper = $('.cs-metas-wrapper');
    if (!$metaWrapper.exists()) {
      // Return if no metas
      return;
    }
    
    // Toggle the meta
    let options = $.jalios.ToggleManager.getOption('toggle', '.cs-metas-wrapper', 'closest');
    $.jalios.ToggleManager.toggle($trigger, 'opened', options);

    if ($(".cs-metas-wrapper.opened").exists()) {
      $trigger.attr("title", $trigger.find(".cs-hide-metas-label").data("jalios-button-title"));
    } else {
      $trigger.attr("title", $trigger.find(".cs-show-metas-label").data("jalios-button-title"));
    }
    
    // CSP-535 - force responsive on VIDEO tag (DOM must be visible)
    if ($metaWrapper.find('VIDEO').exists()) {
      if (typeof Event === 'function') {
        window.dispatchEvent(new Event('resize'));
      } else {
        let event = window.document.createEvent('UIEvents');
        event.initUIEvent('resize', true, false, window, 0);
        window.dispatchEvent(event);
      }
    }
  }; // handleToggleMeta

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function ($) {
    register();
  });
})(window.jQuery);