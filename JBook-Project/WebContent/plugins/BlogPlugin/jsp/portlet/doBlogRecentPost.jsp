<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %> 
<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogRights.jspf" %>  
<%  
  Map pagerMap = new HashMap();
  pagerMap.put("blogId",blog.getId());
%>
<jalios:pager name='pagerHandler' declare='true' sort="pdate" pageSize='5' action='init' paramPrefix='blog_'  reverse='true' parameterMap='<%= pagerMap %>' />
<% 
  int start = getIntParameter("blog_start", 0);
  int pageSize = getIntParameter("blog_pageSize", 10);
  boolean pagerAll = getBooleanParameter("blog_pagerAll", false);
  if(pagerAll){
     pageSize = -1;
  }        
  PageResult pageResult = blog.getBlogPostPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize,loggedMember,false,null);
  
  boolean displayList = Util.notEmpty(pageResult.getResultList());
  boolean displayFooter = isDataWriteEnabled && !workspace.isClosed() && isLogged;
  
  boolean memberCanFollow = (blog.isInBlogosphere() && !JcmsUtil.isSameId(loggedMember,blog.getAuthor())) || !blog.isInBlogosphere();
  
  displayFooter = displayFooter && memberCanFollow;
  
  if (!displayList && !displayFooter) {
    return;
  }
  
  String follow;  
%>
<jalios:pager name='pagerHandler'  size='<%= pageResult.getTotalSize() %>' action='compute' />        
      
<jalios:panel css="panel-default" title="jcmsplugin.blog.title.recent-post" picture="jcmsplugin-blog-blogpost">

<% if(displayList){ %>
  <ul class="item-box">
    <jalios:foreach collection="<%= pageResult.getResultList() %>" type="BlogPost" name="itBlogPost" max='<%= pagerHandler.getPageSize() %>'  skip='<%= pagerHandler.getStart() %>'>
    <li>
      <% if(itBlogPost.isInVisibleState()){ %>
        <% Date itemDate = itBlogPost.getPdate() != null ? itBlogPost.getPdate() : itBlogPost.getCdate(); %>
        <%@ include file="/jcore/doItemBoxDate.jspf" %>  
        &nbsp;
      <% }else{ %>
        <%= itBlogPost.getWFStateLabelHtml(userLang)%>
      <% } %>
      <jalios:link data="<%= itBlogPost %>" params='<%= !itBlogPost.isInVisibleState() ? "preview=true" : "" %>'><%= itBlogPost.getTitle(userLang,true) %></jalios:link>
    </li>
    </jalios:foreach>
  </ul>
  <jalios:pager name='pagerHandler' template='pqf'/>
<% } %>    
  
  <% if(displayFooter){ %>
  <jalios:buffer name="PANEL_FOOTER">
  <% if(blog.isFollowedBy(loggedMember)){ %>
      <% follow = glp("jcmsplugin.blog.label.action.unfollow-blog-text"); %>
      <a href="front/follow.jsp?id=<%= blog.getId() %>&amp;follow=false&amp;redirect=<%= ServletUtil.encodeURL(ServletUtil.getUrl(request)) %>" class="modal confirm" title="<%= encodeForHTMLAttribute(follow) %>">
        <jalios:icon src="unfollow" />
        <%= glp("jcmsplugin.blog.label.action.unfollow-blog") %>
      </a>                        
   <% }else{%>
       <% follow = glp("jcmsplugin.blog.label.action.follow-blog-text"); %>
       <a href="front/follow.jsp?id=<%= blog.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(ServletUtil.getUrl(request)) %>" class="modal confirm" title="<%= encodeForHTMLAttribute(follow) %>">
         <jalios:icon src="follow" />
         <%= glp("jcmsplugin.blog.label.action.follow-blog") %>
       </a>        
   <%}%> 
    
  </jalios:buffer>
  <% } %>
</jalios:panel>