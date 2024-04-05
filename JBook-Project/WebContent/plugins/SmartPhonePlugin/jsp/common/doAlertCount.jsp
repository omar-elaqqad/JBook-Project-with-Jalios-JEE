<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
  request.setAttribute("ContentType", "application/json; charset=UTF-8");
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--
--%><%= SmartPhoneManager.getInstance().getAlertJsonCount(loggedMember) %>