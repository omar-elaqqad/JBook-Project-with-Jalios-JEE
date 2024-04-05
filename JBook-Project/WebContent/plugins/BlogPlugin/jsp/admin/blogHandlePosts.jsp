<%@page import="com.jalios.jcms.a11y.A11YConstants"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %><%
%><jalios:include jsp="plugins/BlogPlugin/jsp/admin/blogHandlePosts_initHandler.jsp" /><%
BlogHandlePostsHandler formHandler = (BlogHandlePostsHandler) request.getAttribute(BlogHandlePostsHandler.class.getSimpleName());
if (formHandler == null) {
  logger.warn("blogHandlePosts.jsp: handler is null");
  return;
}
if (!formHandler.canHandlePosts()) {
  sendForbidden(request, response);
  return;
}
formHandler.addFrontEndDependencies();
boolean displayAuthors = !blogMgr.isBlogInBlogosphere(blog);
boolean displayWorkspace = !formHandler.isWorkspaceOnly();
%><jalios:pager name='pagerHandler' declare='true' action='init'
        sort="<%= formHandler.getAvailableSort() %>"
        pageSize='<%= formHandler.getPageSize() %>'
        paramPrefix='<%= BlogPostQueryHandler.PARAM_PAGER_PREFIX %>'
        parameterMap='<%= formHandler.getPagerParameterMap() %>'
        reverse='<%= formHandler.isReverse() %>' /><%
