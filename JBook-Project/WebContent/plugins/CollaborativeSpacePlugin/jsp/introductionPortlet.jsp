<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.GuestAccountManager"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

CSManager csMgr = CSManager.getInstance();
CollaborativeSpace cs = csMgr.getCollaborativeSpace(workspace);
if (cs == null) {
  // CSP-691: workspace is not the CS workspace using SmartphonePlugin
  Workspace smarphoneWorkspace = getWorkspaceParameter("workspaceId");
  cs = csMgr.getCollaborativeSpace(smarphoneWorkspace);
}
if (cs == null) {
  return;
}
if (!csMgr.showIntroduction(cs, loggedMember) && !isWSAdmin) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}
boolean canEdit = isWSAdmin && !workspace.isClosed() && channel.isDataWriteEnabled();
%>
<div class="cs-introduction">
  <div class="introduction-content">
    <% request.setAttribute("collaborative-space", cs); %>
    <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/doIntroContent.jspf' %>
    <% request.removeAttribute("collaborative-space"); %>
  </div>

  <% if (canEdit) { %>
    <div class="item-box-footer">
      <jalios:link data='<%= portalCategory %>' params='<%= "jsp=plugins/CollaborativeSpacePlugin/jsp/settings.jsp" %>'><jalios:icon src="edit" />
      <%= glp("jcmsplugin.collaborativespace.introduction.edit") %></jalios:link>
    </div>
  <% } %>
</div>