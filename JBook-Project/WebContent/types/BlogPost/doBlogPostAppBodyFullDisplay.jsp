<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><jalios:include jsp="plugins/BlogPlugin/types/BlogPost/doBlogPostFullDisplay_initHandler.jsp" /><%
BlogPostDisplayHandler formHandler = (BlogPostDisplayHandler) request.getAttribute("blogFormHandler");
if (formHandler == null) {
  return;
}
String blogRedirect = formHandler.handleRedirect();
if (Util.notEmpty(blogRedirect)) {
  sendRedirect(blogRedirect);
  return;
}
BlogPost pub = formHandler.getAvailableBlogPost();
%>
<%@ include file="/plugins/BlogPlugin/types/BlogPost/doBlogPostContent.jspf" %>