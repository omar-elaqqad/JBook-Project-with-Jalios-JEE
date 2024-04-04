<%@ include file='/jcore/doInitPage.jspf'%>
<%
Workspace itWorkspace = (Workspace)request.getAttribute("data-report.workspace");
List<Content> shareContentList = itWorkspace.getSharedContentList(loggedMember, 0, 500);
%>
<% if (Util.notEmpty(shareContentList)) { %>
<h3><%= glp("ui.adm.data-report.doc.shared-content") %></h3>
<table class='table-data auto'>
  <thead>
  <tr> 
    <th></th>
    <th><%= glp("ui.com.core-type.lbl.Content") %></th>
    <th><%= glp("ui.com.lbl.attach-workspaces") %></th>
  </tr>
  </thead>
  
  <tbody>
    <jalios:foreach collection='<%= shareContentList %>' name='itPub' type='Publication' counter='itSharedCounter'>
    <%  
    Date now = new Date();
    %>
    <tr>
      <td class='numeric'>
        <%= itSharedCounter %>.
        <jalios:edit pub='<%= itPub %>' />
      </td>
      <td>
        <jalios:dataicon data='<%= itPub %>' />
        <jalios:link data="<%= itPub %>" />
      </td>
      <td>
        <ul class="list-unstyled">
        <jalios:foreach collection="<%= itPub.getAttachWorkspaceSet() %>" name="itAttachWS" type="Workspace" counter='itSharedCounterAttachWS'>
          <% if (isAdmin || loggedMember.belongsToWorkspace(itAttachWS)) { %>
          <li>
            <jalios:dataicon data="<%= itAttachWS %>" /> 
            <jalios:link data="<%= itAttachWS %>" />
          </li>
          <% } %>
        </jalios:foreach>
        </ul>
      </td>
    </tr>
    </jalios:foreach>
  </tbody>
</table>
<% } %>
