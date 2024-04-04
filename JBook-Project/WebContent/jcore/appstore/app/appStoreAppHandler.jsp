<%@ include file="/jcore/doInitPage.jspf" %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.application.ApplicationAppHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%
	if(!isLogged) {
	  sendForbidden(request, response);
	  return;
	}
  request.setAttribute("appStoreAppHandler", formHandler);
  formHandler.validate();
%>