<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%>
<%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%>
<%-- FILTER BY AUTHOR --%>
<jalios:field resource="field-light" css="app-sidebar-field">
  <jalios:control settings='<%= formHandler.getRecoRecipientSettings() %>' />
</jalios:field>
