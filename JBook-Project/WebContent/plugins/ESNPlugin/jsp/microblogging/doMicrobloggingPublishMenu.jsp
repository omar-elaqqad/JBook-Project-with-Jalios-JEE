<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %><% 
Workspace microBloggingWorkspace = MicroBloggingManager.getInstance().getPublishingMicroBloggingWorkspace(true, workspace, loggedMember);
%>
<% if (isLogged && microBloggingWorkspace != null) { %>
  <a class="list-group-item publish-menu-item modal publish-menu-add-microblogging"  onclick="return false;" href="plugins/ESNPlugin/jsp/form/editStatus.jsp?mid=<%= loggedMember.getId() %>&amp;id=x">
    <jalios:icon src="jcmsplugin-esn-status" />
    <%= glp("jcmsplugin.esn.publish-menu.microblogging") %>
  </a>
<% } %>