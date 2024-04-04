<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%>
<%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%>
<%-- FILTER BY WORKSPACE --%>
<jalios:field resource="field-app">
  <jalios:control settings='<%= formHandler.getAlertWorkspaceSettings() %>' />
</jalios:field>
