<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.blog.*" %>
<% if(isLogged){ 
    BlogManager blogMgr = BlogManager.getInstance();
    Blog memberBlog = (Blog) blogMgr.getMemberBlog(loggedMember);
    if (memberBlog != null) {
%>
<jalios:link data="<%= memberBlog %>" css="sidebar-menu-item list-group-item">
 <jalios:icon src="jcmsplugin-blog-blog" />
 <%= glp("jcmsplugin.blog.label.my-blog") %>
</jalios:link>
<% } %>
<% } %>