<%@page import="com.jalios.jcmsplugin.collaborativespace.CSConstants"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

if ( ! CSManager.getInstance().canAccessCSAnalytics(loggedMember, workspace) ) {
  sendForbidden(request, response);
  return;
}

request.setAttribute("title", glp("ui.work.mn.analytics-report")); 
AnalyticsManager instance = AnalyticsManager.getInstance(); 
jcmsContext.addCSSHeader("css/jalios/ux/jalios-analytics.css");

boolean showWorkspace = false;
if(workspace.isModel()){
  jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.WARN, glp("ui.analytics.workspace-not-applicable")));
  %><%@ include file='/jcore/doMessageBox.jspf' %><%
}else{
  request.setAttribute("jcms.analytics.selected-workspace", workspace); 
  request.setAttribute("jcmsplugin.collaborativespace.portal.fullscreen", Boolean.TRUE);      
  %><div class='jcms-analytics'><%
  jcmsContext.addJavaScript("js/jalios/core/jalios-analytics.js");
  %><%@ include file='/jcore/doMessageBox.jspf' %><%
  %><%@ include file='/admin/analytics/report/doSelectReport.jspf' %><%
  %><%@ include file='/admin/analytics/report/doDisplayReport.jspf' %><%
  %></div><%
}
%>