 <%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
if(workspace == null || !workspace.isCollaborativeSpace() || request.getAttribute(PortalManager.PORTAL_PORTALELEMENT) == null 
||  !(request.getAttribute(PortalManager.PORTAL_PORTALELEMENT) instanceof CollaborativeSpace)){
  return;
}
%><jsp:useBean id='csHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.portal.CSDisplayHandler'><%--
--%><jsp:setProperty name='csHandler' property='request' value='<%= request %>'/><%--
--%><jsp:setProperty name='csHandler' property='response' value='<%= response %>'/><%--
--%><jsp:setProperty name='csHandler' property='*' /><%--
--%><jsp:setProperty name='csHandler' property='collaborativeSpace' value="<%= (CollaborativeSpace) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT) %>" /><%--
--%></jsp:useBean><%
if(csHandler.showEditJPortalButton()){
  if(csHandler.isJPortalSynchronized()){ //warning modal & then remove the association & create the jportal%>
    <a class="modal admin-menu-item list-group-item portalModeIcon"
     role="button"
     data-jalios-modal-url="plugins/CollaborativeSpacePlugin/jsp/portal/doCollaborativeSpaceJPortalModelModal.jsp?collaborativeSpaceId=<%= csHandler.getCollaborativeSpace().getId()%>">
     <jalios:icon src='portal-editor' /><%= glp("jcmcplugin.collaborativespace.jportal.edit-more.label") %></a>   
	<% } else { %>		
	  <a class="admin-menu-item list-group-item portalModeIcon"
	   href="<%= JPortalUtils.getJPortalEditionUrl(csHandler.getCollaborativeSpace().getJportal())%>">
	   	<jalios:icon src='portal-editor' /> <%= glp("ui.com.alt.portal") %>
	   </a>
  
	<%}%>
<%}%>


