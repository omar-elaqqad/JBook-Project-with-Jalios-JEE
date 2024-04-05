<%@page import="com.jalios.jcmsplugin.esn.*"%><%
%><%@page import="com.jalios.jcmsplugin.esn.activity.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doActivity.jsp: start render"); }
boolean show = esnProfileDisplayHandler.validateActivity();
if (!show) {
  if (logger.isTraceEnabled()) { logger.trace("doActivity.jsp: nothing to render"); }
  return;
}
jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css");
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/activity.css");
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/activity/activity-cards.css");
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/member-profile-activity.css");
jcmsContext.addJavaScript("plugins/ESNPlugin/js/activity.js");
%><div class="profile-activity profile-body-block member-activity-cards"><%
  %><div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3"><%
    %><%= glp("jcmsplugin.esn.lbl.activity") %><%
  %></div><%
  %><jalios:include jsp="plugins/ESNPlugin/types/MemberProfile/doActivityInner.jsp"/><%
%></div><%
if (logger.isTraceEnabled()) { logger.trace("doActivity.jsp: end render"); }
%>