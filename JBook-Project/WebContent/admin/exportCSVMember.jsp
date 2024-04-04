<%@page import="com.jalios.jcms.handler.MemberListHandler"%><%
%><%@page import="com.jalios.jcms.handler.MemberQueryHandler"%><%
String csvFilename = MemberListHandler.getExportCsvFilename("members");
response.setHeader("Content-Disposition", "attachment; filename=" + csvFilename);
// inform doInitPage to set the proper content type
request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

Workspace ws = getWorkspaceParameter("wsid");
Group grp = getGroupParameter("gid");
Workspace groupWS = grp != null ? grp.getWorkspace() : null;

final boolean authorized = loggedMember.canExportMembers(ws, grp);
if (!authorized) {
  sendForbidden(request, response);
  return;
}

final Set memberSet;
if (hasParameter("caddy")) {
  memberSet = new TreeSet(Caddy.getCaddy(request).getMemberList());
} else {
  %><jsp:useBean id="memberQueryHandler" scope="page" class="com.jalios.jcms.handler.MemberQueryHandler"><%
    %><jsp:setProperty name="memberQueryHandler" property="request" value="<%= request %>"/><%
    %><jsp:setProperty name="memberQueryHandler" property="*" /><%
  %></jsp:useBean><%
  if (ws != null) {
    memberQueryHandler.setWorkspace(ws);
  }
  if (grp != null) {
    memberQueryHandler.setGid(grp.getId());
  }
  memberSet = memberQueryHandler.getResultSet();
}
 
JcmsUtil.exportCSV(memberSet, userLang, out);
%>
