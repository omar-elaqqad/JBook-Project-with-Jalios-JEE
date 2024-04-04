<%
  response.setHeader("Content-Disposition", "attachment; filename=workspaces.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!(isAdmin || checkAccess("admin/work/workspace"))) {
  sendForbidden(request, response);
  return;
}
final Set workspaceSet;
if (hasParameter("caddy")) {
  workspaceSet = new TreeSet(Caddy.getCaddy(request).getWorkspaceList());
} else {
  %><jsp:useBean id='workspaceQueryHandler' scope='page' class='com.jalios.jcms.workspace.WorkspaceQueryHandler'><%
      %><jsp:setProperty name='workspaceQueryHandler' property='request' value='<%= request %>'/><%
      %><jsp:setProperty name='workspaceQueryHandler' property='response' value='<%= response %>'/><%
      %><jsp:setProperty name='workspaceQueryHandler' property='*' /><%
      %><jsp:setProperty name='workspaceQueryHandler' property='workspaceQuery' value='<%= getUntrustedStringParameter("text","") %>' /><%
    %></jsp:useBean><%
    
  Workspace selectedWorkspace = getWorkspaceParameter(Workspace.PARENT_WORKSPACE_PARAMNAME);
  Set<Workspace> sourceSet;
  if (selectedWorkspace != null) {
    sourceSet = selectedWorkspace.getAllSubWorkspaces(loggedMember);
  } else {
    sourceSet = Workspace.getAllWorkspaceSet(loggedMember);
  }
  String sort = getStringParameter("sort", "name", ".*");
  boolean isReverse = getBooleanParameter("reverse", false);
  Comparator comp = ComparatorManager.getComparator(Workspace.class, sort, isReverse);
  workspaceQueryHandler.setDataSet(sourceSet);
  workspaceSet = workspaceQueryHandler.getResultSet(comp);  
}
JcmsUtil.exportCSV(workspaceSet, userLang, out);
%>