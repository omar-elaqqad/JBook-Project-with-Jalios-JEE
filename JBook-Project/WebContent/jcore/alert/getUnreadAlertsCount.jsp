<%--
  Prints unread alerts count for current user.
 --%><%@page import="com.jalios.jcms.alert.AlertManager"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}

int totalUnreadAlertCount = AlertManager.getInstance().getUnreadAlertCount(loggedMember);
%><%= totalUnreadAlertCount %>