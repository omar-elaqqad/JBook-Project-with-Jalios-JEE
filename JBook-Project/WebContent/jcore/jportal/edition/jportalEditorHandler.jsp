<%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
</jsp:useBean><%

request.setAttribute("jportalEditorHandler", formHandler);
%>