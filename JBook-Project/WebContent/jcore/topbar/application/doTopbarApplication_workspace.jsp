<%@ include file='/jcore/doInitPage.jspf' %><%
boolean canAccessWork = (isLogged && (loggedMember.isWorker()) && Util.notEmpty(loggedMember.getWorkspaceSet())) || isAdmin;
if (!canAccessWork) {
  return;
}
%>
<a href="work/pubBrowser.jsp?ws=<%= JcmsUtil.getId(loggedMember.getFavoriteWorkspace(workspace , null)) %>" data-jalios-dataid="workspace" class="topbar-application-item"><span class="icon-wrapper"><jalios:icon src="topbar-app-workspace" /></span><span class="label-wrapper"><%= glp("ui.com.lbl.workspace") %></span></a>
