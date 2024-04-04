<%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}

if (Util.notEmpty(request.getAttribute("formHandler"))) {
  return;
}

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalAddPorletHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%
request.setAttribute("formHandler", formHandler);
%>