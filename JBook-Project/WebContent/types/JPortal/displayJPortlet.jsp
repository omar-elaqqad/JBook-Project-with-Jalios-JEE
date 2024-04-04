<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<%
formHandler.processAction();
String portletId = getDataIdParameter("portletId");
request.setAttribute("portletwidget.full-refresh-asked", true);
%>
<jalios:include id="<%= portletId %>" />
<% 
request.removeAttribute("portletwidget.full-refresh-asked"); 
%>
<%@ include file='/jcore/doAjaxFooter.jspf' %>