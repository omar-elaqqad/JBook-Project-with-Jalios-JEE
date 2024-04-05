<%@ page contentType="text/html; charset=UTF-8" %><%-- 
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ include file='/front/doFullDisplay.jspf' %><%--
--%>
<%
  MemberCategories obj = (MemberCategories)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  sendRedirect(obj.getAuthor().getDisplayUrl(userLocale)+"?esnProfileTab=info");
%>
