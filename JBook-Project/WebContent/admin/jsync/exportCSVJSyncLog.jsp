<%
  response.setHeader("Content-Disposition", "attachment; filename=jsyncLog.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!checkAccess("admin/operation/jsync")) {
  sendForbidden(request, response);
  return;
}%><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.JSyncManagerHandler"><%
%><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
%><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
formHandler.validate();
formHandler.exportCSVJSyncLog(userLang, out);
%>