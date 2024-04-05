<%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%-- 
--%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
Data data = getDataParameter("id");
sendRedirect(SmartPhoneManager.getInstance().getDataUrl(data));
return;
%>