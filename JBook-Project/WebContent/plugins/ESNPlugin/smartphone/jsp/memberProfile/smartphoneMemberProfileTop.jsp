<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%

Member member = getMemberParameter("id");
MemberProfile profile = ESNManager.getInstance().getMemberProfile(member, true);
request.setAttribute("com.jalios.jcmsplugin.smartphone.pub", profile);

%>