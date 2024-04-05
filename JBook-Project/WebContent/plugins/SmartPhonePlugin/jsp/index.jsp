<%@page import="com.jalios.jcmsplugin.smartphone.json.SmartPhonePortletMapping"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.json.SmartPhonePortalMapping"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalUtils"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%
%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%  
SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
workspace = getWorkspaceParameter("workspaceId");
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/checkRights.jspf" %><%
%><jalios:include jsp="<%= smartPhoneManager.getHomeJsp(loggedMember) %>"/><%
%><script>var jmobileUrl = "<%= ServletUtil.getBaseUrl(request) %>";</script>