<%@page import="com.jalios.jcms.alert.*"%><%
%><%@page import="com.jalios.jcms.alert.Alert.*"%><%
%><%@page import="com.jalios.jcms.alert.AlertAppHandler.*"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%><%
%><%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%><%

Collection<AlertAppHandler.UITab> uiTabs = formHandler.getTabs();
%>

<jalios:appSidebarSection name="views" title="ui.app.sidebar-section.views">
  <ul class="app-sidebar-menu">
  <% for (UITab uiTab : uiTabs) { %>
    <li class="js-alert-tab<%= formHandler.isActive(uiTab) ? " active is-checked" : "" %>" onclick="return false;">
      <a href="<%= uiTab.getNavigationUrl() %>"><%
        %><%= uiTab.getLabel(userLang) %>
      </a>
      <jalios:control settings='<%= formHandler.getUITabSettings(uiTab) %>' />
    </li>
  <% } %>
  </ul>
</jalios:appSidebarSection>