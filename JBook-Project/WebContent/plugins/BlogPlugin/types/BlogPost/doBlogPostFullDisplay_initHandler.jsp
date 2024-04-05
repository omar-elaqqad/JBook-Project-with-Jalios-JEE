<%@page import="com.jalios.jcmsplugin.blog.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
BlogPostDisplayHandler formHandler = (BlogPostDisplayHandler) request.getAttribute(BlogPostDisplayHandler.class.getSimpleName());
if (formHandler != null) {
  return;
}
if (formHandler == null) {
  %><jsp:useBean id='appHandler' scope='page' class="com.jalios.jcmsplugin.blog.BlogPostDisplayHandler"><%
    %><jsp:setProperty name='appHandler' property='request' value='<%=request%>'/><%
    %><jsp:setProperty name='appHandler' property='response' value='<%=response%>'/><%
    %><jsp:setProperty name='appHandler' property='*' /><%
  %></jsp:useBean><%
  BlogPost pub = (BlogPost)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  formHandler = appHandler;
  formHandler.setBlogPost(JcmsUtil.getId(pub));
  formHandler.validate();
}
// IMPT: do not print any HTML here, neither comment
// This JSP could be used with an isEmpty test to compute some JSP template
%>