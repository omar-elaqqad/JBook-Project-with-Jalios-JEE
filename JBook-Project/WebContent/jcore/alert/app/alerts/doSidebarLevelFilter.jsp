<%@page import="com.jalios.jcms.alert.AlertAppHandler.AlertLevelFilter"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%>

<%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%>

<%-- ALERT LEVEL --%>
<jalios:appSidebarSection name="level" css="alert-level-filter" title='<%= glp("alert-app.filter-level") %>'>
  <ul class="app-sidebar-menu app-sidebar-menu-formitems alert-level-filters">
    <% for (AlertLevelFilter alertLevelFilter : formHandler.getLevelFilters()) { %>
    <%
    boolean isLevelActive = formHandler.isActive(alertLevelFilter);
    String classes = isLevelActive ? "active is-checked" : "";
    // Add a level class to use the associated background
    if (isLevelActive) {
      String levelKey = alertLevelFilter.getFilter().getKey();
      classes += " alert-level-" + levelKey;
    }
    %>
    <li class="<%= classes %>">
      <jalios:control settings='<%= formHandler.getAlertLevelSettings(alertLevelFilter.getFilter(), userLang) %>' />
    </li>
    <% } %>
  </ul>
</jalios:appSidebarSection>

