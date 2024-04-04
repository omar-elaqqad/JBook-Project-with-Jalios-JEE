<%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><%
WebAssetsUtils.addScrollbarWebAssets(jcmsContext);
jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-slide-menu.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-slide-menu.js");
jcmsContext.addJavaScript("js/jalios/ux/jalios-topbar-admin-menu.js");
boolean showLanguageChooser = channel.isMultilingual();
%>
<% if (topbarHandler.showToolsMenu()) { %>
<%-- Administration Menu : admin, access to workspace area, and advanced action --%>
<jalios:buffer name="adminMenuBuffer1">
  <% if (topbarHandler.showAdminMenuEntry()) { %>
  <a class="admin-menu-item list-group-item"  href="admin/admin.jsp"><jalios:icon src="admin"/> <%= glp("ui.com.alt.admin") %></a>
  <% } %>
  <% if (topbarHandler.showWorkMenuEntry()) { %>
  <a class="admin-menu-item list-group-item"  href="work/pubBrowser.jsp?ws=<%= JcmsUtil.getId(loggedMember.getFavoriteWorkspace(workspace , null)) %>"><jalios:icon src="workspace"/> <%= glp("ui.com.lbl.workspace") %></a>
  <% } %>
</jalios:buffer>

<jalios:buffer name="adminMenuBuffer2">
  <% boolean isJPortal = (displayPortal instanceof JPortal); %>
  <% if (topbarHandler.showPortalMenuEntry()) {
    String editPortalUrl = null;
    
	  if (isJPortal) {
	    editPortalUrl = JPortalUtils.getJPortalEditionUrl((JPortal) displayPortal);
	  }
	  if(editPortalUrl == null){
		  editPortalUrl = PortalManager.sendAction(request,null,PortalManager.PORTAL_ACTION_MODE, isPortalMode ? PortalManager.PORTAL_ACTION_REMOVE : PortalManager.PORTAL_MODE_ENABLE);
	  }
	  %>
      <a href="<%= editPortalUrl %>" class="admin-menu-item list-group-item portalModeIcon<%= isPortalMode ? " active" : "" %>"  title="<%= encodeForHTMLAttribute(glp("ui.com.alt.portal")) %>">
      	<jalios:icon src='portal-editor' /> <%= glp("ui.com.alt.portal") %>
      </a>
      
      <% if(isJPortal){ %>
      <a class="admin-menu-item list-group-item jportal-simple-edit-menu-start" role="button" tabindex="0" data-jalios-jportal-action="activate-jportal-simple-edit">
        <jalios:icon src='portal-editor' /> <span class="activate-jportal__label"><%= glp("jportal-simple-edition.start-edition.label") %></span>
      </a>
      
	      <a class="admin-menu-item list-group-item hide jportal-simple-edit-menu-stop" role="button" tabindex="0" data-jalios-jportal-action="activate-jportal-simple-edit">
	        <jalios:icon src='jportal-simple-edition-stop-edit' /> <span class="activate-jportal__label"><%= glp("jportal.simple-edition.stop-edition.label") %></span>
	      </a>
      <% } %>
	<%}%>

  <% if (topbarHandler.showInspectDataMenuEntry()) { %>
	  <a class="admin-menu-item list-group-item modal"  href="admin/editDataId.jsp"><jalios:icon src="inspect"/> <%= glp("ui.adm.mn.dev.edit-data") %></a>
  <% } %>
  <%-- Language chooser --%>
  <% if (showLanguageChooser) { %>
    <a class="admin-menu-item list-group-item admin-menu-item-change-userlang" href="#" onclick="return false;" data-bound="topbar-tools-change-user-lang">
      <jalios:icon src="ml" /> <%= glp("ui.topbar.tools-menu.change-user-lang") %>
      <jalios:icon src='menu-next' css="icon-child-menu"/>
    </a>
    <%-- SUB MENU --%>
    <jalios:buffer name="back">
      <a role="button" tabindex="0" class="admin-menu-item list-group-item back" data-jalios-slidemenu-bound-mode="back" data-bound="admin-menu-root">
        <jalios:icon src='menu-prev' />
        <%= glp("menu.back") %>
      </a>
    </jalios:buffer>
    <div class="list-group child-menu hide list-group-userlang" data-bound="topbar-tools-change-user-lang">
      <%= back %>
      <%
      StringBuffer flagBuffer;
      for (String itLang : channel.getLanguageList()) {
        boolean currentActive = Util.getString(userLang, "").equals(itLang);
        flagBuffer = new StringBuffer();
        LangTag.appendFlag(flagBuffer, itLang, glp("lang." + itLang));
        String changeLangUrl = LangTag.getChangeUrl(request, itLang);
        %>
        <a href="<%= changeLangUrl %>" class="admin-menu-item list-group-item admin-menu-devtools-change-userlang-<%= itLang %><%= currentActive ? " active" : "" %>"
           title="<%= encodeForHTMLAttribute(glp("lang." + itLang)) %>">
          <%= flagBuffer.toString() %>
          <%= JcmsUtil.glp(itLang, "lang") %>
        </a>
      <% } %>
    </div>
  <% } %>

  <jalios:buffer name="adminMenuTarget">
	  <jalios:include target='<%= topbarHandler.getTargetPrefix() +"_ADMIN_MENU" %>' targetContext="ctxMenu" />
  </jalios:buffer>
  <%= adminMenuTarget %>

</jalios:buffer>

<% if (Util.notEmpty(adminMenuBuffer1) || Util.notEmpty(adminMenuBuffer2)) { %>
  <div class="topbar-admin-menu dropdown dropdown-topbar topbar-item-wrapper">
    <a id="topbar-advanced-item" tabindex="0" title='<%= encodeForHTMLAttribute(glp("ui.topbar.advanced-menu.title")) %>' data-toggle="dropdown" class="topbar-item" role="button" aria-haspopup="true"><jalios:icon src="topbar-admin" /></a>
    <div class="dropdown-menu keep-open topbar-menu has-header topbar-default-menu dropdown-menu-right topbar-menu" aria-labelledby="topbar-advanced-item" id='ctxAdminMenu'>
      <div class="topbar-ctxmenu-header">
        <div class="topbar-ctxmenu-header-actions">
          <a class="topbar-ctxmenu-header-item js-close-menu" tabindex="0" role="button" title="<%= encodeForHTMLAttribute(glp("ui.topbar.close-menu.title")) %>">
            <jalios:icon src="topbar-close-menu" alt="ui.topbar.close-menu.title" />
          </a>
        </div>
        <h2><%= glp("ui.topbar.tools-menu") %></h2>
      </div>
      <div class="topbar-ctxmenu-body list-group list-group-noborder">
        <div class="slide-wrapper">
          <div class="main-menu list-group is-active" data-bound="admin-menu-root">
            <%= adminMenuBuffer1 %>
            <%= adminMenuBuffer2 %>
          </div>
        </div>
      </div>
    </div>
  </div>
<% } %>
<% } %>
