<%@ page import="com.jalios.jcmsplugin.blog.BlogManager" %>
<%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  return;
}

BlogManager blogMgr = BlogManager.getInstance();
Blog blog = (Blog) blogMgr.getMemberBlog(loggedMember);

if (blog == null) {
  return;
}

%>
<a href="<%= blog.getDisplayUrl(userLocale) %>" class="topbar-application-item" data-jalios-dataid="my-blog"><span class="icon-wrapper"><jalios:icon src="topbar-app-my-blog" /></span><span class="label-wrapper"><%= glp("jcmsplugin.blog.label.my-blog") %></span></a>