<%@page import="com.jalios.jcmsplugin.blog.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
BlogHandlePostsHandler formHandler = (BlogHandlePostsHandler) request.getAttribute(BlogHandlePostsHandler.class.getSimpleName());
if (formHandler != null) {
  return;
}
if (formHandler == null) {
  %><jsp:useBean id='handler' scope='page' class="com.jalios.jcmsplugin.blog.BlogHandlePostsHandler"><%
    %><jsp:setProperty name='handler' property='request' value='<%=request%>'/><%
    %><jsp:setProperty name='handler' property='response' value='<%=response%>'/><%
    %><jsp:setProperty name='handler' property='*' /><%
    %><jsp:setProperty name='handler' property='filterWorkspace' value='<%= workspace %>'/><%
  %></jsp:useBean><%
  formHandler = handler;
  formHandler.validate();
}
// IMPT: do not print any HTML here, neither comment
// This JSP could be used with an isEmpty test to compute some JSP template
%>