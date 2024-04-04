<%@page import="com.jalios.jcms.uicomponent.autocomplete.TopbarSearchAutocompleteHandler"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
TopbarSearchAutocompleteHandler handler = (TopbarSearchAutocompleteHandler) request.getAttribute("jcms.topbar.search.formHandler");
Set<Workspace> workspaceSet = handler.getResult().getWorkspaceSet(Workspace.getFavoriteComparator(loggedMember, userLang));
%>
<div class="topbar-search-results-wrapper topbar-search-workspace-list">
  <% if (Util.notEmpty(workspaceSet)) { %>
    <jalios:foreach collection="<%= workspaceSet %>" name="itWorkspace" type="Workspace" max="10">
      <jalios:link css="typeahead-link js-ripple topbar-search-result-item topbar-search-result-workspace" data="<%= itWorkspace %>">
        <% if (itWorkspace.isFavorite(loggedMember)) { %>
          <jalios:icon src="favorite" />
        <% } %>
        <jalios:dataicon data="<%= itWorkspace %>" /><%= itWorkspace.getTitle(userLang) %>
      </jalios:link>
    </jalios:foreach>
  <% } else { %>
    <%@ include file="/jcore/autocomplete/acTopbarSearch_empty.jspf" %>
  <% } %>
</div>