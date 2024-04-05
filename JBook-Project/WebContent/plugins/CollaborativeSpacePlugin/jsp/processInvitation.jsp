<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.ProcessInvitationHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%></jsp:useBean><%--
--%>
<% formHandler.validate(); %>
