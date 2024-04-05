<%--
  @Summary: Blog editor
  @Category: Custom
  @Customizable: True
  @Requestable: False
--%><%
%><%@page import="com.jalios.jcmsplugin.blog.BlogManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditBlogHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% request.setAttribute("formHandler", formHandler); %><%
%><%@ include file='/work/doEditPubHeader.jspf' %>
<div class="container-fluid">
  <div class="row Blog">
    <jalios:include jsp="types/Blog/doEditBlog.jsp" />
  </div>
</div>
<%
BlogManager blogMgr = BlogManager.getInstance();
  boolean displayBlogWorkspaceField = !blogMgr.isWorkspaceBlogosphere(workspace);
  if(formHandler.getPublication() != null){
    Blog blog = (Blog) formHandler.getPublication();
    if(blog.isInBlogosphere()){
      displayBlogWorkspaceField = false;
    }
  }
  TreeSet  removedCatSet = new TreeSet(); 
  if (displayBlogWorkspaceField && Util.notEmpty(workspace.getCatSet())) {
    removedCatSet.addAll(workspace.getCatSet());
  }
  Category itRemoveCat = null;
  request.setAttribute("removedCatSet", removedCatSet);
  %>
<jalios:include jsp="work/edition/doEditPubFooter.jsp" />