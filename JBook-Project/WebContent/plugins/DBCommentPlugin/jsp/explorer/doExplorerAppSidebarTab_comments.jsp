<%@ include file='/jcore/doInitPage.jspf' %><%
Data data = (Data) request.getAttribute("com.jalios.jcmsplugin.explorer.sidebar.currentData");
%>
<div class="tab-content-informations">
  <h3 class="sidebar-tab-title"><%= glp("jcmsplugin.dbcomment.edit.lbl.title") %></h3>
  <% request.setAttribute(PortalManager.PORTAL_PUBLICATION, (Publication) data); %>
  <jalios:include jsp="types/DBComment/doDBCommentFooterDisplay.jsp" />
</div>