<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>    
<% if (isLogged && loggedMember.canPublishSome(FileDocument.class)) { %>
<a role="menuitem" class="modal publish-menu-item list-group-item publish-menu-add-remotedocument" href="work/remotedoc/editRemoteDocument.jsp?id=x&amp;redirect=$PREVIEW_URL$&amp;refresh=true"><jalios:icon css="topbar-icon" title="" src="remote-document" /> <%= glp("publish-menu.document.remote") %></a>    
<% } %>