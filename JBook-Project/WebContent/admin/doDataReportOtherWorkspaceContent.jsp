<%@ include file='/jcore/doInitPage.jspf'%>
<%
Workspace itWorkspace = (Workspace)request.getAttribute("data-report.workspace");
List<Content> otherWorkspaceContentList = itWorkspace.getOtherWorkspaceContentList(loggedMember, 0, 500);
%>
<% if (Util.notEmpty(otherWorkspaceContentList)) { %>
<h3><%= glp("ui.adm.data-report.doc.otherws-content") %></h3>
<table class='table-data auto'>
  <thead>
    <tr> 
      <th></th>
      <th><%= glp("ui.com.core-type.lbl.Content") %></th>
      <th><%= glp("ui.com.lbl.workspace") %></th>
    </tr>
  </thead>
  
  <tbody>
    <jalios:foreach collection='<%= otherWorkspaceContentList %>' name='itPub' type='Publication' counter='itOtherWSCounter'>
    <%  
    Date now = new Date();
    %>
    <tr>
      <td class='numeric'>
        <%= itOtherWSCounter %>.
        <jalios:edit pub='<%= itPub %>' />
      </td>
      <td>
        <jalios:dataicon data='<%= itPub %>' />
        <jalios:link data="<%= itPub %>" />
      </td>
      <td>
        <jalios:dataicon data="<%= itPub.getWorkspace() %>" /> 
        <jalios:link data="<%= itPub.getWorkspace() %>" />
      </td>
    </tr>
    </jalios:foreach>
  </tbody>
</table>
<% } %>