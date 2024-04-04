<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">
  <div class="col-md-6">
  <fieldset class="col-md-12">
    <jalios:field label="ui.adm.prop.portal.index" name="channel_default_index" tooltip="ui.adm.prop.portal.index.h" value='<%= formHandler.getChannel_default_index() %>' disabled='<%= formHandler.isDisabled("channel.default.index") %>'>
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>
  
    <jalios:field label="ui.adm.prop.portal.nav" name='display_navigate_root' tooltip="ui.adm.prop.portal.nav.h" value='<%= formHandler.getDisplay_navigate_root() %>' disabled='<%= formHandler.isDisabled("display.navigate-root") %>'>
      <jalios:control settings='<%= new CategorySettings().multiple() %>' />
    </jalios:field>

    <jalios:field label="ui.adm.prop.adv.adminicon" name='channel_default_show_adminicon' value='<%= Util.toBoolean(formHandler.getChannel_default_show_adminicon(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
  </fieldset>
  </div>
  <div class="col-md-6">   
    <fieldset class="col-md-12">
      <jalios:field label="ui.adm.prop.portal.defportal" name="channel_default_portal" value='<%= channel.getPublication(formHandler.getChannel_default_portal()) %>' disabled='<%= formHandler.isDisabled("channel.default-portal") %>'>
        <jalios:control settings='<%= new PublicationSettings().superType(PortalInterface.class).noWorkspaceFilter() %>' />
      </jalios:field>

      <jalios:field label="ui.adm.prop.portal.printportal" name="channel_default_printportal" value='<%= channel.getPublication(formHandler.getChannel_default_printportal()) %>' disabled='<%= formHandler.isDisabled("channel.default-printportal") %>'>
        <jalios:control settings='<%= new PublicationSettings().superType(PortalInterface.class).noWorkspaceFilter() %>' />
      </jalios:field>
      
      <jalios:field label="ui.adm.prop.portal.app-portal" name="channel_app_portal" value='<%= channel.getPublication(formHandler.getChannel_app_portal()) %>' disabled='<%= formHandler.isDisabled("channel.app-portal") %>'>
        <jalios:control settings='<%= new PublicationSettings().superType(PortalInterface.class).noWorkspaceFilter() %>' />
      </jalios:field>
    </fieldset>
  </div>
</div>
<div class="row">
  <div class="col-md-6">

    <%-- --- Topbar ------------------------------ --%>
    <fieldset class="col-md-12">
      <legend><%= glp("ui.adm.prop.tab.topbar") %></legend>
      
      <jalios:field label="ui.adm.prop.topbar.navigation-portlet" tooltip="ui.adm.prop.topbar.navigation-portlet.h" name="channel_topbar_navigation_portlet" value='<%= channel.getPublication(formHandler.getChannel_topbar_navigation_portlet()) %>' disabled='<%= formHandler.isDisabled("channel.topbar.navigation-portlet") %>'>
        <jalios:control settings='<%= new PublicationSettings().superType(PortletNavigate.class).noWorkspaceFilter() %>' />
      </jalios:field>

      <jalios:field label="ui.adm.prop.portal.fav-ws" name='display_favorite_ws_root' tooltip="ui.adm.prop.portal.fav-ws.h" value='<%= formHandler.getDisplay_favorite_ws_root() %>' disabled='<%= formHandler.isDisabled("$id.favorite-ws-root") %>'>
        <jalios:control settings='<%= new CategorySettings() %>' />
      </jalios:field>
    </fieldset>

  </div>
</div>