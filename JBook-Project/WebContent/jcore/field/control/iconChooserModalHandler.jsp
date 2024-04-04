<%@ include file='/jcore/doInitPage.jspf' %><%
if (Util.notEmpty(request.getAttribute("iconChooserModalHandler"))) {
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.uicomponent.icon.IconChooserModalHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean><%
request.setAttribute("iconChooserModalHandler", formHandler);
%>