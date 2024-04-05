<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
request.setAttribute(PortalManager.APP_PORTAL_ATTR, Boolean.FALSE);
%><jalios:include jsp="plugins/BlogPlugin/types/Blog/doBlogFullDisplay_initHandler.jsp" /><%
BlogPostQueryHandler formHandler = (BlogPostQueryHandler) request.getAttribute("blogFormHandler");
if (formHandler == null) {
  return;
}
Blog pub = (Blog) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
Blog blog = pub;
if (blog != null && formHandler.getAvailableBlog() == null) {
  formHandler.setBlog(blog.getId());
}
if (blog == null) {
  blog = formHandler.getAvailableBlog();
}
if (blog == null) {
  sendRedirect("index.jsp");
  return;
}
if (blog.isInBlogosphere()) {
  formHandler.setFilterWorkspace(BlogManager.getInstance().getBlogosphereWorkspace());
}
// Attribute for doCommonBlogPortletParams.jspf
request.setAttribute("jcmsplugin.blog.blog", blog); 
String blogDisplay = getUntrustedStringParameter("blogDisplay", "");
if (blog.isInBlogosphere() && JcmsUtil.isSameId(loggedMember,blog.getAuthor()) && !BlogManager.getInstance().checkAgreement(loggedMember)) {
  sendRedirect("plugins/BlogPlugin/jsp/agreement.jsp?blogId="+blog.getId());
  return;  
}
formHandler.addFrontEndDependencies();
boolean isAddPost = formHandler.isAddPostPage();
boolean isHandlePost = formHandler.isHandlePostPage();
boolean isPostList = !isAddPost && !isHandlePost;
boolean isDraft = "draft".equals(blogDisplay);
boolean isBlogJNewsMore = getBooleanParameter("isBlogJNewsMore", false);

formHandler.setBlogDraft(String.valueOf(isDraft));
request.setAttribute("is-blog-add-post", isAddPost);
request.setAttribute("is-blog-admin-active", (isHandlePost || isDraft));
request.setAttribute("is-blog-handle-post", isHandlePost);
request.setAttribute("is-blog-draft", isDraft);
if (isAddPost) {
  // In case of add post FORM, prevent sidebar ajax refresh
  // else, a "Do you really want to exit page?" popup appears on:
  // 1. Hit Publish a post
  // 2. Filter sidebar with a non empty text filter (with ajax enabled)
  // 3. Hit Publish a Post again: popup appears
  request.setAttribute("blog-use-sidebar-ajax", false);
}
// Restore skip header attribute (manual inclusion) (header can dislay validateForm)
request.setAttribute("skipHeader", false);
request.setAttribute("skipFooter", true);
if (isAddPost) {
  %><jalios:include jsp="plugins/BlogPlugin/jsp/portlet/doBlogAddPost.jsp"/><%
  return;
}
%><jalios:buffer name="postListBuffer"><%
  if (isPostList) {
    %><jalios:include jsp="/plugins/BlogPlugin/types/Blog/doBlogPostResults.jsp" /><%
  }
%></jalios:buffer><%
if (isBlogJNewsMore) {
  %><%= postListBuffer.toString() %><%
  return;
}
String refreshUrl = "plugins/BlogPlugin/types/Blog/doBlogFullDisplay.jsp";
%><div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>"><%
  %><jalios:app name="blog" css='<%= formHandler.getAppCss() %>' ><%
    %><jalios:include resource='blog.app.sidebar' /><%
    %><jalios:appMain headerTitle='<%= formHandler.getAppHeaderTitle() %>'><%
      %><%@ include file="/front/doFullDisplay.jspf" %><%
      %><jalios:appBodyInclude jsp='plugins/BlogPlugin/types/Blog/doBlogFullDisplay_appBodyInclude.jsp' /><%
    %></jalios:appMain><%
    %><input type="hidden" name="blog" value="<%= blog.getId() %>" /><%
  %></jalios:app><%
  %><%@ include file='/jcore/doAjaxFooter.jspf' %><%
%></div>