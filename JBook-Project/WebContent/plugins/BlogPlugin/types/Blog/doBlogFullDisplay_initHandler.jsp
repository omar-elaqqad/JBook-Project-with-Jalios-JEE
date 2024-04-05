<%@page import="com.jalios.jcmsplugin.blog.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
BlogPostQueryHandler formHandler = (BlogPostQueryHandler) request.getAttribute("blogFormHandler");
if (formHandler != null) {
  return;
}
if (formHandler == null) {
  %><jsp:useBean id='appHandler' scope='page' class="com.jalios.jcmsplugin.blog.BlogPostQueryHandler"><%
    %><jsp:setProperty name='appHandler' property='request' value='<%=request%>'/><%
    %><jsp:setProperty name='appHandler' property='response' value='<%=response%>'/><%
    %><jsp:setProperty name='appHandler' property='*' /><%
    %><jsp:setProperty name='appHandler' property='filterWorkspace' value='<%= workspace %>'/><%
  %></jsp:useBean><%
  formHandler = appHandler;
  formHandler.validate();
}
// IMPT: do not print any HTML here, neither comment
// This JSP could be used with an isEmpty test to compute some JSP template
%>