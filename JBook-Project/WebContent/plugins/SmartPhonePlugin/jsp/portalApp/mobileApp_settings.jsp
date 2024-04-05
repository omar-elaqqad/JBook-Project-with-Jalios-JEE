<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalAppHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<%
SmartPhonePortalAppHandler formHandler = (SmartPhonePortalAppHandler) request.getAttribute("mobileAppHandler");

if (!formHandler.canAccessAdministration()) {
  sendForbidden(request, response);
  return;
}
%>
<div class="app-header has-title app-header-default">
  <h1><%= glp("jcmsplugin.smartphone.portal.administration.settings") %></h1>
</div>
<div class="app-body">
  <form method="POST" class="form-horizontal clearfix">
    <%@ include file='/jcore/doMessageBox.jspf' %>
	  <jalios:field name="jmobileTopbarColor" label="jcmsplugin.smartphone.portal.administration.topbar-color" value="<%= formHandler.getJmobileTopbarColor() %>">
	    <jalios:control type="<%= ControlType.COLOR %>" />
	  </jalios:field>
    <jalios:field name="jmobileTopbarFontColor" label="jcmsplugin.smartphone.portal.administration.topbar-font-color" value="<%= formHandler.getJmobileTopbarFontColor() %>">
      <jalios:control type="<%= ControlType.COLOR %>" />
    </jalios:field>	  
	  <jalios:field name="jmobileTopbarLogo" label="jcmsplugin.smartphone.portal.administration.topbar-logo" value="<%= formHandler.getJmobileTopbarLogo() %>">
	    <jalios:control type="<%= ControlType.MEDIAPATH %>" />
	  </jalios:field>
	  <jalios:field>
	    <button type="submit" name="opUpdateSettings" value="true" class="btn btn-primary"><%= glp("ui.com.btn.save") %></button>
	  </jalios:field>
	  <input type="hidden" name="adminPage" value="settings" />
	</form>
</div>
<%@ include file='/jcore/doAjaxFooter.jspf' %>