<%@page import="com.jalios.jcmsplugin.collaborativespace.migration.CSMigrationAppHandler"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
Category typology = (Category) request.getAttribute("typology");
CSMigrationAppHandler formHandler = (CSMigrationAppHandler) request.getAttribute("CSMigrationHandler");

if (!formHandler.canAccessMigrationApp()) {
  sendForbidden(request, response);
  return;
}

%>
<% if (Util.notEmpty(formHandler.getTypologyWorkspaces(typology, true)) || Util.notEmpty(formHandler.getTypologyWorkspaces(typology, false))) { %>
  <tr class="info">
    <th colspan="2">
      <div class="header-typology">
        <b><%= formHandler.getTypologyTitle(typology) %></b>
        <div class="actions dropdown">
          <button data-jalios-migration-action="toggle-section" data-jalios-target=".typologies-<%= typology.getId() %>" type="button" class="typologies-<%= typology.getId() %> btn btn-link btn-rounded"><jalios:icon src="chevron-down" /></button>
          <button data-jalios-migration-action="toggle-section" data-jalios-target=".typologies-<%= typology.getId() %>" type="button" class="typologies-<%= typology.getId() %> hide btn btn-link btn-rounded"><jalios:icon src="chevron-up" /></button>
          <button type="button" data-toggle="dropdown" class="btn btn-link btn-rounded"><jalios:icon src="more-v" /></button>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
            <% if (formHandler.hasOneWorkspaceWithoutModel(typology)) { %>
              <li role="presentation"><a class="modal" href="<%= formHandler.getMigrateAllTypologyWorkspacesWithoutModelsModalLink(typology) %>"><%= glp("jcmsplugin.collaborativespace.migration.migrate-all") %></a></li>
            <% } %>
            <li role="presentation"><a data-jalios-migration-action="migrate-selected" data-jalios-migrate-typology="<%= typology.getId() %>"><%= glp("jcmsplugin.collaborativespace.migration.migrate-selected") %></a></li>
          </ul>
      </div>
    </th>
  </tr>
  <% for (Workspace itModel : formHandler.getTypologyWorkspaces(typology, true)) { %>
    <tr class="typologies-<%= typology.getId() %> hide">
      <td colspan="2">
      <div><% if (itModel.isModel()) { %><span class="label label-default"><%= glp("jcmsplugin.collaborativespace.migration.model") %></span><% } %> <%= itModel.getTitle() %></div>
      <div>
        <% if (itModel.getCollaborativeSpace() != null) { %>
          <div>
            <% for (Category itTypology : CSManager.getInstance().getTypologies((CollaborativeSpace) itModel.getCollaborativeSpace())) { %>
              <span class="typology"><%= itTypology.getName(userLang) %></span>
            <% } %>
          </div>
        <% } %>
      </div>
      </td>
    </tr>
  <% } %>
  <% for (Workspace itWorkspace : formHandler.getTypologyWorkspaces(typology, false)) { %>
    <tr class="typologies-<%= typology.getId() %> hide">
      <td>
        <div><% if (itWorkspace.isModel()) {%><span class="label label-default"><%= glp("jcmsplugin.collaborativespace.migration.model") %></span><% } %><b><%= itWorkspace.getDisplayLink(userLocale) %></b> - <span class="model"><%= glp("jcmsplugin.collaborativespace.migration.model") %> : <%= ((CollaborativeSpace)itWorkspace.getCollaborativeSpace()).getModel() == null ? "<span class='no-model'>" + glp("jcmsplugin.collaborativespace.migration.without-model") + "</span>" : ((CollaborativeSpace)itWorkspace.getCollaborativeSpace()).getModel().getDisplayLink(userLocale)  %></span></div>
        <div>
          <% if (itWorkspace.getCollaborativeSpace() != null) { %>
            <% for (Category itTypology : CSManager.getInstance().getTypologies((CollaborativeSpace) itWorkspace.getCollaborativeSpace())) { %>
              <span class="typology"><%= itTypology.getName(userLang) %></span>
            <% } %>
          <% } %>
        </div>
      </td>
      <td><input type="checkbox" name="workspace" value="<%= itWorkspace.getId() %>" /></td>
    </tr>
  <% } %>
<% } else { %>
  <tr class="warning">
    <th colspan="2">
      <b><%= formHandler.getTypologyTitle(typology) %></b> <%= glp("jcmsplugin.collaborativespace.migration.no-model-no-workspace") %>
    </th>
  </tr>
<% } %>
<% if (Util.notEmpty(typology.getChildrenSet())) { %>
  <% for (Category itTypology : typology.getChildrenSet()) { %>
    <% 
    request.setAttribute("typology", itTypology);
    %>
    <jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/migrate/typologySpaces.jsp" />
  <% } %>
<% } %>