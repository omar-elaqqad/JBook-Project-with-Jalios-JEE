<%@ page contentType="text/html; charset=UTF-8" %><%-- 
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ include file='/front/doFullDisplay.jspf' %><%--
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--
--%><%
  MemberJob job = (MemberJob)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  sendRedirect(ESNManager.getInstance().getMemberProfile(job.getAuthor(),true).getDisplayUrl(userLocale)+"?esnProfileTab=resume");
%>
