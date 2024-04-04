<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>    
<% if (isLogged && loggedMember.canPublish(JPortal.class)) { %>
	<a role="menuitem" class="modal publish-menu-item list-group-item publish-menu-item-jportal" href="jcore/jportal/doJPortalCreateModal.jsp"><jalios:icon src="types.JPortal.icon" /> <%= glp("jportal.create-modal.entry") %></a>    
<% } %>