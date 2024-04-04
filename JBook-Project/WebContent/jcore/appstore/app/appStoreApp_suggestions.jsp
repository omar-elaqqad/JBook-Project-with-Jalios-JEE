<%@page import="com.jalios.jcms.application.json.Application"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncherTab"%>
<%@page import="com.jalios.jcms.shortcut.AbstractShortcut"%>
<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %><%
ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {%>
  <jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<% }
formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {
  return;
}

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

if (!formHandler.displaySuggestions()) {
  return;
}

%>
<div class="card-appstore-layout">
  <h2><%= glp("appstore.section.suggestions") %></h2>
  <% for (Application app : formHandler.getSuggestions()) { %>
		<% request.setAttribute("appstore.application", app); %>
    <jalios:include jsp="jcore/appstore/app/appStoreApp_applicationCard.jsp" />
  <% } %>
</div>