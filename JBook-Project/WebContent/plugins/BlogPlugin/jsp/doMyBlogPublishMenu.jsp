<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
if (isLogged) {
  BlogManager blogMgr = BlogManager.getInstance();
  Blog blog = (Blog) blogMgr.getMemberBlog(loggedMember);
  if (blog != null && blogMgr.canPublishPostInBlog(loggedMember,blog)) {
    %>
    <a class="publish-menu-item list-group-item publish-menu-add-my-blog" href="<%= blog.getDisplayUrl(userLocale) %>?blogDisplay=addPost">
      <jalios:icon src="jcmsplugin-blog-blogpost-add" /> <%= glp("jcmsplugin.blog.publish-menu.add-mine") %>
    </a>
  <% } %>
<% } %>