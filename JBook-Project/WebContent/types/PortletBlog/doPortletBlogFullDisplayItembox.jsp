<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ page import="com.jalios.jcmsplugin.dbcomment.*" %><%

PortletBlog obj = (PortletBlog)portlet;
%><%@ include file='/front/doFullDisplay.jspf' %><%

BlogManager blogMgr = BlogManager.getInstance();
boolean isDataWriteEnabled = channel.isDataWriteEnabled();
String displayedList = Util.getString(obj.getDisplayedList(), "allWorkspace");
boolean isAllWorkspaceSearch = "allWorkspace".equals(displayedList);
boolean isWorkspaceOnlySearch = "workspaceOnly".equals(displayedList);
Set<AbstractBlog> wsBlogSet = Util.interSet(channel.getPublicationSet(AbstractBlog.class, loggedMember), workspace.getPubSet());
Blog memberBlog = (Blog) blogMgr.getMemberBlog(loggedMember);
String filterType = getUntrustedStringParameter("bpFilter", "blogPost");
boolean isBlogType = Util.toBoolean((filterType.equals("blog")), false) && !isWorkspaceOnlySearch;
boolean isMyBlogPostType = Util.toBoolean((filterType.equals("myBlogPost")), false);
boolean isBlogPostType = Util.toBoolean((filterType.equals("blogPost")), false) || isWorkspaceOnlySearch;
%>
<div class="portletBlog<%= obj.canBeEditedFieldByField(loggedMember) ? " unitFieldEdition" : "" %>">
<jalios:pager name='pagerHandler' declare='true' sort="pdate" pageSize='10' action='init' paramPrefix='lastblogs_' reverse='true' />

<% if (!isWorkspaceOnlySearch) { %>
  <div class="br">
  <ul class="nav nav-tabs">
    <li class="<%= (isBlogPostType) ? "active" : "" %>"><a href="<%= ServletUtil.getResourcePath(request) %>?bpFilter=blogPost" class="ajax-refresh"><%= glp("jcmsplugin.blog.tab.last-blog-post") %></a></li>
    <% if (isLogged) { %>
    <li class="<%= (isMyBlogPostType) ? "active" : "" %>"><a href="<%= ServletUtil.getResourcePath(request) %>?bpFilter=myBlogPost" class="ajax-refresh"><%= glp("jcmsplugin.blog.tab.my-blog-post") %></a></li>
    <% } %>
    <li class="<%= (isBlogType) ? "active" : "" %>"><a href="<%= ServletUtil.getResourcePath(request) %>?bpFilter=blog" class="ajax-refresh"><%= glp("jcmsplugin.blog.tab.last-blog") %></a></li>
  </ul>
  </div>
<% } %>

