<%
  response.setHeader("Content-Disposition", "attachment; filename=members.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%-- 
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%-- 
--%><%

ESNManager esnMgr = ESNManager.getInstance();

Member member = getDataParameter("mid", Member.class);
if (member != loggedMember && !isAdmin) {
  sendForbidden(request, response);
  return;
}

String connectionType = getStringEnumParameter("connectionType", "all", new String[] {"all", "account", "contact"});
boolean showAll     = "all".equals(connectionType);
boolean showAccount = "account".equals(connectionType);
boolean showContact = "contact".equals(connectionType);


Set<Member> connectionSet = null;
if (showAccount) {
  connectionSet = esnMgr.getSortedConnectionSet(member, true, false);
}
else if (showContact) {
  connectionSet = esnMgr.getSortedConnectionSet(member, false, true);
}
else {
  connectionSet = esnMgr.getSortedConnectionSet(member, true, true);
}


esnMgr.exportCSV(connectionSet, userLang, out);
%>
