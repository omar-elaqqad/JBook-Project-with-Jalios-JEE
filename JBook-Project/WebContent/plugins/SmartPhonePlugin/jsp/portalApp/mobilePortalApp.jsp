<%@ include file='/jcore/doInitPage.jspf' %>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%
jcmsContext.setPageTitle(glp("jcmsplugin.smartphone.portal.administration.mobile-portals"));
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ include file="/jcore/doHeader.jspf" %>

<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalAppHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<%
formHandler.validate();
jcmsContext.addCSSHeader("plugins/SmartPhonePlugin/css/portalApp/portal-app.css");
request.setAttribute("mobileAppHandler", formHandler);
%>
<div class="ajax-refresh-div app-mobile-portals app" data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalApp/mobilePortalApp.jsp">
  <%-- SIDEBAR --%>
	<div class="app-sidebar">
	  <div class="app-sidebar-icon">
	    <a href="plugins/SmartPhonePlugin/jsp/portalApp/mobilePortalApp.jsp" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.smartphone.portal.administration.return-to-home")) %>">
	      <jalios:icon src="jcmsplugin-smartphone-app-mobile-portals" />
	    </a>
	  </div>
	         
	  <div class="app-sidebar-section app-sidebar-section-admin">	    
	    <ul class="app-sidebar-menu">
	    	<%-- Main Portals mobile page --%>
	      <li class='app-mobile-page-portals <%= formHandler.isPageActive("main")?"active is-checked":""%>'>
	        <a href="plugins/SmartPhonePlugin/jsp/portalApp/mobilePortalApp.jsp?adminPage=main" 
	        	data-jalios-action="ajax-refresh" ><%= glp("jcmsplugin.smartphone.portal.administration.mobile-portals") %></a>
	      </li>
        <%-- Default organization portals edition --%>
        <% if (formHandler.canAccessAdministration()) { %>
	        <li class='app-mobile-page-settings <%= formHandler.isPageActive("settings")?"active  is-checked":""%>'>
	          <a href="plugins/SmartPhonePlugin/jsp/portalApp/mobilePortalApp.jsp?adminPage=settings" 
	            data-jalios-action="ajax-refresh" ><%= glp("jcmsplugin.smartphone.portal.administration.settings") %></a>
	        </li>	      
  	      <%-- Default organization portals edition --%>
  	      <li class='app-mobile-page-default-portals <%= formHandler.isPageActive("defaultPortals")?"active  is-checked":""%>'>
  	        <a href="plugins/SmartPhonePlugin/jsp/portalApp/mobilePortalApp.jsp?adminPage=defaultPortals" 
  	        	data-jalios-action="ajax-refresh" ><%= glp("jcmsplugin.smartphone.portal.administration.default-portals") %></a>
  	      </li>
        <% } %>
	    </ul> 
	  </div>
    <% if (isLogged && loggedMember.canPublishSome(SmartPhonePortal.class)) { %>
  	  <div class="app-sidebar-section">
  	    <a class="btn btn-default app-sidebar-button modal btn-add-portal" href="plugins/SmartPhonePlugin/jsp/portalApp/createMobilePortalModal.jsp">
          <jalios:icon src="add" />
          <%= glp("jcmsplugin.smartphone.portal.administration.create-portal") %>
        </a>
  	  </div>
    <% } %>
  </div><%-- EO SIDEBAR --%>
	
	<%-- MAIN --%>
	<div class="app-main">
	   <jalios:include jsp="<%= formHandler.getAdminPageJsp() %>" />
	</div>
</div>
<%@ include file='/jcore/doFooter.jspf' %>