<%@ include file='/jcore/doInitPage.jspf' %><%
	if (!isLogged) {
	  sendForbidden(request, response);
	  return;
	}
%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditPollHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
  <jsp:setProperty name='formHandler' property='id' value='' />
</jsp:useBean>
<% 
if(formHandler.validate()) { 
  request.setAttribute("modal.redirect", formHandler.getPublication().getDisplayUrl(userLocale)); %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal formHandler="<%= formHandler %>" url="plugins/DBPollPlugin/jsp/addPoll.jsp" picture="plugins/DBPollPlugin/images/poll48.png" title="jcmsplugin.dbpoll.lbl.create-poll">

  <%@ include file='/jcore/doWorkspaceField.jspf' %>

  <jalios:field name="title" formHandler="<%= formHandler %>" css="focus">
    <jalios:control />
  </jalios:field>

  <jalios:include jsp="/types/Poll/doEditPoll.jsp" />
</jalios:modal>