<%@page import="com.jalios.jcms.alert.AlertAppHandler.ReadModeFilter"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%><%
%><%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%>
<%-- ALERT READ STATE --%>
<jalios:appSidebarSection name="status" css="alert-level-filter" title='<%= glp("alert-app.alert.filter-state") %>'>
  <ul class="app-sidebar-menu app-sidebar-menu-formitems read-mode-filters">
    <% for (ReadModeFilter readModeFilter : formHandler.getReadModeFilters()) { %>
    <li class="<%= formHandler.isActive(readModeFilter) ? "active is-checked" : "" %>">
      <jalios:control settings='<%= formHandler.getReadModeSettings(readModeFilter.getFilter(), userLang) %>' />
    </li>
    <% } %>
  </ul>
</jalios:appSidebarSection>