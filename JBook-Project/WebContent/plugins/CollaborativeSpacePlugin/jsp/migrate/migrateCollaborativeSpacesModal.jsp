<%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.migration.CSMigrationHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean>  
<% if (formHandler.validate()) { %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<% if (Util.isEmpty(formHandler.getMatchingWorkspaces()) && !formHandler.isMigrateAllTypology() && !formHandler.isNoTypology()) { %>
  <jalios:modal title="jcmsplugin.collaborativespace.migration.modal-title" >
    <jalios:message msg="todo" />
  </jalios:modal>
<% } else { %>
  <jalios:modal title="jcmsplugin.collaborativespace.migration.modal-title" formHandler="<%= formHandler %>" op="opMigrate" url="plugins/CollaborativeSpacePlugin/jsp/migrate/migrateCollaborativeSpacesModal.jsp" button="jcmsplugin.collaborativespace.migration.modal-button">
    <div>
      <% if (formHandler.showTypologyField()) { %>
        <jalios:field name="targetTypology" label="jcmsplugin.collaborativespace.migration.target-typology" required="false" value="<%= formHandler.getAvailableTargetTypology() %>">
          <jalios:control settings='<%= formHandler.getTypologySettings() %>' />
        </jalios:field>
      <% } %>
      <% if (formHandler.showModelField()) { %>
        <jalios:field name="model" label="jcmsplugin.collaborativespace.migration.model" required="true">
          <% Set<Workspace> models = formHandler.getTypologyModels(); %>
          <% if (Util.getSize(models) == 1) { %>
            <p class="form-control-static"><%= Util.getFirst(models).getTitle(userLang) %></p>
            <jalios:wysiwyg><%= CSManager.getInstance().getCollaborativeSpace(Util.getFirst(models)).getDescription(userLang) %></jalios:wysiwyg>
            <jalios:control settings='<%= new HiddenSettings().name("model").value(Util.getFirst(models).getId()) %>' />
          <% } else { %>
            <jalios:control settings='<%= new EnumerateSettings().select().enumValues(formHandler.getTypologyModels()) %>' />
          <% } %>
        </jalios:field>
      <% } %>
    </div>
    <div>
      <jalios:field label="jcmsplugin.collaborativespace.migration.workspace-list">
        <ul>
        <% for (Workspace itWorkspace : formHandler.getMatchingWorkspaces()) { %>
          <li><jalios:link data="<%= itWorkspace %>" /></li>
        <% } %>
        </ul>
      </jalios:field>
    </div>
    <% for (Workspace itWorkspace : formHandler.getAvailableWorkspacesToUpdate()) { %>
      <jalios:control settings='<%= new HiddenSettings().name("workspacesToUpdate").value(itWorkspace.getId()) %>' />
    <% } %>
    <% if (Util.notEmpty(formHandler.getAvailableCurrentTypology())) { %>
      <jalios:control settings='<%= new HiddenSettings().name("currentTypology").value(formHandler.getAvailableCurrentTypology().getId()) %>' />
    <% } %>
    <% if (Util.notEmpty(formHandler.isNoTypology())) { %>
      <jalios:control settings='<%= new HiddenSettings().name("noTypology").value(true) %>' />
    <% } %>    
    <% if (Util.notEmpty(formHandler.getAvailableModel())) { %>
      <jalios:control settings='<%= new HiddenSettings().name("model").value(formHandler.getAvailableModel().getId()) %>' />
    <% } %>
    <jalios:control settings='<%= new HiddenSettings().name("migrateAllTypology").value(formHandler.isMigrateAllTypology()) %>' />
  </jalios:modal>
<% } %>