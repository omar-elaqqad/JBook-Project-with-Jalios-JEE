<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %>  
<% if(Util.notEmpty(blog.getDescription())){ %>
<div class="well well-sm blog-description" itemprop="description">
	<% if(blogMgr.isBlogInBlogosphere(blog)){%>
  <jalios:memberphoto member="<%= blog.getAuthor() %>" size="<%= PhotoSize.TINY %>" /><% } %>
	<jalios:wiki data="<%= blog %>" field="description">
	<%= Util.getString(blog.getDescription(),"") %>
	</jalios:wiki>
</div>
<% } %>