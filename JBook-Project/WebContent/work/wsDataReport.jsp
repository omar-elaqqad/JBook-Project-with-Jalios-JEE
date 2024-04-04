<%@ include file='/jcore/doInitPage.jspf' %><% 

  if (!checkAccess("admin-ws/reporting/data-report")) {
    sendForbidden(request, response);
    return;
  }

request.setAttribute("title", glp("ui.adm.mn.reporting.data"));  
request.setAttribute("adminReportingMenu", "true");  
%><%@ include file='/work/doWorkHeader.jspf' %><%
if(Util.toBoolean(request.getAttribute("jcms.bo.workspace.isMultipleWorkspace"), false)){
	 setWarningMsg(glp("ui.work.multiple-ws-warning"), request);
	%><%@ include file='/jcore/doMessageBox.jspf' %><%
}
else {
	%><%@ include file='/jcore/doMessageBox.jspf' %><% 
	HashSet wsSet = new HashSet(); 
	wsSet.add(workspace);
%><%@ include file='/admin/doDataReport.jspf' %><%
}
%><%@ include file='/work/doWorkFooter.jspf' %>