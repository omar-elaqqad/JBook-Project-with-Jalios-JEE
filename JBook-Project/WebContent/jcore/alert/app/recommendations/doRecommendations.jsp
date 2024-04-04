<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.recommendation.Recommendation"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/alert/app/doInitAlertApp.jspf" %><%

boolean showResultList = formHandler.showResultList();
boolean hasResults = formHandler.hasResults();
boolean showReverseLinks = showResultList && hasResults && formHandler.getRecommendationsPageResult().getTotalSize() > 1;
boolean showNavbar = showReverseLinks;
%>
<div class="app-cards-horizontal-wrapper">
  <% if (showNavbar) {%>
  <div class="app-alerts-header app-alerts-navbar navbar navbar-default">
    <%@ include file="/jcore/alert/app/alerts/doAlertsNavbar_sort.jspf" %>
  <% } %>
  </div>

  <%@ include file="/jcore/alert/app/recommendations/doRecommendationsPageResult.jspf" %>
</div>