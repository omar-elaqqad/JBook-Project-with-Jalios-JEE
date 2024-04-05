<%@ page contentType="text/html; charset=UTF-8" %><%--  
--%><%@ include file='/jcore/doInitPage.jspf' %><%--  
--%><%@ page import="com.jalios.jcmsplugin.dbpoll.*"  %><%--  
--%><% if (isLogged && loggedMember.canPublishSome(Poll.class)){ %>
<button class="list-group-item publish-menu-item publish-menu-add-poll" type="button" data-jalios-action="modal" data-jalios-modal-url="plugins/DBPollPlugin/jsp/addPoll.jsp">
	<jalios:dataicon class="<%= Poll.class %>" title="" />
  <%= glp("jcmsplugin.dbpoll.publish-menu.add-poll") %>
</button>
<% } %>  
  
  