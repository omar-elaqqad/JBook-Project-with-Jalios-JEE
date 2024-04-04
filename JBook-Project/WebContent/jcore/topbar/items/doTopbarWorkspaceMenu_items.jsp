<%@ include file='/jcore/doInitPage.jspf' %><%

WebAssetsUtils.addScrollbarWebAssets(jcmsContext);
jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-slide-menu.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-slide-menu.js");
%><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.workspace.WorkspaceQueryHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='worker' value='true' /><%
  %><jsp:setProperty name='formHandler' property='showModel' value='true' /><%
  %><jsp:setProperty name='formHandler' property='withPortal' value='false' /><%
%></jsp:useBean><%

if (Util.notEmpty(formHandler.getWorkspaceQuery())) {
  formHandler.setBelongsToWorkspace(false);
} 

WorkspaceResult results = formHandler.getResults();

boolean showAllWorkspaceFilter = isAdmin && !getBooleanParameter("allWorkspaceFilter", false);
boolean allowWkspFilter = Util.toBoolean(request.getAttribute("allowWkspFilter"),true) || Util.toBoolean(jcmsContext.getAjaxRequestAttribute("allowWkspFilter"),true);
boolean wkspcFilter = getBooleanParameter("workspaceFilter",true) || Util.toBoolean(jcmsContext.getAjaxRequestAttribute("workspaceFilter"),false);  
String superParam = getUntrustedStringParameter("super", "");
jcmsContext.setAjaxRequestAttribute("allowWkspFilter", allowWkspFilter);
jcmsContext.setAjaxRequestAttribute("workspaceFilter", wkspcFilter);

int workspaceCount = Util.getSize(results.getRecentWorkspaceSet()) + Util.getSize(results.getOtherWorkspaceSet());
%>
<jalios:buffer name="workspaceResultHtml">
<% if (Util.isEmpty(formHandler.getWorkspaceQuery())) { %>
  <% if (showAllWorkspaceFilter) { %>
    <%-- Display all workspace link --%>
    <li class="list-group-item clickable">
      <a href='<%= ServletUtil.getUrlWithUpdatedParams(request , new String[] {"allWorkspaceFilter"} , new String[] {"true"}, "workspaceFilter") %>'>
        <jalios:icon src="topbar-work-all-ws" title='<%= glp("ui.work.mn.allworkspaces") %>' />
        <%= glp("ui.work.mn.allworkspaces") %>
      </a>
    </li>  
  <% } %>
  <% if (allowWkspFilter && wkspcFilter && workspaceCount > 1) { %>
	  <%-- Display all my workspace link --%>
	  <li class="list-group-item clickable">
	    <a href='<%= ServletUtil.getUrlWithUpdatedParams(request , new String[] {"workspaceFilter"} , new String[] {""+!wkspcFilter}, "allWorkspaceFilter") %>'>
	      <jalios:icon src="topbar-work-all-ws" title='<%= wkspcFilter ? glp("ui.work.mn.allworkspace") : glp("ui.work.mn.alt.filter",workspace.getTitle(userLang)) %>' />
	      <%= glp("ui.work.mn.allworkspace") %>
	    </a>
	  </li>
  <% } %>

  <% if (Util.notEmpty(results.getRecentWorkspaceSet())) { %>
    <div class="list-group-item list-group-item-header">
      <%= glp("ui.workspace.workspace-recently-visited") %>
    </div>
    <jalios:foreach collection="<%= results.getRecentWorkspaceSet() %>" name="itWorkspace" type="Workspace">
      <%@ include file='/jcore/topbar/items/doTopbarWorkspaceMenu_workspaceItem.jspf' %>
    </jalios:foreach>
    <div class="list-group-item list-group-item-header">
      <%= glp("ui.workspace.workspace-others") %>
    </div>
  <% } %>
  <jalios:foreach collection="<%= results.getOtherWorkspaceSet() %>" name="itWorkspace" type="Workspace">
    <%@ include file='/jcore/topbar/items/doTopbarWorkspaceMenu_workspaceItem.jspf' %>
  </jalios:foreach>
<% } else if (Util.notEmpty(results.getSearchedWorkspaceSet())){ %>
  <jalios:foreach collection="<%= results.getSearchedWorkspaceSet() %>" name="itWorkspace" type="Workspace">
    <%@ include file='/jcore/topbar/items/doTopbarWorkspaceMenu_workspaceItem.jspf' %>
  </jalios:foreach>
<% } %>
</jalios:buffer>
<% if (Util.isEmpty(workspaceResultHtml)) { %>
  <div class="topbar-ctxmenu-no-result">
    <jalios:icon src="topbar-item-workspace"/>
    <p><%= glp("ui.topbar.workspace.no-result") %></p>
  </div>
<% } else { %>
<%= workspaceResultHtml %>
<% } %>