<%@page import="com.jalios.jcmsplugin.blog.BlogManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog-edition.css");
  EditBlogHandler formHandler = (EditBlogHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.Blog.class);
  
  BlogManager blogMgr = BlogManager.getInstance();
%>
	<%-- Description ------------------------------------------------------------ --%>
	<jalios:field name="description" formHandler="<%= formHandler %>">
	  <jalios:control />
	</jalios:field>
<%
    boolean displayBlogWorkspaceField = !blogMgr.isWorkspaceBlogosphere(workspace);
    if(formHandler.getPublication() != null){
        Blog blog = (Blog) formHandler.getPublication();
        if(blog.isInBlogosphere()){
          displayBlogWorkspaceField = false;
        }
    }
%>
<% if (displayBlogWorkspaceField) { %>
	<%-- BloggerGroup ------------------------------------------------------------ --%>
	<jalios:field name="bloggerGroup" formHandler="<%= formHandler %>">
	  <jalios:control />
	</jalios:field>
  
  <jalios:field name="cids" label="jcmsplugin.blog.blog-root.label" description="jcmsplugin.blog.blog-root.description" value='<%= formHandler.getCategorySet("cids") %>' >
    <jalios:control settings="<%= new CategoryTreeSettings().root(workspace.getCatSet()).disableSearch().radio().level(2) %>"/>
  </jalios:field>
<% } %>
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  if (displayBlogWorkspaceField && Util.notEmpty(workspace.getCatSet())) {
    removedCatSet.addAll(workspace.getCatSet());
  }
  request.setAttribute("Blog.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %>