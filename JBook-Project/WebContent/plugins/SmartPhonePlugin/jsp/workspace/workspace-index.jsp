<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneWorkspaceManager.CollaborativeSpaceUsage"%>
<%@page import="com.jalios.jcms.plugin.PluginManager"%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
%>
<%
if (!isLogged) {
  sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
  return;   
}

if (Util.notEmpty(PluginManager.getInstance().getPlugin("CollaborativeSpacePlugin"))) {
  %>
  <%@ include file='/plugins/SmartPhonePlugin/jsp/service/workspace/workspace-cs.jspf' %>
  <% 
}
String csAccessLevel = Util.toString(request.getAttribute("smartphone.plugin.cs.workspace.access.level"), "");
boolean canAccessWorkspace = workspace.isMember(loggedMember) || csAccessLevel.equalsIgnoreCase("public");
if ( Util.isEmpty(workspace) || !canAccessWorkspace || workspace.isClosed() ) {
  sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
  return; 
}
%>
<div id="workspace-index" class="service-workspace-index-page" data-role="page" data-dom-cache="true" data-add-back-btn="true">
  <smartphone:breadcrumb workspace="<%= workspace %>" />
  <%@ include file='/plugins/SmartPhonePlugin/jsp/workspace/doWorkspaceTopbarMenu.jspf' %>
  <form class="ui-filterable no-focus search-form ws-search-form-<%= workspace.getId() %>" method="post" action="plugins/SmartPhonePlugin/jsp/service/search/doSearch.jsp">
	  <div class="colored-banner input-in-header">
	    <input value="" name="text" data-type="search" placeholder="<%= glp("ui.com.placeholder.search") %>" class="search-topbar-desktop-input append-text ws-search-filter-input-<%= workspace.getId() %>">
	  </div>
	  <input type="hidden" name="workspaceId" value="<%= workspace.getId() %>"/>
	</form>
	
	<ul
	  class="smartphone-search-autocomplete ajax-autocomplete ui-listview-full ui-listview"
	  data-enhanced="true"
	  data-filter="true"
	  data-input=".ws-search-filter-input-<%= workspace.getId() %>"
	  data-inset="false"
	  data-jalios-ajax-method="post"
	  data-jalios-autocomplete="plugins/SmartPhonePlugin/jsp/workspace/workspace-inner.jsp"
	  data-role="listview"
	>
	  <jalios:include jsp="plugins/SmartPhonePlugin/jsp/workspace/workspace-inner.jsp" />
	</ul>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>