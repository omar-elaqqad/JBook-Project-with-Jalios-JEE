<%@page import="com.jalios.jcms.db.DBEventLogManager"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<%
HibernateUtil.commitTransaction(); // NOTE:OD: processNewDBEventLogs() handle the transaction
DBEventLogManager.getInstance().processNewDBEventLogs(getStringParameter("sender", null, "[0-9a-z_A-Z]+"));
%>