<% if (isBlogType) { %>
  <%
  int start = getIntParameter("lastblogs_start", 0);
  int pageSize = getIntParameter("lastblogs_pageSize", 10);
  boolean pagerAll = getBooleanParameter("lastblogs_pagerAll", false);
  if (pagerAll) {
    start = 0;
    pageSize = -1;
  }
  Set blogSet = new TreeSet(Publication.getCdateComparator());
  blogSet.addAll(blogMgr.getLastBlogSet(loggedMember, null));
  %>
  <jalios:pager name='pagerHandler' size='<%= blogSet.size() %>' action='compute' />
    <div class="item-box">
    <table class="items" cellpadding="0" cellspacing="0">
    <jalios:foreach collection="<%= blogSet %>" type="Blog" name="itBlog" max='<%= pagerHandler.getPageSize() %>'  skip='<%= pagerHandler.getStart() %>'>
    <tr class="item">
      <td class="fit">
        <% Date itemDate = itBlog.getCdate(); %>
        <%@ include file="/jcore/doItemBoxDate.jspf" %>  
      </td>
      <td class="item-photo fit">
        <% if(itBlog.getAuthor() != null){%>   
          <jalios:memberphoto member="<%= itBlog.getAuthor() %>" size="<%= PhotoSize.ICON %>" />
        <% } %>
      </td>
      <td class="item-text">
        <jalios:link data="<%= itBlog %>"/>
      </td>
     </tr>
    </jalios:foreach>
    </table>
    </div>
  <jalios:pager name='pagerHandler' template='pqf' />
  <% if (Util.isEmpty(blogSet)) { %>
    <p class="no-result"><%= glp("jcmsplugin.blog.label.empty-search") %></p>
  <% } %>

<% } else if (isBlogPostType || isMyBlogPostType) { %>
  <jalios:pager name='pagerHandler' declare='true' sort="pdate" pageSize='10' action='init' paramPrefix='blogposts_' reverse='true' />
  <%
  int start = getIntParameter("blogposts_start", 0);
  int pageSize = getIntParameter("blogposts_pageSize", 10);
  boolean pagerAll = getBooleanParameter("blogposts_pagerAll", false);
  if (pagerAll) {
    start = 0;
    pageSize = -1;
  }
  PageResult pageResult = null;
  if (isBlogPostType && isAllWorkspaceSearch) {
    pageResult = blogMgr.getBlogPostPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize, loggedMember, null);
  } else if (isWorkspaceOnlySearch) {
    pageResult = blogMgr.getBlogPostPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize, loggedMember, workspace);
  } else if (isMyBlogPostType) {
    pageResult = blogMgr.getBlogosphereMemberBlogPostPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize, loggedMember);
  }
  %>

  <% if (isMyBlogPostType) { %>
    <div class="well well-sm">
    <% if (blogMgr.hasMemberMadeRequest(loggedMember) && !blogMgr.isMemberRequestAccepted(loggedMember)) { %>
      <% if (blogMgr.isMemberRequestRejected(loggedMember)) { %>
        <jalios:icon src="cancel" /> <%= glp("jcmsplugin.blog.label.rejected-request") %>
      <% } else { %>
        <jalios:icon src="jcmsplugin-blog-pending-request" /> <%= glp("jcmsplugin.blog.label.pending-request") %>
      <% } %>
    <% } else if (blogMgr.canCreateBlogInBlogosphere(loggedMember)) { %>
      <a onclick="return false;" href="plugins/BlogPlugin/jsp/modal/addBlog.jsp?memberBlog=true" class="modal">
        <jalios:icon src="add" /> <%= glp("jcmsplugin.blog.label.blog-create") %>
      </a>
    <% } else if (blogMgr.canCreateBlogRequest(loggedMember)) { %>
      <a onclick="return false;" href="plugins/BlogPlugin/jsp/modal/blogRequest.jsp" class="modal">
        <jalios:icon src="add" title='jcmsplugin.blog.label.blog-request' /> <%= glp("jcmsplugin.blog.label.blog-request") %>
      </a>
    <% } %>
    </div>
  <% } %><%-- EOF.isMyBlogPostType --%>

  <jalios:pager name='pagerHandler' size='<%= pageResult.getTotalSize() %>' action='compute' />
  <div class="item-box">
  <table class="items">
    <jalios:foreach collection="<%= pageResult.getResultList() %>" type="BlogPost" name="itBlogPost" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
    <tr class="item">
      <td class="fit">
      <% if(itBlogPost.isInVisibleState()){ %>
        <% Date itemDate = itBlogPost.getPdate() != null ? itBlogPost.getPdate() : itBlogPost.getCdate(); %>
        <%@ include file="/jcore/doItemBoxDate.jspf" %> 
      <% }else{ %>
        <%= itBlogPost.getWFStateLabelHtml(userLang)%>
      <% } %>
      </td>
      <td class="item-photo fit">
        <% if(itBlogPost.getAuthor() != null){%>
          <jalios:memberphoto member="<%= itBlogPost.getAuthor() %>" size="<%= PhotoSize.ICON %>" />
        <% } %>
      </td>
      <td class="item-text">
        <% if(isLogged && !JcmsUtil.isSameId(loggedMember,itBlogPost.getAuthor()) && !itBlogPost.hasBeenReadBy(loggedMember)){ %>
          <span class="badge badge-new badge-small"><%= glp("jcmsplugin.blog.label.unread") %></span>
        <% } %>
        <jalios:link data='<%= itBlogPost %>' params='<%= !itBlogPost.isInVisibleState() ? "preview=true" : "" %>'/> 
        <% if(itBlogPost.getBlog() != null){ %>
        <jalios:link data="<%= itBlogPost.getBlog() %>" css="item-parent">(<%= itBlogPost.getBlog().getTitle(userLang,true) %>)</jalios:link>
        <% } %>
      </td>
    </tr>
    </jalios:foreach>
  </table>
  </div>
<jalios:pager name='pagerHandler' template='pqf' />

  <% if (Util.isEmpty(pageResult.getResultList())) { %>
    <p class="txt-center"><%= glp("jcmsplugin.blog.label.empty-search") %></p>
  <% } %>
<% } %><%-- EOF.(isBlogPostType || isMyBlogPostType) --%>

<% if (workspace.isCollaborativeSpace()) { %>
  <%
  Blog workspaceBlog = (Blog) blogMgr.getCollaborativeSpaceBlog(workspace, loggedMember);
  if (workspaceBlog != null && blogMgr.canPublishPostInBlog(loggedMember, workspaceBlog)) {
  %>
  <div class="item-box-footer">
    <jalios:link data="<%= workspaceBlog %>" params="blogDisplay=addPost" title='<%= glp("jcmsplugin.blog.label.add-blog-post-ws") %>'>
      <jalios:icon src="jcmsplugin-blog-blogpost-add" />
      <%= glp("jcmsplugin.blog.label.add-blog-post-ws") %>
    </jalios:link>
  </div>
  <% } %>
<% } %>
</div>