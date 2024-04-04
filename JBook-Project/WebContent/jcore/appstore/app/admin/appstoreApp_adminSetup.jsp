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
  <jalios:field name="applicationRootCategory" resource="field-vertical" label="appstore.sidebar.admin.root-category" value="<%= formHandler.getAvailableapplicationRootCategory() %>">
    <jalios:control type="<%= ControlType.CATEGORY %>" />
  </jalios:field>
  <input type="hidden" name="adminPage" value="setup" />
  <jalios:field resource="field-vertical">
    <button type="submit"  data-jalios-action="ajax-refresh" class="btn btn-primary" name="opSetup" value="true"><%= glp("appstore.sidebar.admin.update-root-category") %></button>
  </jalios:field>
  <jalios:field resource="field-vertical"  label="appstore.sidebar.admin.modify-category">
  <% if (manager.getTypeRoot() != null) { %>
    <jalios:treecatview dragdrop="true" showCtxMenu="true" collection="<%= manager.getTypeRoot().getChildrenSet() %>"/>
  <% } %>
  </jalios:field>
</div>