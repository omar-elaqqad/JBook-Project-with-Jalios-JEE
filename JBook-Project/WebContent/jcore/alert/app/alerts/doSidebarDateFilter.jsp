<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%>
<%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%>
<%-- FILTER BY START/END DATE --%>
<jalios:field resource="field-light" css="app-sidebar-field">
  <jalios:control settings='<%= formHandler.getAlertStartSettings() %>' />
</jalios:field>
<jalios:field resource="field-light" css="app-sidebar-field">
  <jalios:control settings='<%= formHandler.getAlertEndSettings() %>' />
</jalios:field>
