!function ($) {
  
  // Namespace
  if (!$.jalios)      { $.jalios    = {}; }
  if (!$.jalios.portalToolbar)   { $.jalios.portalToolbar = {}; }
  
  
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------
  
  /**
   * jalios.portalToolbar public functions
   * <br/>
   * <h5>Description</h5>
   * 
   * @namespace $.plugin.MyPlugin
   */
  $.jalios.portalToolbar = {
    
    /* global variable used to keep the id of the container*/  
    pubChooserCallback: null,

    /**
     * Toggle preview on toolbar and send AJAX Request
     * @param link the clicked link
     */
    preview: function(link){
      var $link = $(link);
      var $div = $link.closest('DIV.Portlet');
      
      if ($link.hasClass('portletPreview')){
        $link.removeClass('portletPreview');
        $div.removeClass('portletPreview');
      } else { 
        $link.addClass('portletPreview');
        $div.addClass('portletPreview');
      }
      
      $.ajax({url:$link.prop('href')});
      
      return false;
    },
    
    /**
     * Convenient callback method called by pubChooser
     * delegating work to  Call the DnDManager
     * 
     * WARNING : This method is called when the popup is closed by a binding on "unload" event
     * @see JCMS.portal.PortalManager.openPubChooser()
     */
    add: function(jcmsId, label, displayURL){

      if (!jcmsId){ return; }
      
      var containerId = "#" + $.jalios.portalToolbar.pubChooserCallback;
      if (!containerId){ return; }
      
      $.jalios.Sortable.Portal.add(containerId, jcmsId);
    },
    
    /**
     * Method called to refresh the current portlet
     */
    refresh: function(event){

      //Retrieve the element which triggered the menu
      var $menuTrigger = $("#"+CtxMenuManager.latestElement);
      
      //The portlet to remove
      var $refreshedPortlet = $menuTrigger.closest(".Portlet");
      
      $refreshedPortlet.refresh();
    },
    
    /**
     * Method called to refresh or update the current portlet
     */
    update: function(event){

      //Retrieve the element which triggered the menu
      var $menuTrigger = $("#"+CtxMenuManager.latestElement);
      
      //Retrieve the update params
      var params = $(event.target).data("jalios-ctxmenu-update-params");
      
      //The portlet to refresh
      var $updatedPortlet = $menuTrigger.closest(".Portlet");
      
      var updateUrl = "jcore/portal/ajaxHandlePortletAction.jsp";
      
      //TODO : this action should be done directly by refreshing the portlet.
      //Perform update action through ajax, and refresh the portlet
      $.ajax({
        url: updateUrl,
        data: params
      }).done(function() {
        $updatedPortlet.refresh();
      });
    },
    
    /**
     * Remove an element calling DnD mechanism + Confirm
     * @param link the clicked link
     */
    remove: function(event){
      //Retrieve the element which triggered the menu
      var $menuTrigger = $("#"+CtxMenuManager.latestElement);
      
      //The portlet to remove
      var $removedPortlet = $menuTrigger.closest(".Portlet");
      
      //The portlet container
      var $container = $menuTrigger.closest(".dnd-container");
      var containerElm = $container.eq(0);
      
      $.jalios.ui.Modal.confirm($(event.target).text(), function(val){
        if (!val) return;
        jQuery.jalios.Sortable.Portal.remove(containerElm, $removedPortlet.getJcmsId());
      })
      
      return false;
    },
    
    /**
     * Convenient method that:
     * - Store the jcmsId in the Object 
     * - Open a PubChooser
     * @param url the url to the pubChooser
     * @see JCMS.portal.PortalManager.add()
     */
    openPubChooser: function(url) {
      var $link = $("#" + CtxMenuManager.latestElement);
      var $wrapper = $link.closest(".Portlet");
      var $container  = $wrapper.find(".dnd-container");
      
      if (!$container.exists()){
        JcmsLogger.warn('PortalManager.Toolbar','openPubChooser(): cannot find container',link,wrapper);
        return;
      }
      
      $.jalios.portalToolbar.pubChooserCallback = $container[0].id;
      return Popup.popupWindow(url,'pubChooser', 900, 500, false, true, true, false);
    }
  }
  
  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------
  
  var register = function(){
    $(document).on("click", ".dropdown-menu .ctxmenu-portlet-action", handleCtxMenuAction);
  }
  
  var handleCtxMenuAction = function(event) {
    event.preventDefault();
    
    var $target = $(event.target);
    var url = $target.prop("href");
    
    var action = $target.data("jalios-ctxmenu-action");
    
    switch (action) {
      case "add":
        $.jalios.portalToolbar.openPubChooser(url);
        break;
      case "remove":
        $.jalios.portalToolbar.remove(event);
        break;
      case "refresh":
        $.jalios.portalToolbar.refresh(event);
        break;
      case "update":
        $.jalios.portalToolbar.update(event);
        break;
    }
    
  }
  
  
  
  // ------------------------------------------
  //  DOM Ready
  // ------------------------------------------
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);