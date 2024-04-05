<%
  response.setHeader("Content-Disposition", "attachment; filename=members.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%-- 
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%

if (!com.jalios.jcmsplugin.esn.ESNManager.getInstance().canAccessExpertDirectoryCSVExport(loggedMember)) {
  sendForbidden(request, response);
  return;
}

%><%@ include file='/plugins/ESNPlugin/jsp/doExpertDirectoryQuery.jspf' %><%-- 
--%><%
esnMgr.exportCSV(memberSet, userLang, out);
%>
