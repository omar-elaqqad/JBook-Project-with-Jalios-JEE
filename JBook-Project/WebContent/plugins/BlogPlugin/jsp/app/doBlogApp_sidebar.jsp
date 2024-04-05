<%@page import="com.jalios.jcmsplugin.blog.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><jalios:include jsp="plugins/BlogPlugin/types/Blog/doBlogFullDisplay_initHandler.jsp" /><%
BlogPostQueryHandler formHandler = (BlogPostQueryHandler) request.getAttribute("blogFormHandler");
if (formHandler == null) {
  logger.warn("doBlogApp_sidebar.jsp: handler is null");
  return;
}
Blog blog = formHandler.getAvailableBlog();
if (blog == null) {
  return;
}
if (!formHandler.showSidebar()) {
  return;
}
%><jalios:appSidebar
      icon="jcmsplugin-blog-blog-app-full" 
      iconTitleProp="<%= blog.getTitle(userLang) %>"
      appUrl="<%= blog.getDisplayUrl(userLocale) %>"><%
  %><form class="app-blog-form" action="<%= blog.getDisplayUrl(userLocale) %>" method="POST"><%
    %><jalios:include resource="blog.app.sidebar-section.views" /><%
    %><jalios:include resource="blog.app.sidebar-section.filters" /><%
    %><jalios:include resource="blog.app.sidebar-section.buttons" /><%
    %><%= formHandler.getFormStepHiddenFields() %><%
  %></form><%
%></jalios:appSidebar><%
%>