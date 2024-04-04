<%@page import="com.jalios.jcms.jportal.JPortalStructure"%>
<%@page import="com.jalios.jcms.jportal.JPortalManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/jportal/edition/doInitJPortalEditorComponent.jspf' %>
<% 
JPortal jPortal = (JPortal) jportalEditorHandler.getAvailableJPortal();

if (jPortal == null) {
  jPortal = (JPortal) jcmsContext.getAjaxRequestAttribute("jPortal");
}

if (jPortal == null) {
  return;
} 
String structureId = (String) request.getAttribute("jportal-structureId");
%>

<div class="jportal-topbar">
  <div class="jportal-navigation jportal-topbar-left">
    <a class="jportal-name jportal-navigation-item js-jportal-history-close"><%= jPortal.getTitle(userLang) %></a>
    <div class="jportal-navigation-item"><%= glp("jportal.edition.history.breadcrumb.label") %></div>
  </div>	
	<form method="post" class="jportal-topbar-right jportal-revert-form" action="jcore/jportal/edition/jportalEdition.jsp?jPortal=<%= jPortal.getId() %>">
	  <a class="btn btn-default jportal-history-reset modal" href="jcore/jportal/edition/confirmResetHistoryModal.jsp?jPortal=<%= jPortal.getId() %>" data-toggle="tooltip" data-placement="bottom" title='<%= encodeForHTMLAttribute(glp("jportal.edition.history.reset.tooltip")) %>'>
	    <%= glp("jportal.edition.history.reset.label") %>
	  </a>
    <a class="js-jportal-history-close btn btn-default" href="#">
		  <%= glp("jportal.edition.history.back-edition.label") %>
		</a>
    <a class="btn btn-default js-jportal-version-rename modal" href="jcore/jportal/history/doJPortalHistoryVersionRenameModal.jsp?jportalStructureId=<%=structureId%>">
      <%= glp("jportal.structure.rename-title.label") %>
    </a>
	  <button class="btn btn-primary jportal-history-revert" disabled="disabled">
	    <%= glp("jportal.edition.history.back-to-version.label") %>
	  </button>
	  
	  <input type="hidden" name="structureId" value="" />
	</form>
</div>