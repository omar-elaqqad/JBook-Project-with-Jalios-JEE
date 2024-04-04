<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.alert.*"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/alert/app/doInitAlertApp.jspf" %><%

boolean showResultList = formHandler.showResultList();
boolean hasResults = formHandler.hasResults();
boolean showReverseLinks = showResultList && hasResults && formHandler.getAlertsPageResult().getTotalSize() > 1;
boolean showAlertRulesEditor = formHandler.showAlertRulesEditor();
boolean showMarkAllAsRead = formHandler.showMarkAllAsRead();
boolean showNavbar = showMarkAllAsRead || showReverseLinks;
%>

<div class="app-cards-horizontal-wrapper">
<% if (showNavbar) {%>
<div class="app-alerts-header app-alerts-navbar navbar navbar-default">
  <%@ include file="/jcore/alert/app/alerts/doAlertsNavbar_sort.jspf" %>

  <% if (showMarkAllAsRead) { %>
  <ul class="nav navbar-nav">
    <jalios:dropdown triggerCss="dropdown-toggle ctx-caret" wrapperTag="li" triggerIcon="actions" triggerLabel="ui.com.lbl.actions">
	    <li><a class="js-alert-mark-all-as-read" role="button" tabindex="0"><%= glp("alert.list.btn.mark-all-as-read") %></a></li>
    </jalios:dropdown>
  </ul>
  <% } %>
</div>
<% } %>

<% if (showAlertRulesEditor) { %>
  <%-- ALERT RULE EDITOR --%>
  <jalios:include jsp='jcore/alert/app/alerts/customize.jsp' />

<% } else { %>
  <%-- DEFAULT: ALERT RESULTS --%>
  <%@ include file="/jcore/alert/app/alerts/doAlertsPageResult.jspf" %>
<% } %>
</div>