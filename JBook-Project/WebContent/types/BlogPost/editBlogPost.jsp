<%--
  @Summary: BlogPost editor
  @Category: Custom
  @Customizable: False
  @Requestable: True
--%><%@page import="com.jalios.jcmsplugin.blog.BlogManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditBlogPostHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% request.setAttribute("formHandler", formHandler); %><%
%><%@ include file='/work/doEditPubHeader.jspf' %>
<div class="container-fluid">
  <div class="row BlogPost">
    <jalios:include jsp="types/BlogPost/doEditBlogPost.jsp" />
  </div>
</div>
<% 
  TreeSet  removedCatSet = new TreeSet();
  if (Util.notEmpty(request.getAttribute("removedCatSet"))) {
    removedCatSet.addAll((Collection)request.getAttribute("removedCatSet"));
  }
  Set<Category> removedMainCatSet = formHandler.getRemovedCatSet();
  if (removedMainCatSet != null) {
    removedCatSet.addAll(removedMainCatSet);
  }
  request.setAttribute("removedCatSet", removedCatSet);
  %>
<jalios:include jsp="work/edition/doEditPubFooter.jsp" />