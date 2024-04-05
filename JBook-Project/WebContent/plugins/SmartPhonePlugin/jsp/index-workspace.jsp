<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.smartphone.*" %>
<%
SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
SortedSet<Workspace> recentWorkspaceSortedSet = SmartPhoneManager.getInstance().getRecentWorkspaceSortedSet(loggedMember, userLang);
SortedSet<Workspace> otherWorkspaceSortedSet = SmartPhoneManager.getInstance().getOtherWorkspaceSet(loggedMember, userLang, recentWorkspaceSortedSet);
request.setAttribute("smartphoneRecentWorkspaceSortedSet", recentWorkspaceSortedSet);
request.setAttribute("smartphoneOtherWorkspaceSortedSet", otherWorkspaceSortedSet);
%>
<jalios:include target="SMARTPHONE_INDEX_WORKSPACE_SET" targetContext="empty"/>
<% 
recentWorkspaceSortedSet = (SortedSet<Workspace>) request.getAttribute("smartphoneRecentWorkspaceSortedSet");
otherWorkspaceSortedSet.addAll((SortedSet<Workspace>) request.getAttribute("smartphoneOtherWorkspaceSortedSet")); 
%>
<div class="index-workspace no-focus">
  <% if (Util.notEmpty(recentWorkspaceSortedSet) || Util.notEmpty(otherWorkspaceSortedSet)) {
    
    boolean displayFilterWorkspace = Util.getSize(recentWorkspaceSortedSet) + Util.getSize(otherWorkspaceSortedSet) > 1; %>
  
    <% if (displayFilterWorkspace) { %>
      <div class="colored-banner input-in-header smartphone-workspace-filter-input-wrapper">
        <input name="q" data-type="search" placeholder="<%= glp("ui.com.placeholder.search") %>" class="smartphone-workspace-filter-input">
      </div>
    <% } %>
    
    <div data-role="content">
      <ul data-role="listview" data-inset="false" data-input=".smartphone-workspace-filter-input" class="smartphone-workspace-filter-list" data-filter-placeholder="<%= glp("jcmsplugin.smartphone.action.filter") %>" <%= displayFilterWorkspace ? "data-filter=\"true\"" : "" %>>
        <% if (Util.notEmpty(recentWorkspaceSortedSet)) { %>
          <li data-role="list-divider"><%= glp("jcmsplugin.smartphone.lbl.workspace-index.recent") %></li>
          <jalios:foreach collection="<%= recentWorkspaceSortedSet %>" type="Workspace" name="itWorkspace">
            <li>
              <a href="plugins/SmartPhonePlugin/jsp/workspace/workspace-index.jsp?workspaceId=<%= itWorkspace.getId() %>">
                <h2><%= itWorkspace.getTitle(userLang) %></h2>
              </a>
            </li>
          </jalios:foreach>
        <% } %>
        <% if (Util.notEmpty(otherWorkspaceSortedSet)) { %>
          <% if (Util.notEmpty(recentWorkspaceSortedSet)) { %>
            <li data-role="list-divider"><%= glp("jcmsplugin.smartphone.lbl.workspace-index.other") %></li>
          <% } %>
          <jalios:foreach collection="<%= otherWorkspaceSortedSet %>" type="Workspace" name="itWorkspace">
            <li>
              <a href="plugins/SmartPhonePlugin/jsp/workspace/workspace-index.jsp?workspaceId=<%= itWorkspace.getId() %>">
                <h2><%= itWorkspace.getTitle(userLang) %></h2>
              </a>
            </li>
          </jalios:foreach>
        <% } %>
      </ul>
    </div>
  <% } %>
</div>
