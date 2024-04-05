<%@page import="com.jalios.jcmsplugin.collaborativespace.CSQueryBuilder.HasModelFilter"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.CSQueryBuilder"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.migration.CSMigrationAppHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

if (!formHandler.canAccessMigrationApp()) {
  sendForbidden(request, response);
  return;
}

formHandler.validate();
request.setAttribute("CSMigrationHandler", formHandler);

%>
<% for (Category itTypology : formHandler.getTypologies()) { %>
  <table class="table-app table-data table table-cs-migration">
    <% request.setAttribute("typology", itTypology); %>
    <jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/migrate/typologySpaces.jsp" />
  </table>
<% } %>
<table class="table-app table-data table table-cs-migration">
  <tr class="info">
    <th colspan="2">
      <div class="header-typology">
        <b><%= glp("jcmsplugin.collaborativespace.migration.no-typologies") %></b>
        <div class="actions dropdown">
          <button data-jalios-migration-action="toggle-section" data-jalios-target=".no-typologies" type="button" class="no-typologies btn btn-link btn-rounded"><jalios:icon src="chevron-down" /></button>
          <button data-jalios-migration-action="toggle-section" data-jalios-target=".no-typologies" type="button" class="no-typologies hide btn btn-link btn-rounded"><jalios:icon src="chevron-up" /></button>
          <button type="button" data-toggle="dropdown" class="btn btn-link btn-rounded"><jalios:icon src="more-v" /></button>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
            <% if (formHandler.hasOneWorkspaceWithoutModel(null)) { %>
            <% } %>
            <li role="presentation"><a data-jalios-migration-action="migrate-selected" data-jalios-migrate-typology="noTypology"><%= glp("jcmsplugin.collaborativespace.migration.migrate-selected") %></a></li>
          </ul>
        </div>
      </div>
    </th>
  </tr>
  <% for (Workspace itModel : formHandler.getNoTypologiesWorkspaces(true)) { %>
    <tr class="no-typologies typologies-noTypology hide">
      <td colspan="2">
        <div><% if (itModel.isModel()) {%><span class="label label-default"><%= glp("jcmsplugin.collaborativespace.migration.model") %></span><% } %> <%= itModel.getDisplayLink(userLocale) %></div>
      </td>
    </tr>
  <% } %>
  <% for (Workspace itWorkspace : formHandler.getNoTypologiesWorkspaces(false)) { %>
    <tr class="no-typologies typologies-noTypology hide">
      <td>
        <div><% if (itWorkspace.isModel()) {%><span class="label label-default"><%= glp("jcmsplugin.collaborativespace.migration.model") %></span><% } %><b><%= itWorkspace.getDisplayLink(userLocale) %></b> - <span class="model"><%= glp("jcmsplugin.collaborativespace.migration.model") %> : <%= ((CollaborativeSpace)itWorkspace.getCollaborativeSpace()).getModel() != null ? ((CollaborativeSpace)itWorkspace.getCollaborativeSpace()).getModel().getDisplayLink(userLocale) : "<span class='no-model'>" + glp("jcmsplugin.collaborativespace.migration.without-model") + "</span>" %></span></div>
      </td>
      <td><input type="checkbox" name="workspace" value="<%= itWorkspace.getId() %>" /></td>
    </tr>
  <% } %>  
</table>