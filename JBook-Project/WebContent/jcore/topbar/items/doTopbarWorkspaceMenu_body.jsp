<%@ include file='/jcore/doInitPage.jspf' %><%
TextFieldSettings searchMenuSettings = new TextFieldSettings().css("js-slidemenu-input-refresh").name("workspaceQuery").placeholder("ui.workspace.workspace-search-placeholder");
jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-slide-menu.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-slide-menu.js");
%>
<div class="workspace-menu slide-global slide-wrapper ajax-refresh-div" data-jalios-ajax-refresh-url="jcore/topbar/items/doTopbarWorkspaceMenu_items.jsp" >
  <div class="list-group-item slide-menu-search-input">
    <jalios:control settings="<%= searchMenuSettings %>" />
  </div>
  <div class="js-slidemenu-input-refresh-wrapper list-group">
    <jalios:include jsp="jcore/topbar/items/doTopbarWorkspaceMenu_items.jsp" />   
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>