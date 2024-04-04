<%--
  @Summary: Generic Editor
  @Category: Admin / Data
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

String id = getDataIdParameter("id");
Data data = channel.getData(id);
if (data != null) {
  String queryString = ServletUtil.getQueryString(request, false);
  String target = ResourceHelper.getSpecificEdit(data);
  target = (target != null) ? target + "?" + queryString : null; 
  if (target != null) {
    sendRedirect(target, request, response);
    return;
  }
}

if (!isAdmin) {
  sendRedirect("index.jsp");
} else {
  if (data != null) {
    setWarningMsg("There is no editor for the data bound to ID '" + id + "' (class=" + data.getClass().getName() +").", request);
  } else {
    setWarningMsg("There is no data bound to ID '" + id + "'.", request);
  }

%>
<%@ include file='/work/doWorkHeader.jspf' %>
<p>&nbsp;</p>
<%@ include file='/jcore/doMessageBox.jspf' %>
<p>&nbsp;</p>
<%@ include file='/work/doWorkFooter.jspf' %>
<% } %>
