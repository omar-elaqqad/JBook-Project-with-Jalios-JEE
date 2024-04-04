<%@page import="com.jalios.jcms.application.json.ApplicationLauncherTab"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncher"%>
<%@page import="com.jalios.jcms.application.ApplicationManager"%>
<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %><%
%>
<%
ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {%>
  <jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<% }

if (formHandler == null) {
  return;
}


if (!formHandler.canAccessAdminPage()) {
  sendForbidden(request, response);
  return;
}

ApplicationManager manager = ApplicationManager.getInstance();

%>
<div class="appstore-admin-section">
  <jalios:include jsp="jcore/appstore/app/appStoreAppDefaultSetup.jsp" />
  <div>
  	<%  if(manager.isResetApplicationLauncherRunning()){ %>
   		<jalios:message msg="appstore.admin.reset-launcher.running" level="<%= MessageLevel.INFO %>"></jalios:message>
    <% }else{ %>
   	  <a class="btn btn-default modal" href="jcore/appstore/app/modal/resetLauncherModal.jsp"><%= glp("appstore.admin.reset-launcher") %></a> 
    <% } %>
  </div>
</div>