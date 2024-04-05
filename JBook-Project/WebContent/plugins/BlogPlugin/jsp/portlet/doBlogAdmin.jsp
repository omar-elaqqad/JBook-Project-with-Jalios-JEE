<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %><%  
%><%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogRights.jspf" %><% 

if (!isDataWriteEnabled || !isAdminOrAuthor) {
	return;
}

boolean canSeeDraftPosts = BlogManager.getInstance().canSeeDraftPosts(blog, loggedMember);
%>
<jalios:panel css="panel-warning" title="jcmsplugin.blog.title.admin">
	<ul class="item-box">
	  <% if(loggedMember.canWorkOn(blog) && blog.getBloggerGroup() != null ){ %>
		<li>
    <a href="plugins/BlogPlugin/jsp/modal/handleAuthors.jsp?blogId=<%= blog.getId() %>" class="modal">
			<jalios:icon src="jcmsplugin-blog-add-authors"/> <%= glp("jcmsplugin.blog.admin.add-authors") %>
		</a>
    </li>
		<% } %>
	<% if(canPublishPostInBlog){ %>
  <li>
    <jalios:link data="<%= blog %>" params="blogDisplay=addPost">
  		<jalios:icon src="jcmsplugin-blog-blogpost-add" /> <%= glp("jcmsplugin.blog.label.action.add-post") %>
  	</jalios:link>
  </li>
	<% } %>
  <% if(isAdminOrAuthor){ %>
    <li>
      <jalios:link data="<%= blog %>" params="blogDisplay=posts"><jalios:icon src="jcmsplugin-blog-blogpost" />  <%= glp("jcmsplugin.blog.admin.handle-posts") %></jalios:link>
    </li>
  <% } %>
  <% if (canSeeDraftPosts) { %>
    <% int draftCount = blog.getBlogPostNotPublishedCount(loggedMember); %>
    <li>
      <jalios:link data="<%= blog %>" params="blogDisplay=draft"><jalios:icon src="jcmsplugin-blog-workflow" /> <%= glp("jcmsplugin.blog.label.action.see-draft") %> <span class="item-info"><%= draftCount %></span></jalios:link>
    </li>
  <% } %>
	</ul>
</jalios:panel>