<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!(checkAccess("admin/reporting/analytics") || checkAccess("admin-ws/reporting/analytics"))) { 
    sendForbidden(request, response);
    return;
  }
  request.setAttribute("title", glp("ui.work.mn.analytics-report")); 
  request.setAttribute("breadcrumbTitle", glp("ui.work.mn.analytics-report")); 
  request.setAttribute("allowWkspFilter", "false");
  // in admin header, which menu and sub menu must be bolded
  request.setAttribute("reportingAdminMenu", "true");
  request.setAttribute("analyticsReportSubAdminMenu", "true");
  AnalyticsManager instance = AnalyticsManager.getInstance(); 
  
  jcmsContext.addCSSHeader("css/jalios/ux/jalios-analytics.css");
  request.setAttribute("boHeaderCSS","jcms-analytics");
  
%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %><%

  jcmsContext.addJavaScript("js/jalios/core/jalios-analytics.js");
  boolean showWorkspace = true;

%><%@ include file='/admin/analytics/report/doSelectReport.jspf' %><%
%><%@ include file='/admin/analytics/report/doDisplayReport.jspf' %><%
%><%@ include file='/admin/doAdminFooter.jspf' %> 