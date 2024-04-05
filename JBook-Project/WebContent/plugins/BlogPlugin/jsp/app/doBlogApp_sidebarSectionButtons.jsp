<%@page import="com.jalios.jcmsplugin.blog.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><jalios:include jsp="plugins/BlogPlugin/types/Blog/doBlogFullDisplay_initHandler.jsp" /><%
BlogPostQueryHandler formHandler = (BlogPostQueryHandler) request.getAttribute("blogFormHandler");
if (formHandler == null) {
  return;
}
Blog blog = formHandler.getAvailableBlog();
if (blog == null) {
  return;
}
boolean isDataWriteEnabled = channel.isDataWriteEnabled();
boolean canPublishPostInBlog = isDataWriteEnabled && formHandler.canPublishPostInBlog();
boolean isPostWorkflowMinimal = formHandler.isPostWorkflowMinimal();
String publishPostLabel = glp("jcmsplugin.blog.label.action.add-post-wf");
if (isPostWorkflowMinimal) {
  publishPostLabel = glp("jcmsplugin.blog.label.action.add-post");
}
boolean canBeFollowedBy = isDataWriteEnabled && formHandler.canBlogBeFollowedBy();
boolean canHandleBlogAuthors = isDataWriteEnabled && formHandler.canHandleBlogAuthors();
%><jalios:appSidebarSection name="buttons"><%
  if (canPublishPostInBlog) {
    %><jalios:link data="<%= blog %>" 
          params="blogDisplay=addPost" 
          css="noTooltipCard btn btn-default app-sidebar-button"><%
      %><jalios:icon src="add" /><%
      %> <%= publishPostLabel %><%
    %></jalios:link><%
  }
  if (canBeFollowedBy) {
    boolean blogIsFollowedBy = blog.isFollowedBy(loggedMember);
    %><div class="app-sidebar-section-subscription"><%
      %><a role="button" tabindex="0" class="btn btn-default btn-unfollow <%= !blogIsFollowedBy ? "hide" : "" %>"
          title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.app-sidebar.unfollow.tooltip")) %>"
          data-jalios-blog-action="unfollowBlog" data-jalios-data-id="<%= blog.getId() %>">
        <jalios:icon src="jcmsplugin-blog-unfollow" />
        <span class="unfollow-label"><%= glp("jcmsplugin.blog.app-sidebar.unfollow") %></span>
      </a>
      <a role="button" tabindex="0" class="btn btn-default btn-follow <%= blogIsFollowedBy ? "hide" : "" %>"
          title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.app-sidebar.follow.tooltip")) %>"
          data-jalios-blog-action="followBlog" data-jalios-data-id="<%= blog.getId() %>">
        <jalios:icon src="jcmsplugin-blog-follow" />
        <span class="follow-label"><%= glp("jcmsplugin.blog.app-sidebar.follow") %></span>
      </a><%
    %></div><%
  }
  if (canHandleBlogAuthors) {
    %><a href="plugins/BlogPlugin/jsp/modal/handleAuthors.jsp?blogId=<%= blog.getId() %>" 
          class="btn btn-default app-sidebar-button modal noTooltipCard"><%
      %><jalios:icon src='jcmsplugin-blog-manage-author' /><%
      %> <%= glp("jcmsplugin.blog.admin.add-authors") %><%
    %></a><%
  }
%></jalios:appSidebarSection><%
%>

