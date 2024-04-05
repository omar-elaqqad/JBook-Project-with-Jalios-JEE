<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalAppHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<%
SmartPhonePortalAppHandler formHandler = (SmartPhonePortalAppHandler) request.getAttribute("mobileAppHandler");
%>
<div class="app-header has-title app-header-default">
  <h1><%= glp("jcmsplugin.smartphone.portal.administration.default-portals") %></h1>
</div>
<%-- BODY --%>
<div class="app-body">
  <form method="POST">
  	<div class="mobile-app-default-department">
  		<div class="mobile-app-department">
			    <jalios:field  label="jcmsplugin.smartphone.portal.administration.default-portal" name='mobileDefaultPortal' value='<%= formHandler.getDefaultSmartPhonePortal() %>' >
					  <jalios:control settings="<%= formHandler.getSmartphonePortalSettings() %>" />
				  </jalios:field>
		  </div>
  	</div>
  	
		<div class="mobile-app-departments">
				<jalios:foreach name="department" type="com.jalios.jcms.Group" collection="<%= formHandler.getDepartments() %>">
					<div class="mobile-app-department">
						<input type="hidden" name="mobileGroupPortals" value="<%= department.getId() %>" />
						<jalios:field  label='<%= department.getName(userLang) %>' name='mobileDepartmentPortals' value='<%= formHandler.getDepartmentPortal(department) %>' >
					    <jalios:control settings="<%= formHandler.getSmartphonePortalSettings() %>" />
				  	</jalios:field>
					</div>
				</jalios:foreach>
				
				<div class="departments-actions">
				  <button type="submit" name="opUpdateDepartments" value="true" class="btn btn-primary"><%= glp("ui.com.btn.save") %></button>
				  <input type="hidden" name="adminPage" value="<%= formHandler.getAdminPage() %>" />
				</div>
		</div>
	</form>
</div>