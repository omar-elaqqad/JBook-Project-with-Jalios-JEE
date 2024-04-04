<%@ include file='/jcore/doInitPage.jspf' %><% 

if (!checkAccess("admin/reporting/data-report")) {
  sendForbidden(request, response);
  return;
}
  Workspace itWorkspace = channel.getWorkspace(getDataIdParameter("requestedWS"));
  request.setAttribute("zone","AdminArea");
%><%@ include file='/admin/doDataReportDocument.jspf' %>
<%@ include file="/jcore/doEmptyFooter.jspf" %>