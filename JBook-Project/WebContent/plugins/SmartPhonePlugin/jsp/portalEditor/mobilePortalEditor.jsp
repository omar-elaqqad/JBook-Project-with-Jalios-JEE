<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/doEmptyHeader.jspf'%><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

if (!loggedMember.canWorkOn(formHandler.getSmartPhonePortal())) {
  sendForbidden(request, response);
  return;
}

jcmsContext.setPageTitle(glp("jcmsplugin.smartphone.portal.administration.portal-edition", formHandler.getSmartPhonePortal().getTitle()));
SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
formHandler.addFrontEndDependencies();
%>
<div class="portal-overlay is-active is-first-load">
	<div class="portal-loading">
	  <div class="portal-loading-item portal-loading-item-1"></div>
	  <div class="portal-loading-item portal-loading-item-2"></div>
	  <div class="portal-loading-item portal-loading-item-3"></div>
	  <div class="portal-loading-item portal-loading-item-4"></div>
	</div>
</div>

<div class="mobile-portal-edition hide" 
		 data-jalios-ui="<%= encodeForHTMLAttribute(formHandler.getSmartphonePortalMappingUI()) %>"
		 data-jalios-portal-id="<%= formHandler.getSmartphonePortalId()%>">
  
  <%-- TOPBAR --%>
  <div class="edition-topbar">
		<div class="topbar-navigation">
	    <div class="mobile-portal-name"><%= formHandler.getPortal().getTitle(userLang) %></div><%--TODO GLP --%>
	  </div>
		<form method="POST" class="edition-topbar-right">
			<a href="#" class="btn btn-default portal-topbar-item portal-last-save-date <%= Util.isEmpty(formHandler.getLastStructureCDate())?"hide":""%>" data-toggle="tooltip" 
			            data-smartphone-portal-action="display-history"
									data-placement="bottom" title="" 
									data-original-title="Access old version of this portal. You will also be able to restore an old version.">
			  <jalios:date format='<%= glp("date-time-format") %>' date="<%= formHandler.getLastStructureCDate() %>"/>
		  </a>
			
			<a class="btn btn-default portal-topbar-item jportal-duplicate-link modal" href="plugins/SmartPhonePlugin/jsp/portalEditor/doSmartphonePortalDuplicateModal.jsp?id=<%=formHandler.getPortal().getId() %>">
				<%= glp("jcmsplugin.smartphone.portal.lbl.duplicate") %>
			</a>    
			<a href="plugins/SmartPhonePlugin/jsp/portalEditor/doSmartphonePortalPublishModal.jsp?id=<%= formHandler.getPortal().getId() %>" data-toggle="tooltip" data-placement="bottom" title="" class="portal-topbar-item btn btn-primary btn-jportal-publish modal" data-original-title="Publish this portal, it will then be visible to all users.">
				<%= glp("jcmsplugin.smartphone.portal.lbl.publish") %>
			</a>
			<a href="jcms/c_5797/en/cdc-demo" data-toggle="tooltip" data-placement="bottom" title="" class="btn btn-default portal-topbar-item jportal-close-link" data-original-title="Exit edition.">X</a>
    </form>
  </div>
  
  <%-- SIDEBAR --%>
  <jalios:include jsp="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doEditSmartPhonePortalSidebarWrapper.jsp" />
  
  
  <%-- BODY --%>
  <div class="edition-body">
  	<%-- Edition --%>
    <div class="edition-blocks edition-preview">
    	<div class="edition-blocks-title">
    		<%= glp("jcmsplugin.smartphone.portal.lbl.assembly-zone") %>
    	</div>
      <div class="edition-blocks-header">
      	<jalios:icon src='<%= SmartPhoneManager.getInstance().getTopbarLogo() %>' css="topbar-logo" />
      </div>
      <div class="edition-blocks-body">
      
      </div>
    </div>
    
    <%-- Preview --%>
    <div class="edition-real-wrapper">
    	<div class="edition-blocks-title"><%= glp("jcmsplugin.smartphone.portal.lbl.final-output") %></div>
	    <div class="edition-real edition-preview">
	      <iframe id="smartphone-portal-preview" frameBorder="0" 
	      	      src="plugins/SmartPhonePlugin/jsp/portalEditor/previewPortal.jsp?previewPortal=<%= formHandler.getSmartphonePortalId() %>"></iframe>
	    </div>
    </div>
  </div>
</div>

<style>
   HTML .edition-blocks-header {
     background-color: <%= smartPhoneManager.getTopbarColor() %>!important;
   }
   
   HTML .edition-blocks-header {
     color: <%= smartPhoneManager.getTopbarFontColor() %>!important;
   }   
   
  HTML .edition-blocks-header SVG.topbar-logo,
  HTML .edition-blocks-header SVG.topbar-logo PATH
  {
    fill: <%= smartPhoneManager.getTopbarFontColor() %>;
  }
   
</style>
<script id="empty-block-portlet-template" type="text/x-handlebars-template">
<div class="empty-portlet-block">
  <div class="portlet-header">
    <div class="portlet-header-title">
      <span class="block-title">{{typeName}}</span>
    </div>
    <div title="<%= glp("jportal.edition.action.delete.title") %>" data-jalios-confirm-text="<%= glp("jportal.edition.remove-block-confirm-text") %>" 
			 class="js-portlet-delete portlet-menu"><jalios:icon src="jportal-jblock-menu-delete" />
	  </div>
  </div>
</div>
</script>

<script id="block-portlet-template" type="text/x-handlebars-template">
<div class="portlet-block">
  <div class="portlet-header">
    <div class="portlet-header-title">
      <span title="<%= glp("jportal.edition.action.move.title") %>"  class="js-handle icomoon-move"></span> <span class="block-title">{{name}}</span>
    </div>
    <a class="portlet-edit portlet-menu" data-jalios-jmobile-portal-action="editPortlet" data-jalios-data-id="{{portlet-id}}"
        title="<%= glp("jportal.edition.action.edit.title") %>">
          <jalios:icon src="jportal-jblock-menu-edit" />
    </a>
    <a title="<%= glp("jportal.edition.action.delete.title") %>" data-jalios-confirm-text="Supprimer cette portlet?" class="js-portlet-delete portlet-menu"><jalios:icon src="jportal-jblock-menu-delete" /><a>
  </div>

  <div class="portlet-inner">
    <img src="{{image}}" alt="" />
  </div>
</div>
</script>

<%@ include file='/jcore/doEmptyFooter.jspf'%>