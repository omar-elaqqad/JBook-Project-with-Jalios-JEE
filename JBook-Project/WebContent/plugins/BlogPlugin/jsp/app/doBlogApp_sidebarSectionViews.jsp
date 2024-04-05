<%@page import="com.jalios.jcmsplugin.blog.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><jalios:include jsp="plugins/BlogPlugin/types/Blog/doBlogFullDisplay_initHandler.jsp" /><%
BlogPostQueryHandler formHandler = (BlogPostQueryHandler) request.getAttribute("blogFormHandler");
if (formHandler == null) {
  return;
}
boolean canHandlePosts = formHandler.canHandlePosts();
Blog blog = formHandler.getAvailableBlog();
boolean isHandlePostActive = Util.getString(getStringEnumParameter("blogDisplay", null, "posts"), "").equals("posts");
boolean isAllPostActive = true;
if (isHandlePostActive) {
  isAllPostActive = false;
}
if (request.getAttribute(BlogPostDisplayHandler.class.getSimpleName()) != null) {
  isAllPostActive = false;
}
%><jalios:appSidebarSection name="views" title="ui.app.sidebar-section.views"><%
  %><ul class="app-sidebar-menu"><%
    %><li class="<%= isAllPostActive ? "active":"" %>"><%
      if (isAllPostActive) {
        %><jalios:icon src="app-list-check" css="app-list-right-icon" /><%
      }
      %><jalios:link data="<%= blog %>" css="noTooltipCard"><%
        %><%= glp("jcmsplugin.blog.app.sidebar.all-posts-link") %><%
      %></jalios:link><%
    %></li><%
    if (canHandlePosts) {
      %><li class="<%= isHandlePostActive ? "active":"" %>"><%
        if (isHandlePostActive) {
          %><jalios:icon src="app-list-check" css="app-list-right-icon" /><%
        }
        %><jalios:link data="<%= formHandler.getAvailableBlog() %>" params="blogDisplay=posts" css="noTooltipCard"><%
          %><%= glp("jcmsplugin.blog.manage-posts.title") %><%
        %></jalios:link><%
      %></li><%
    }
  %></ul><%
%></jalios:appSidebarSection><%
%>