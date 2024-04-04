<%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
JPortal jportal = getDataParameter("jportal", JPortal.class);
if (!jportal.canBeReadBy(loggedMember)) {
  sendForbidden(request, response);
  return;
}
%><%= JPortalUtils.getJPortalCss(jportal, false) %>