PageResult<BlogPost> pageResult = formHandler.getBlogPostPageResult();
%><jalios:pager name='pagerHandler' size='<%= pageResult.getTotalSize() %>' action='compute' /><%
int postsCount = pageResult.getTotalSize();
String breadcrumbLabel = glp("jcmsplugin.blog.label.blog-post-count", postsCount);
List<BlogPost> postList = pageResult.getResultList();
String refreshUrl = "plugins/BlogPlugin/jsp/admin/blogHandlePosts.jsp";
jcmsContext.addAvoidanceLink(A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID, glp("a11y.avoidance-link.content"));
%><div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>"><%
  if (formHandler.isBlogDebug()) {
    BlogPostQueryBuilder queryBuilder = formHandler.getQueryBuilder();
    %><div class="blog-debug"><%
      %>formHandler: <code><%= formHandler %></code><br /><%
      %>BlogPostQueryBuilder: <code><%= queryBuilder %></code><br /><%
      %>pr.totalSize: <code><%= pageResult.getTotalSize() %></code><br /><%
      %>Util.getSize(postList): <code><%= Util.getSize(postList) %></code><br /><%
      %>max: pagerHandler.getPageSize(): <code><%= pagerHandler.getPageSize() %></code><br /><%
      %>skip: pagerHandler.getStart(): <code><%= pagerHandler.getStart() %></code><br /><%
    %></div><%
  }
  %><div class="blog-handle-posts manage-blog-posts blog-admin pub-handle"<%
      %> id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>"<%
      %>><%
    if (Util.notEmpty(postList)) {
      %><div class="navbar navbar-default navbar-handle-posts"><%
        %><div class="container-fluid"><%
          %><div class="navbar-header"><%
            %><a class="navbar-brand" href="#"><%
              %><%= breadcrumbLabel %><%
            %></a><%
          %></div><%
        %></div><%
      %></div><%
      %><div class="table-responsive blogpost-list"><%
        %><table class="table table-data table-app"><%
          %><caption class="sr-only"><%
            %><%= glp("jcmsplugin.blog.manage-posts.table-caption") %><%
          %></caption><%
          %><thead><%
            %><tr class="align-top"><%
              %><td class="fit col-blogpost-index"></td><%
              %><th scope="col" class="col-blogpost-pstatus"><%
                %><jalios:pager name='pagerHandler' action='showSort'
                    sort='pstatus' sortTitle='comparator.pqf.pstatus'/><%
              %></th><%
              %><th scope="col" class="title col-blogpost-title nowrap"><%
                %><jalios:pager name='pagerHandler' action='showSort'
                    sort='title' sortTitle='jcmsplugin.blog.label.title'/><%
              %></th><%
              if (displayAuthors) {
                %><th scope="col" class="col-blogpost-author"><%
                  %><%= glp("ui.com.lbl.author") %><%
                %></th><%
              }
              if (displayWorkspace) {
                %><th scope="col" class="col-blogpost-workspace"><%
                  %><%= glp("ui.com.lbl.workspace") %><%
                %></th><%
              }
              %><th scope="col" class="fit nowrap col-blogpost-reader-count"><%
                %><jalios:pager name='pagerHandler' action='showSort'
                    sort='reader' sortTitle='jcmsplugin.blog.label.stats.unique-visit'/><%
              %></th><%
              %><th scope="col" class="fit nowrap col-blogpost-access-count"><%
                %><%= glp("jcmsplugin.blog.label.stats.visit-count") %><%
              %></th><%
              %><th scope="col" class="fit nowrap col-blogpost-vote-count"><%
                %><jalios:pager name='pagerHandler' action='showSort'
                    sort='voteScore' sortTitle='jcmsplugin.blog.admin.handle.vote-count'/><%
              %></th><%
              %><th scope="col" class="fit nowrap col-blogpost-comment-count"><%
                %><%= glp("jcmsplugin.blog.admin.handle.comment-count") %><%
              %></th><%
              %><th scope="col" class="nowrap col-blogpost-date"><%
                %><jalios:pager name='pagerHandler' action='showSort'
                    sort='mdate' sortTitle='ui.com.lbl.mdate'/><%
              %></th><%
              %><td class="fit col-blogpost-edit"></td><%
            %></tr><%
          %></thead><%
          %><tbody><%
            %><jalios:foreach collection="<%= postList %>" type="BlogPost"
                name="itBlogPost" max='<%= pagerHandler.getPageSize() %>'
                skip='<%= pagerHandler.getStart() %>'><%
              int readerCount = itBlogPost.getReaderCount();
              int accessCount = itBlogPost.getAccessCount();
              int voteCount = itBlogPost.getVoteCount();
              int dbCommentCount = formHandler.getDBCommentCount(itBlogPost);
              // v9.3
              // Date postDate = itBlogPost.getPdate() != null ? itBlogPost.getPdate() : itBlogPost.getCdate();
              // v9.4
              Date postDate = itBlogPost.getMdate();
              DataAttribute postDataAttr = new DataAttribute();
              if (formHandler.isBlogDebug()) {
                postDataAttr.addData("jalios-blog-post-blog", JcmsUtil.dataToString(itBlogPost.getBlog()));
                postDataAttr.addData("jalios-blog-post-ws", JcmsUtil.dataToString(itBlogPost.getWorkspace()));
                postDataAttr.addData("jalios-blog-post-pstatus", itBlogPost.getPstatus());
                postDataAttr.addData("jalios-blog-post-cdate", itBlogPost.getCdate());
                postDataAttr.addData("jalios-blog-post-pdate", itBlogPost.getPdate());
                postDataAttr.addData("jalios-blog-post-udate", itBlogPost.getUdate());
                if (itBlogPost.getHasAttachWS()) {
                  postDataAttr.addData("jalios-blog-post-attachWSSet",Util.getSize(itBlogPost.getAttachWorkspaceSet()));
                }
              }
            %><tr class="align-top pstatus-<%= itBlogPost.getPstatus()%>" <%= postDataAttr %>><%
              %><td class="col-blogpost-index numeric fit"><%
                %><%= pagerHandler.getStart() + itCounter.intValue() %>.<%
              %></td><%
              %><td class="col-blogpost-pstatus pstatus fit"><%
                %><%= itBlogPost.getWFStateLabelHtml(userLang) %><%
              %></td><%
              %><td class="col-blogpost-title name"><%
                %><jalios:link data="<%= itBlogPost %>" params='<%= !itBlogPost.isInVisibleState() ? "preview=true" : "" %>'><%
                  %><jalios:dataicon data="<%= itBlogPost %>"/><%
                  %> <%= itBlogPost.getTitle(userLang) %><%
                %></jalios:link><%
              %></td><%
              if (displayAuthors) {
                %><td class="col-blogpost-author"><%
                  %><jalios:memberphoto member="<%= itBlogPost.getAuthor() %>" css="pull-left" size="<%= PhotoSize.ICON %>" /><%
                  %>&nbsp;<jalios:link data="<%= itBlogPost.getAuthor() %>" /><%
                %></td><%
              }
              if (displayWorkspace) {
                %><td class="col-blogpost-workspace"><%
                  %><jalios:dataicon data="<%= itBlogPost.getWorkspace() %>"/><%
                  %> <%= itBlogPost.getWorkspace().getTitle(userLang) %><%
                %></td><%
              }
              %><td class="col-blogpost-reader-count reader-count numeric"><%
                %><%= readerCount %><%
              %></td><%
              %><td class="col-blogpost-access-count access-count numeric"><%
                %><%= accessCount %><%
              %></td><%
              %><td class="col-blogpost-vote-count vote-count numeric"><%
                %><%= voteCount %><%
              %></td><%
              %><td class="col-blogpost-comment-count comment-count numeric"><%
                %><%= dbCommentCount %><%
              %></td><%
              %><td class="col-blogpost-date date-time fit"><%
                %><jalios:date date='<%= postDate %>' format='timeDateOrTime' /><%
              %></td><%
              %><td class="col-blogpost-edit edit fit"><%
                %><jalios:edit data='<%= itBlogPost %>' css="btn btn-rounded blog-btn" icon="more-v" /><%
              %></td><%
            %></tr><%
          %></jalios:foreach><%
        %></tbody><%
      %></table><%
    %></div><%-- EOF.table-responsive --%><%
    %><jalios:pager name="pagerHandler" /><%
  } else {
    %><jalios:message msg="jcmsplugin.blog.label.no-posts" /><%
  }
  %></div><%
  %><%@ include file='/jcore/doAjaxFooter.jspf' %><%
%></div><%-- EOF.ajax-refresh-div<%
--%>