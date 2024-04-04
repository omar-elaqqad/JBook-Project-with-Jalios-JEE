<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.workspace.WorkspaceQueryHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='worker' value='false' />
  <jsp:setProperty name='formHandler' property='showModel' value='false' />
  <jsp:setProperty name='formHandler' property='withPortal' value='true' />
</jsp:useBean><%

if (Util.isEmpty(formHandler.getWorkspaceQuery())) {
  formHandler.setBelongsToWorkspace(true);
} else {
  formHandler.setBelongsToWorkspace(false);
}

WorkspaceResult results = formHandler.getResults();
%>
<div class="workspace-autocomplete-results js-autocomplete-field-result ">
  <% if (Util.notEmpty(results.getSearchedWorkspaceSet())) { %>
    <div class="sidebar-content">
      <div class="list-group list-group-bordered">
        <jalios:foreach collection="<%= results.getSearchedWorkspaceSet() %>" type="Workspace" name="itWorkspace">
          <a class="list-group-item" href="<%= itWorkspace.getDisplayUrl(userLocale) %>">
            <jalios:dataicon data="<%= itWorkspace %>"/><%= itWorkspace.getTitle(userLang) %>
          </a>
        </jalios:foreach>
      </div>
    </div>  
  <% } else if (Util.notEmpty(formHandler.getWorkspaceQuery())){  %>
    <div class="sidebar-no-result">
      <jalios:icon src="sidebar-tab-workspace"/>
      <p><%= glp("ui.topbar.workspace.no-result") %></p>
    </div>
  <% } else {  %>
    <% if (Util.notEmpty(results.getRecentWorkspaceSet()) || Util.notEmpty(results.getOtherWorkspaceSet())) { %>
      <% if (Util.notEmpty(results.getRecentWorkspaceSet())) { %>
        <div class="sidebar-content">
          <h3 class="list-group-separator"><%= glp("ui.workspace.workspace-recently-visited") %></h3>
        
          <div class="list-group list-group-bordered">
            <jalios:foreach collection="<%= results.getRecentWorkspaceSet() %>" type="Workspace" name="itWorkspace">
              <a class="list-group-item" href="<%= itWorkspace.getDisplayUrl(userLocale) %>">
                <jalios:dataicon data="<%= itWorkspace %>"/><%= itWorkspace.getTitle(userLang) %>
              </a>
            </jalios:foreach>
          </div>
        </div>
      <% } %>
      <% if (Util.notEmpty(results.getOtherWorkspaceSet())) { %>
        <div class="sidebar-content">
          <% if (Util.notEmpty(results.getRecentWorkspaceSet())) { %>
            <h3 class="list-group-separator"><%= glp("ui.workspace.workspace-others") %></h3>
          <% } %>
          <div class="list-group list-group-bordered">
            <jalios:foreach collection="<%= results.getOtherWorkspaceSet() %>" type="Workspace" name="itWorkspace">
              <a class="list-group-item" href="<%= itWorkspace.getDisplayUrl(userLocale) %>">
                <jalios:dataicon data="<%= itWorkspace %>"/><%= itWorkspace.getTitle(userLang) %>
              </a>
            </jalios:foreach>
          </div>
        </div>
      <% } %>
    <% } %>
  <% } %>
</div>