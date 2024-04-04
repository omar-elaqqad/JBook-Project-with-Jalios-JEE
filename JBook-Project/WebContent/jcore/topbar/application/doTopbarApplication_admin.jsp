<%@ include file='/jcore/doInitPage.jspf' %><%
if (!checkAccess(AccessControlConstants.ADMIN_RESOURCE + "/")) {
  return;
}
%>
<a href="admin/admin.jsp" class="topbar-application-item" data-jalios-dataid="admin"><span class="icon-wrapper"><jalios:icon src="topbar-app-admin" /></span><span class="label-wrapper"><%= glp("ui.com.lbl.administration") %></span></a>