<%-- DEPRECATED, see plugins/BlogPlugin/jsp/portlet/doBlogHandlePosts.jsp  --%>
<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %>  
<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogRights.jspf" %>  
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<% 
  DBCommentManager dbcommentMgr = DBCommentManager.getInstance();
  
  BlogPost blogPost = (BlogPost) jcmsContext.getAjaxRequestAttribute("blogPost");
  
  Category categorySelected = getCategoryParameter("blogCatId");
  
  String searchedText = getUntrustedStringParameter("searchedText", "");
  String blogDisplay = getAlphaNumParameter("blogDisplay", "");
  boolean postFullDisplay = false;
  
  Map pagerMap = new HashMap();
  pagerMap.put("blogId", blog.getId());
  
  if (blogPost != null) {
    return;
  }
%> 
<jalios:pager name='pagerHandler' declare='true' sort="pdate" pageSize='5' action='init' paramPrefix='blog_'  reverse='true' parameterMap='<%= pagerMap %>' />
<%        
  int start = getIntParameter("blog_start", 0);
  int pageSize = getIntParameter("blog_pageSize", 10);
  boolean pagerAll = getBooleanParameter("blog_pagerAll", false);
  if (pagerAll) {
     pageSize = -1;
  }        
  
  PageResult pageResult = null;
  if (categorySelected != null) {
    pageResult = blog.getBlogPostByCategoryPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize,loggedMember,categorySelected);
  } else if (Util.notEmpty(searchedText)) {
    postFullDisplay = false;
    pageResult = blog.getBlogPostSearchPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize,loggedMember,searchedText);
  } else if("draft".equals(blogDisplay)) {
    pageResult = blog.getBlogPostNotPublishedPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize,loggedMember);
  } else if("archive".equals(blogDisplay)) {
    int month = getIntParameter("month",-1);
    int year = getIntParameter("year",-1);
    pageResult = blog.getBlogPostByMonthPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize,loggedMember,year,month);
  } else {
    pageResult = blog.getBlogPostPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize,loggedMember,false,null);
  }
%>  
<div class="post-container">
  <% if (pageResult != null && pageResult.getTotalSize() > 0) { %> 
  	<jalios:pager name='pagerHandler'  size='<%= pageResult.getTotalSize() %>' action='compute' />        
		
    <jalios:foreach collection="<%= pageResult.getResultList() %>" type="BlogPost" name="itBlogPost" max='<%= pagerHandler.getPageSize() %>'  skip='<%= pagerHandler.getStart() %>'>
      <% BlogPost post = itBlogPost; %>
	    <%@ include file='/plugins/BlogPlugin/jsp/doCommonBlogPost.jspf' %>
		</jalios:foreach>
    
    <jalios:pager name='pagerHandler'/>
	<% } else { %>
    <jalios:message>
      <p class="br">
        <% if ("draft".equals(blogDisplay)) { %>
          <%= glp("jcmsplugin.blog.label.empty-drafts") %>
        <% } else if(Util.notEmpty(categorySelected)) { %>
          <%= glp("jcmsplugin.blog.label.empty-cat") %>
        <% } else if(Util.notEmpty(searchedText)) { %>
          <%= glp("jcmsplugin.blog.label.empty-search") %>
        <% } else { %>
          <%= glp("jcmsplugin.blog.label.empty") %>
        <% } %> 
      </p>
      <% if (canPublishPostInBlog) {%>
        <jalios:link data="<%= blog %>" params="blogDisplay=addPost" css="noTooltipCard btn btn-primary hidden-print"><%= glp("jcmsplugin.blog.label.action.add-post") %></jalios:link>
      <% } %>
    </jalios:message>
  <% } %> 
</div>