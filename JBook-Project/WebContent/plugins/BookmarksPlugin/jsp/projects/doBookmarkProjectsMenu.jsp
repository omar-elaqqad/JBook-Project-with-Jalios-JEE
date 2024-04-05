<%@page import="com.jalios.jcmsplugin.jtask.project.ProjectQueryBuilder"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/doHeader.jspf" %>

<li>
  <a href="plugins/BookmarksPlugin/jsp/projects/doBookmarkProjectsList.jsp">
    <jalios:icon src="icon.jcmsplugin.bookmarks.app.project.favorites-projects" css="app-list-icon-prefix" />
    <%= glp("jcmsplugin.bookmarks.app.project.sidebar.favorite-projects.label") %>
  </a>
</li>

<%@ include file='/jcore/doFooter.jspf' %>