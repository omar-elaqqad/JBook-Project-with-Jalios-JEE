<%@ include file='/jcore/doInitPage.jspf' %><% 

  if (!checkAccess("admin-ws/reporting/data-report")) {
    sendForbidden(request, response);
    return;
  }

  Workspace itWorkspace = workspace;
  request.setAttribute("zone","WorkArea");
%><%@ include file='/admin/doDataReportDocument.jspf' %>
<%@ include file="/jcore/doEmptyFooter.jspf" %>