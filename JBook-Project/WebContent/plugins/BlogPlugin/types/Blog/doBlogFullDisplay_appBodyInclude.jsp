<%@page import="com.jalios.jcms.a11y.A11YConstants"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
request.setAttribute(PortalManager.APP_PORTAL_ATTR, Boolean.FALSE);
%><jalios:include jsp="plugins/BlogPlugin/types/Blog/doBlogFullDisplay_initHandler.jsp" /><%
BlogPostQueryHandler formHandler = (BlogPostQueryHandler) request.getAttribute("blogFormHandler");
if (formHandler == null) {
  return;
}
Blog blog = formHandler.getAvailableBlog();
if (blog == null) {
  logger.warn("doBlogFullDisplay_appBodyInclude.jsp: handler is null");
  return;
}
boolean isPostList = formHandler.isPostList();
boolean isHandlePost = formHandler.isHandlePostPage();
if (!isPostList && !isHandlePost) {
  return;
}
boolean isJNewsDisplay = formHandler.isJNewsDisplay();
String appPubWrapperClasses = "app-pub-wrapper";
if (isPostList) {
  appPubWrapperClasses += " is-post-list";
}
if (isPostList && !isJNewsDisplay) {
  appPubWrapperClasses += " app-cards-horizontal-wrapper";
}
if (isJNewsDisplay) {
  appPubWrapperClasses += " app-cards-jnews";
}
boolean hideSelectionSide = !isLogged;
if (!hideSelectionSide) {
  appPubWrapperClasses += " app-pub-wrapper-actions pub-action-toggler-" + blog.getId();
}
%><div class="<%= appPubWrapperClasses %>"><%
  if (!hideSelectionSide) {
    request.setAttribute("publication", blog);
    %><aside><%
      %><jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" /><%
    %></aside><%
  }
  if (isHandlePost) {
    %><jalios:include jsp="plugins/BlogPlugin/jsp/portlet/doBlogHandlePosts.jsp"/><% 
  }
  if (isPostList) {
    %><jalios:include jsp="/plugins/BlogPlugin/types/Blog/doBlogPostResults.jsp" /><%
  }
%></div><%
%>