<%
request.setAttribute("ContentType", "application/json; charset=UTF-8");
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.AlertHandler'><%
%><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
%><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
if (formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
}
%><%= formHandler.getAlertStatusResponse() %>