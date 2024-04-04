<%@page import="com.jalios.jcms.handler.MemberListHandler"%><%
String csvFilename = MemberListHandler.getExportCsvFilename("dbmembers");
response.setHeader("Content-Disposition", "attachment; filename=" + csvFilename);
// inform doInitPage to set the proper content type
request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!checkAccess("admin/users/dbmember")) {
  sendForbidden(request, response);
  return;
}

final List<String> dbMemberIdSet;
if (hasParameter("caddy")) {
  dbMemberIdSet = Caddy.getCaddy(request).getDBMemberList();
} else {
  %><jsp:useBean id="memberQueryHandler" scope="page" class="com.jalios.jcms.handler.DBMemberQueryHandler"><%
   %><jsp:setProperty name="memberQueryHandler" property="request" value="<%= request %>"/><%
   %><jsp:setProperty name="memberQueryHandler" property="*" /><%
  %></jsp:useBean><%
  dbMemberIdSet = memberQueryHandler.getIdResultList();
} 
 
DBMember.exportCSV(dbMemberIdSet, userLang, out);
%>
