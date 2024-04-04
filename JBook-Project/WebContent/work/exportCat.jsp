<%--
  @Summary: Category tree export
  @Category: Work Area / Categories
  @Author: Sylvain DEVAUX
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-10.0.4
--%><%
%><%@page import="com.jalios.jcms.servlet.BinaryFileServlet"%><%
%><%@page import="com.jalios.jcms.servlet.BinaryFileServlet.DownloadTicket"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (loggedMember == null || !loggedMember.canEditCategories()) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.ExportCatListHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name="formHandler" property="exportCatList_opExport" value="true"/>
  <jsp:setProperty name="formHandler" property="exportCatList_rootCatId" value='<%= JcmsUtil.getId(getCategoryParameter("pid")) %>'/>
</jsp:useBean>
<%
formHandler.validate();

BinaryFileServlet.DownloadTicket ticket = formHandler.getDownloadTicket();
if (ticket == null) {
  sendRedirect("index.jsp");
  return;
} else {
  ticket.sendToDownloadUrl(request, response);
}
%>