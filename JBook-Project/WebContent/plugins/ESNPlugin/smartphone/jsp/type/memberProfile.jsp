<%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%-- 
--%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
Publication memberProfile = getPublicationParameter("id");
sendRedirect("plugins/SmartPhonePlugin/jsp/core/member.jsp?id=" + memberProfile.getAuthor().getId());
%>