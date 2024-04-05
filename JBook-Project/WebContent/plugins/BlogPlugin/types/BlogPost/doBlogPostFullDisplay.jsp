<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><jalios:include jsp="plugins/BlogPlugin/types/BlogPost/doBlogPostFullDisplay_initHandler.jsp" /><%
BlogPostDisplayHandler formHandler = (BlogPostDisplayHandler) request.getAttribute(BlogPostDisplayHandler.class.getSimpleName());
if (formHandler == null) {
  logger.warn("doBlogPostFullDisplay.jsp: handler is null");
  return;
}
String blogRedirect = formHandler.handleRedirect();
if (Util.notEmpty(blogRedirect)) {
  sendRedirect(blogRedirect);
  return;
}
// Note: Since BLOG-296, blog pub may be null
Blog blog = formHandler.getAvailableBlog();
BlogPost pub = formHandler.getAvailableBlogPost();
if (pub == null) {
  logger.warn("doBlogPostFullDisplay.jsp: blogpost is null");
  return;
}
// Breadcrumb must not be computed too early (like in #init()), else, blog may be null
List<BreadcrumbItem> breadcrumbItemList = formHandler.getBreadcrumbItemList();
if (Util.notEmpty(breadcrumbItemList)) {
  request.setAttribute("blogpost.BreadbcrumbItemlist", breadcrumbItemList);
}
String appCss = "app-blog jcms-blog blogpost-fulldisplay";
boolean hasSidebar = blog != null;
if (!hasSidebar) {
  appCss += " has-no-sidebar";
}
int compareToSP6 = channel.getJcmsInfo().compareToVersion(10, 0, 6);
%><jalios:app name="blog" css='<%= appCss %>'><%
  %><jalios:include resource='blog.app.sidebar' /><%
  %><jalios:appMain headerTitle='<%= formHandler.getAppHeaderTitle() %>'><%
    %><%@ include file="/front/doFullDisplay.jspf" %><%
    if (compareToSP6 < 0) {
      // See BLOG-338 on 10.0.5
      %><jalios:appBodyInclude pub='<%= pub %>' template="appBody" /><%
    } else {
      %><jalios:appBodyInclude pub='<%= pub %>' /><%
    }
  %></jalios:appMain><%
%></jalios:app><%
%>
