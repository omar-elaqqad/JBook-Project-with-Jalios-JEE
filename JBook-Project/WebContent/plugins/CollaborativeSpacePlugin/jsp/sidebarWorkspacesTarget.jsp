<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

String hubAppURL = channel.getProperty("shortcut.jcmsplugin.collaborativespace-hub.link", "plugins/CollaborativeSpacePlugin/jsp/hub/hubApp.jsp");
%>
<div class="list-group">
  <a class="btn btn-default btn-block" href="<%= hubAppURL %>"><%= glp("jcmsplugin.collaborativespace.hub") %></a>
</div>