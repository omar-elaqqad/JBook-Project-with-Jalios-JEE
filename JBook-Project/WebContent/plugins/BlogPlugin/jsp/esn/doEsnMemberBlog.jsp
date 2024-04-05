<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ page import="com.jalios.jcmsplugin.dbcomment.*" %><%
String esnProfileTab = getUntrustedStringParameter("esnProfileTab","");
boolean showBlog  = "blog".equals(esnProfileTab);
%>
<% if(showBlog && isAccount){ %>
<STYLE type="text/css">
  .displayHeaderToolbar{display:none;}
</STYLE>
<div class="">
<%
  Member profileMember = member;
  jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog.css");
  boolean isDataWriteEnabled = channel.isDataWriteEnabled();
  AbstractBlog blog = BlogManager.getInstance().getMemberBlog(profileMember);
  request.setAttribute("isEsnDisplay",true);
%>
<div class="fullDisplay Blog1">
  <div id="Blog" class="blog">
    <div id="column-container">
      <div class="main-column full">
        <%
          TreeSet sortedBlogSet = new TreeSet<AbstractBlog>(Publication.getTitleComparator(userLang));
          Set<AbstractBlog> blogSet = BlogManager.getInstance().getMemberBlogSet(profileMember,loggedMember);
          AbstractBlog selectedBlog = (AbstractBlog) getPublicationParameter("selectedBlogId");
          sortedBlogSet.addAll(blogSet);
        %>
        <% if(Util.getSize(sortedBlogSet) > 1){ %>
        <div class="well well-sm blog-esn-header">
          <form class="blogForm layout" name="blogForm" action="plugins/BlogPlugin/jsp/esn/doEsnMemberBlog.jsp" class="ajax-refresh blogForm">
            <%= glp("jcmsplugin.blog.tab.blog-choice") %>
            <select class="form-control" name="selectedBlogId"  data-jalios-action="ajax-refresh">
            <option value="all"><%= glp("jcmsplugin.blog.label.all-blog") %></span>
            <jalios:foreach collection="<%= sortedBlogSet %>" type="AbstractBlog" name="itBlog">
             <option <%= (selectedBlog == itBlog) ? "SELECTED" : "" %> value="<%= itBlog.getId() %>"><%= itBlog.getTitle(userLang,true) %></option>
            </jalios:foreach>
            </select>
            <input type="hidden" name="esnProfileTab" value="blog"/>
          </form>
          <% if(selectedBlog != null && selectedBlog.canBeReadBy(loggedMember)){ %>
             <span class="access-full-blog"><jalios:link data="<%= selectedBlog %>"><jalios:icon src="<%= selectedBlog.getDataIcon() %>" /> <%= glp("jcmsplugin.blog.label.access-blog",selectedBlog) %></jalios:link></span>
          <% }else if(blog != null && blog.getBlogPostCount() > 0 && blog.canBeReadBy(loggedMember)){ %>
             <span class="access-full-blog"><jalios:link data="<%= blog %>"><jalios:icon src="<%= blog.getDataIcon() %>" /> <%= glp("jcmsplugin.blog.label.access-full-blog") %></jalios:link></span>
          <% } %>
        </div>
        <% } else if (selectedBlog != null && selectedBlog.canBeReadBy(loggedMember)){ %>
        <div class="well well-sm blog-esn-header">
          <span class="access-full-blog"><jalios:link data="<%= selectedBlog %>"><jalios:icon src="<%= selectedBlog.getDataIcon() %>" /> <%= glp("jcmsplugin.blog.label.access-blog",selectedBlog) %></jalios:link></span>
        </div>
        <% } else if (blog != null && blog.getBlogPostCount() > 0 && blog.canBeReadBy(loggedMember)) { %>
        <div class="well well-sm blog-esn-header">
          <span class="access-full-blog"><jalios:link data="<%= blog %>"><jalios:icon src="<%= blog.getDataIcon() %>" /> <%= glp("jcmsplugin.blog.label.access-full-blog") %></jalios:link></span>
        </div>
        <% } %>
        <% if(selectedBlog != null){%>
        <div class="blog-header br">
          <h3><jalios:link data="<%= selectedBlog %>"><%= selectedBlog.getTitle(userLang,true) %></jalios:link></h3>
        </div>
        <%} %>
        <div class="main-column-content">
        <%
          DBCommentManager dbcommentMgr = DBCommentManager.getInstance();
          BlogManager blogMgr = BlogManager.getInstance();
          BlogPost blogPost = (BlogPost) jcmsContext.getAjaxRequestAttribute("blogPost");
          String blogCatId = getDataIdParameter("blogCatId");
          Category categorySelected = channel.getCategory(blogCatId);
          String searchedText = encodeForHTMLAttribute(getUntrustedStringParameter("searchedText",""));
          String blogDisplay = getUntrustedStringParameter("blogDisplay","");
          boolean postFullDisplay = false;
          %>
          <jalios:pager name='pagerHandler' declare='true' sort="pdate" pageSize='5' action='init' paramPrefix='blog_' reverse='true' />
          <%
          int start = getIntParameter("blog_start", 0);
          int pageSize = getIntParameter("blog_pageSize", 10);
          boolean pagerAll = getBooleanParameter("blog_pagerAll", false);
          if (pagerAll) {
             pageSize = -1;
          }
          PageResult pageResult = null;
          if (selectedBlog != null) {
            pageResult = blogMgr.getMemberBlogPostPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize,profileMember,loggedMember,selectedBlog);
          } else {
            pageResult = blogMgr.getMemberBlogPostPageResult(pagerHandler.getSort(), pagerHandler.isReverse(), start, pageSize,profileMember,loggedMember,blogSet);
          }
          %>
          <% if(pageResult != null && pageResult.getTotalSize() > 0){ %>
            <div class="post-container">
              <jalios:pager name='pagerHandler' size='<%= pageResult.getTotalSize() %>' action='compute' />
              <jalios:foreach collection="<%= pageResult.getResultList() %>" type="BlogPost" name="itBlogPost" max='<%= pagerHandler.getPageSize() %>' skip='<%= pagerHandler.getStart() %>'>
              <%
              boolean isAdminOrAuthor = isLogged && (isAdmin || itBlogPost.getBlog().isAuthor(loggedMember));
              BlogPost post = itBlogPost;
              %>
              <%@ include file='/plugins/BlogPlugin/jsp/doCommonBlogPost.jspf' %>
              </jalios:foreach>
              <jalios:pager name='pagerHandler'/>
            </div>
          <% } %>
        </div><!--  EOF main-column-content -->
      </div>
    </div><!-- EOF column-container -->
  </div><!-- EOF #Blog -->
</div>
</div>
<% } %>