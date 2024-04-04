<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><%
if (!topbarHandler.showWorkspaceMenu()) {
  return;
}

boolean wkspcFilter = HttpUtil.getBooleanParameter(request, "workspaceFilter",true);
boolean allWorkspaceFilter = getBooleanParameter("allWorkspaceFilter", false);

String topbarItemLabel =  "";
if (allWorkspaceFilter) {
  topbarItemLabel = glp("ui.work.mn.allworkspaces");
} else if (!wkspcFilter) {
  topbarItemLabel = glp("ui.topbar.myworkspaces");
} else if (topbarHandler.isWorkZone()) {
  topbarItemLabel = encodeForHTML(JcmsUtil.unescapeHtml(workspace.getTitle(userLang)));
} else if (topbarHandler.isAdminZone()){
  topbarItemLabel = glp("ui.com.alt.admin"); 
}
%>
<div class="topbar-workspace-menu dropdown dropdown-topbar" data-jalios-dropdown-topbar-lazy-url="jcore/topbar/items/doTopbarWorkspaceMenu_body.jsp?allWsUrl=<%= ServletUtil.getUpdatedParams(request, null, null) %>">
  <a id="topbar-workspace-menu" title="<%= encodeForHTMLAttribute(glp("ui.topbar.workspace-menu.title")) %>" data-toggle="dropdown" href="#" class="ctx-caret topbar-item" onclick="return false;" aria-haspopup="true">
    <jalios:icon src="topbar-item-workspace" /><span class="topbar-menu-label topbar-workspace-menu-label hidden-xs hidden-sm hidden-md"><%= topbarItemLabel %></span>
  </a>
  <div class="dropdown-menu keep-open topbar-menu has-header topbar-default-menu topbar-menu" aria-labelledby="topbar-workspace-menu" >
    <div class="topbar-ctxmenu-header">
      <div class="topbar-ctxmenu-header-actions">
        <a class="topbar-ctxmenu-header-item js-close-menu" href="#" title="<%= encodeForHTMLAttribute(glp("ui.topbar.close-menu.title")) %>">
          <jalios:icon src="topbar-close-menu" alt="ui.topbar.close-menu.title" />
        </a>
      </div>
      <%= glp("ui.com.lbl.workspaces") %>
    </div>  
    <div class="topbar-ctxmenu-body">
      <div class='ajax-loading-component ajax-loading topbar-ctxmenu-firstload'><div class='ajax-loading-display'><div class='loader'></div></div></div>
    </div>
  </div>
</div>