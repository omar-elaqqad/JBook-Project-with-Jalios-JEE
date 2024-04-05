<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.portal.CSJPortalActionsHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%><jsp:setProperty name='formHandler' property='*' /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

if (formHandler.validate()) { %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal url="plugins/CollaborativeSpacePlugin/jsp/portal/doCollaborativeSpaceJPortalModelModal.jsp" 
						  formHandler="<%= formHandler %>"
						  title="jcmsplugin.collaborativespace.jportal.edit-modal.title">
	
	<%= glp("jcmsplugin.collaborativespace.jportal.edit-modal.message") %>
  
  
	<jalios:buffer name='MODAL_BUTTONS'>
	  <a class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></a>
	  <% if(formHandler.showDesynchroniseModelButton()){ %>
		  <button data-jalios-action="ajax-refresh" type="submit" name="opDesynchronize" value="true" class="btn btn-default">
		  	<%= glp("jcmsplugin.collaborativespace.jportal.edit-modal.desynchronize-model.label") %>
		  </button>
	  <% } %>
		<% if(formHandler.showModelEditButton()){ %>
		  <a class="btn btn-primary" href="<%= formHandler.getModelEditUrl() %>"><%= glp("jcmsplugin.collaborativespace.jportal.edit-modal.edit-model.label") %></a>
		<% } %>
	</jalios:buffer>

	<input type="hidden" name="collaborativeSpaceId" value="<%= formHandler.getCollaborativeSpace().getId() %>" />
</jalios:modal>