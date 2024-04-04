<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/jcore/doInitPage.jspf"%><%
%><%@ include file="/jcore/alert/app/doInitAlertApp.jspf"%><%

boolean showAlertRulesEditor = formHandler.showAlertRulesEditor();
%>

<%-- ALERT READ STATE --%>
<jalios:include jsp="/jcore/alert/app/alerts/doSidebarStatusFilter.jsp" />

<%-- ALERT LEVEL --%>
<jalios:include jsp="/jcore/alert/app/alerts/doSidebarLevelFilter.jsp" />

<jalios:appSidebarSection name="filters" css="alert-filter" title='<%= glp("ui.app.sidebar-section.filters") %>'>

<%-- ALERT AUTHOR --%>
<jalios:include jsp="/jcore/alert/app/alerts/doSidebarAuthorFilter.jsp" />

<%-- ALERT DATES --%>
<jalios:include jsp="/jcore/alert/app/alerts/doSidebarDateFilter.jsp" />

<%-- ALERT WORKSPACE --%>
<jalios:include jsp="/jcore/alert/app/alerts/doSidebarWorkspaceFilter.jsp" />

</jalios:appSidebarSection>

<%-- BUTTONS --%>
<jalios:include jsp="/jcore/alert/app/alerts/doSidebarButtons.jsp" />
