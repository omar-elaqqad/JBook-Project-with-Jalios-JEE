<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>    
<%-- FileDocument --%>
<% if (isLogged && loggedMember.canPublishSome(FileDocument.class)) { %>
<a role="menuitem" class="modal publish-menu-item list-group-item publish-menu-add-filedocument" href="work/docChooserModal.jsp?id=x&amp;redirect=$PREVIEW_URL$&amp;refresh=true"><%= JcmsUtil.getHtmlIcon(FileDocument.class) %> <%= glp("publish-menu.document.upload") %></a>    
<% } %>