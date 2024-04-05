<%--
  @Summary: BlogPost content editor
  @Category: Custom
  @Customizable: True
  @Requestable: False 
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%

  jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blogpost-edition.css");

  EditBlogPostHandler formHandler = (EditBlogPostHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.BlogPost.class);
  
  BlogManager blogMgr = BlogManager.getInstance();
  String blogId = (String) request.getAttribute("jcmsplugin.blog.form.blogId");
  Blog blog = null;
  if (formHandler.getAvailableBlog() != null) {
    blog = formHandler.getAvailableBlog(); 
  } else if (channel.getPublication(blogId) != null) {
    blog = (Blog) channel.getPublication(blogId); 
  }
  Category catRoot = formHandler.getBlogCatRoot();

  boolean showOptions = getBooleanParameter("showOptions", false);
%>
<%-- Content ------------------------------------------------------------ --%>
<jalios:field name="content" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Summary ------------------------------------------------------------ --%>
<jalios:field name="summary" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% if (Util.isEmpty(request.getAttribute("jcmsplugin.blog.form.blogId"))){  %>
  <%-- Blog ------------------------------------------------------------ --%>
  <jalios:field name="blog" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
<% } else { %>
  <input type="hidden" name="blog" value="<%= blogId %>"/>
<% } %>

<% if (formHandler.showContentTabCategories()) {
  Set<Category> availableCategories = formHandler.getAvailableContentTabCategories();
  %>
  <%-- Category ------------------------------------------------------------ --%>
  <jalios:field name="cids" label="ui.com.lbl.categories" keyword="true" value="<%= availableCategories %>">
    <jalios:control settings='<%= formHandler.getContentTabCategorySettings() %>' />
  </jalios:field>
<% } %>
<jalios:include target="EDIT_BLOGPOST_MAINTAB_CATEGORIES" targetContext="div" />

<%-- FeaturedImage ------------------------------------------------------------ --%>
<jalios:field name="featuredImage" formHandler="<%= formHandler %>" description="">
  <jalios:control />
</jalios:field>

<%-- FeaturedImageAlt ------------------------------------------------------------ --%>
<jalios:field name="featuredImageAlt" formHandler="<%= formHandler %>" label="" description="types.BlogPost.fields.featuredImage.description">
  <%
  String featureImageAltAriaLabel = "aria-label=\"" + glp("types.BlogPost.fields.featuredImageAlt.label") + "\"";
  featureImageAltAriaLabel += " title=\""+glp("types.BlogPost.fields.featuredImageAlt.label")+"\"";
  %>
  <jalios:control settings='<%= new TextFieldSettings().placeholder(glp("types.BlogPost.fields.imageAltText.label")).htmlAttributes(featureImageAltAriaLabel) %>' />
</jalios:field>

<%-- OPTIONNAL FIELDS --%>

<%-- ThumbnailImage ------------------------------------------------------------ --%>
<jalios:field name="thumbnailImage" formHandler="<%= formHandler %>" description="" css='<%= "toggle-options-state" + (inFO ? " hide":"") %>'>
  <jalios:control />
</jalios:field>

<%-- ThumbnailImageAlt ------------------------------------------------------------ --%>
<jalios:field name="thumbnailImageAlt" formHandler="<%= formHandler %>" label="" description="types.BlogPost.fields.thumbnailImage.description" css='<%= "toggle-options-state" + (inFO ? " hide":"") %>'>
  <%
  String thumbnailImageAltAriaLabel = "aria-label=\"" + glp("types.BlogPost.fields.thumbnailImageAlt.label") + "\"";
  thumbnailImageAltAriaLabel += " title=\""+glp("types.BlogPost.fields.thumbnailImageAlt.label")+"\"";
  %>
  <jalios:control settings='<%= new TextFieldSettings().placeholder(glp("types.BlogPost.fields.imageAltText.label")).htmlAttributes(thumbnailImageAltAriaLabel) %>' />
</jalios:field>

<%-- *** METADATA ************************************* --%>
<% if (inFO) { %>
  <jalios:field  name='authorizedGroupIds' label="ui.com.lbl.grp-read-rights" value='<%= formHandler.getAvailableAuthorizedGroupSet() %>' mv='<%= 1 %>' keyword="true" css='<%= "toggle-options-state" + (inFO ? " hide":"") %>'>
    <jalios:control type="<%= ControlType.GROUP %>" />
  </jalios:field>
  
  <jalios:field  name='authorizedMemberIds' label="ui.com.lbl.mbr-read-rights" value='<%= formHandler.getAvailableAuthorizedMemberSet() %>' mv='<%= 1 %>' keyword="true" css='<%= "toggle-options-state" + (inFO ? " hide":"") %>'>
    <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
  </jalios:field>
<% } %>
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  itRemoveCat = catRoot;
  if (itRemoveCat != null){ removedCatSet.add(itRemoveCat);  }
  request.setAttribute("BlogPost.removedCatSet", removedCatSet);
}  
%>
<div class='<%= "toggle-options-state" + (inFO ? " hide":"") %>'>
  <jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
  <jalios:include jsp="/jcore/doEditExtraData.jsp" />
</div>
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %>

<% if (BlogUtil.isBlogDebug()) { %>
  blog: <pre><%= blog != null ? encodeForHTML(blog.toString()) : null %></pre><br/>
  blogId: <pre><%= encodeForHTML(blogId) %></pre><br />
  blog.catSet: <pre><%= blog != null && blog.getCategorySet() != null ? encodeForHTML(blog.getCategorySet().toString()) : null %></pre><br/>
  formHandler.getBlogCatRoot(): <pre><%= formHandler.getBlogCatRoot() != null ? encodeForHTML(JcmsUtil.dataToString(formHandler.getBlogCatRoot())) : null %></pre><br/>
  formHandler.showContentTabCategories(): <pre><%= formHandler.showContentTabCategories() %></pre><br/>
  formHandler.getPublication(): <pre><%= formHandler.getPublication() != null ? encodeForHTML(formHandler.getPublication().toString()) : null %></pre><br/>
  formHandler.getAvailableContentTabCategories() = <pre><%= formHandler.getAvailableContentTabCategories() %></pre><br/>
  formHandler.getContentTabCategorySettings() = <pre><%= formHandler.getContentTabCategorySettings() %></pre><br/>
  formHandler.getContentTabCategorySettings().resolveRootCategories() = <pre><%= Util.getArrayList(formHandler.getContentTabCategorySettings().resolveRootCategories()) %></pre><br/>
  formHandler.showContentTabCategories() = <code><%= formHandler.showContentTabCategories() %></code><br/>
<% } %>