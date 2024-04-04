<%@page import="com.jalios.jcms.alert.AlertAppHandler.SendModeFilter"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%>

<%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%>

<%-- TYPE: SENT / RECEIVED --%>
<div class="app-sidebar-section">
  <div class="app-sidebar-section-title"><%= glp("alert-app.reco.filter-send-mode") %></div>
  <ul class="app-sidebar-menu app-sidebar-menu-formitems send-mode-filters">
    <% for (SendModeFilter sendModeFilter : formHandler.getSendModeFilters()) { %>
    <li class="<%= formHandler.isActive(sendModeFilter) ? "active is-checked" : "" %>">
      <jalios:control settings='<%= formHandler.getRecoSendModeSettings(sendModeFilter.getFilter(), userLang) %>' />
    </li>
    <% } %>
  </ul>
</div>

<%-- ALERT LEVEL --%>
<jalios:include jsp="/jcore/alert/app/alerts/doSidebarLevelFilter.jsp" />

<jalios:appSidebarSection name="filter" css="alert-filter" title='ui.app.sidebar-section.filters'>
  
  <% if (formHandler.isReceivedSendMode()) { %>
    <%-- AUTHOR --%>
    <jalios:include jsp="/jcore/alert/app/alerts/doSidebarAuthorFilter.jsp" />
  <% } else if (formHandler.isSentSendMode()) { %>
    <%-- RECIPIENT --%>
    <jalios:include jsp="jcore/alert/app/recommendations/doSidebarRecipientFilter.jsp" />
  <% } %>
  
  <%-- ALERT DATES --%>
  <jalios:include jsp="/jcore/alert/app/alerts/doSidebarDateFilter.jsp" />
  
  <%-- ALERT WORKSPACE --%>
  <jalios:include jsp="/jcore/alert/app/alerts/doSidebarWorkspaceFilter.jsp" />
</jalios:appSidebarSection>