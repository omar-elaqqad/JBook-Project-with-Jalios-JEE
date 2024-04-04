<%@page import="com.jalios.jcms.context.JcmsMessage"%>
<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!(checkAccess("admin-ws/reporting/analytics"))) { 
    sendForbidden(request, response);
    return;
  }
  AnalyticsManager instance = AnalyticsManager.getInstance(); 
  jcmsContext.addCSSHeader("css/jalios/ux/jalios-analytics.css");
  jcmsContext.addJavaScript("js/jalios/core/jalios-analytics.js");
  request.setAttribute("boHeaderCSS","jcms-analytics");
%><%@ include file='/work/doWorkHeader.jspf' %><%
boolean showWorkspace = false;
if(workspace.isModel()){
  jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.WARN, glp("ui.analytics.workspace-not-applicable")));
  %><%@ include file='/jcore/doMessageBox.jspf' %><%
}else{
	request.setAttribute("jcms.analytics.selected-workspace", workspace);	
	%><%@ include file='/jcore/doMessageBox.jspf' %><%
	%><%@ include file='/admin/analytics/report/doSelectReport.jspf' %><%
	%><%@ include file='/admin/analytics/report/doDisplayReport.jspf' %><%
}
%><%@ include file='/work/doWorkFooter.jspf' %>