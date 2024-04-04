<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%>
<%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%>
<%-- FILTER BY START/END DATE --%>
<% if (formHandler.showCutomizeAlertRules()) { %>
<jalios:appSidebarSection name="buttons" css="alert-date-buttons">
  <a class="btn btn-default btn-edit-alerts" href="<%= AlertAppHandler.getAppJsp() + "?"+AlertAppHandler.EDIT_ALERT_RULES_PARAM+"=true" %>" data-jalios-action="ajax-refresh" data-jalios-options='{ "params" : { "<%= AlertAppHandler.EDIT_ALERT_RULES_PARAM %>" : true } }'>
    <jalios:icon src="preferences"/>
    <%= glp("alert.list.btn.customize") %>
  </a>
</jalios:appSidebarSection>
<% } %>