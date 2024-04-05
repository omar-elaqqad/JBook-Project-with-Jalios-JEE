<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %>  
<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogRights.jspf" %>  

<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>

<%     
    DBCommentManager dbcommentMgr = DBCommentManager.getInstance();
    BlogPost blogPost = (BlogPost) request.getAttribute("jcmsplugin.blog.blogPost");
%>  
<% if(blogPost != null){ %>
<div class="post-container">
    <% BlogPost post = blogPost; %>
    <% boolean postFullDisplay = true; %>
    <%@ include file='/plugins/BlogPlugin/jsp/doCommonBlogPost.jspf' %>
</div>
<% } %>