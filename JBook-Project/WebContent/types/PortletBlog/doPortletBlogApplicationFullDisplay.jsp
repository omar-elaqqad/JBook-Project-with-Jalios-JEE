<%@page import="com.jalios.jtaglib.DateTag"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

PortletBlog obj = (PortletBlog)portlet;

jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog-full-display.css");

%><%@ include file='/front/doFullDisplay.jspf' %><% 
  String selectedSort = getUntrustedStringParameter("blogpost_sort","pdate");
%><jalios:pager name="pagerHandler" action="init" declare='true' sort="<%= selectedSort %>" paramPrefix='blogpost_'  reverse='true' /><%  
  int start = getIntParameter("blogpost_start", 0);
  int pageSize = getIntParameter("blogpost_pageSize", 10);
  
  boolean pagerAll = getBooleanParameter("blogpost_pagerAll", false);
  if(pagerAll){
    start = 0;
    pageSize = -1;
  }

  boolean isVirtualDesktopService = Util.notEmpty(request.getAttribute("jcmsplugin.virtualdesktop.service-id"));
  
  Set<Blog> blogSet = Util.interSet(channel.getPublicationSet(Blog.class, loggedMember), workspace.getPubSet());
  Blog blog = (Blog) Util.getFirst(blogSet);
  
  Set<AbstractBlog> wsBlogSet = Util.interSet(channel.getPublicationSet(AbstractBlog.class, loggedMember), workspace.getPubSet());
  PageResult<BlogPost> blogPostPageResult = BlogManager.getInstance().getBlogPostPageResult(selectedSort, true, start, pageSize, loggedMember, obj.getDisplayedList().equals("workspaceOnly") ? workspace : null);
  if (!isVirtualDesktopService && blog != null && workspace.isCollaborativeSpace()){ 
    sendRedirect(blog);
    return;
  }
  boolean canCreateWsBlog = channel.isDataWriteEnabled() && BlogManager.getInstance().canCreateBlog(loggedMember, workspace);
  boolean hasWsBlog = Util.notEmpty(wsBlogSet);
  %>
  <jalios:buffer name="createWSBlog">
    <% if (canCreateWsBlog) { %>
    <div class="no-ws-blog br">
      <jalios:buffer name="buttonBuffer">
        <a onclick="return false;" href="plugins/BlogPlugin/jsp/modal/addBlog.jsp" class="btn btn-primary modal">
          <%= glp("jcmsplugin.blog.label.activate-blog") %>
        </a>
      </jalios:buffer>
      <%
      request.setAttribute("app.no-result.icon", "jcmsplugin-blog-not-activated");
      request.setAttribute("app.no-result.text", glp("jcmsplugin.blog.label.no-blog-under-ws"));
      request.setAttribute("app.no-result.content", buttonBuffer);
      %>
      <%@ include file="/front/app/doAppNoResult.jspf" %>
    </div>  
    <% } %>
  </jalios:buffer>  
  <%
  if (blogPostPageResult.getTotalSize() > 0){ %>
  <jalios:pager name='pagerHandler' size='<%= blogPostPageResult.getTotalSize() %>' action='compute' />
  <div class="blog-portlet">

    <%-- Create WS Blog UI --%>
    <%= createWSBlog %>

    <%-- BLOG-274: displays posts only if WS has a blog --%>
    <% if (hasWsBlog) { %>
    <div class="post-list row">
      <jalios:foreach type="BlogPost" collection="<%= blogPostPageResult.getResultList() %>" name="itBlogPost" max='<%= pagerHandler.getPageSize() %>'  skip='<%= pagerHandler.getStart() %>'>
        <div class="col-md-3">
          <jalios:panel>
            <b><jalios:link data="<%= itBlogPost %>"/></b>
            <% Publication pub = itBlogPost; %>
            <div class="media">
              <% if (itBlogPost.getDataImage() != null) { %>
              <div class="pull-left">
                <jalios:thumbnail css="thumbnail" path="<%= itBlogPost.getDataImage() %>"></jalios:thumbnail>  
              </div>
              <% } %>
              <div class="media-body">
                <%@ include file="/front/publication/doPublicationAbstract.jspf" %>
              </div>
            </div>
            <div class="text-info">
              <jalios:memberphoto size="<%= PhotoSize.ICON %>" member="<%= itBlogPost.getAuthor() %>"/> &middot; <jalios:date format="dateOrTime" date="<%= itBlogPost.getPdate() %>"/> &middot; <jalios:link data="<%= itBlogPost.getBlog() %>" />
            </div>            
          </jalios:panel>
        </div>
      </jalios:foreach>
    </div> 
    <jalios:pager name="pagerHandler" />
    <% } %>
  </div>
<% }else{ %>
  <div class="blog-portlet">
    <%-- Create WS Blog UI --%>
    <%= createWSBlog %>
  </div>
<% } %>