<%@page import="com.jalios.jcms.a11y.A11YConstants"%><%
%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

BlogPostQueryHandler formHandler = (BlogPostQueryHandler) request.getAttribute("blogFormHandler");
if (formHandler == null) {
  logger.warn("doBlogPostResults.jsp: handler is null");
  return;
}
Blog blog = formHandler.getAvailableBlog();
if (blog == null) {
  logger.warn("doBlogPostResults.jsp: blog is null");
  return;
}

boolean isJNews = Util.getString(blog.getTemplate("full"), "").equals("full.default");
boolean isBlogJNewsMore = getBooleanParameter("isBlogJNewsMore", false);

int jnewsPageSize = 28; // 4 sections (3+4) of 7 items
int jnewsPageNumber = getIntParameter("blogJNewsPageNumber", 1);

// Update the expected pageSize and start given the JNews template
if (isJNews) {
  String jnewsStart = String.valueOf((jnewsPageNumber-1) * jnewsPageSize);
  formHandler.setBlogAppPager_pageSize(String.valueOf(jnewsPageSize));
  formHandler.setBlogAppPager_start(jnewsStart);
}

PageResult<BlogPost> pageResult = formHandler.getBlogPostPageResult();
boolean postSearched = hasParameter("opSearchBlogPost");
int blogPostsCount = blog.getBlogPostCount(loggedMember);
boolean blogWithoutPosts = blogPostsCount <= 0;
int prTotalSize = pageResult == null ? -1 : pageResult.getTotalSize();
boolean noResults = prTotalSize <= 0 || blogWithoutPosts;
boolean displayResults = postSearched || !blogWithoutPosts;
boolean displayResultsCount = postSearched && prTotalSize > 0;

BlogManager blogMgr = BlogManager.getInstance();
jcmsContext.addAvoidanceLink(A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID, glp("a11y.avoidance-link.content"));
%><%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogRights.jspf" %><%
String blogDescription = blog.getDescription(userLang);
boolean hasBlogDescription = Util.notEmpty(blogDescription);
%>

<% if (!isBlogJNewsMore) { %>
  <div class="Blog fulldisplay post-list<%= hasBlogDescription ? " has-description" : "" %>" itemscope="itemscope" itemtype="http://schema.org/Blog" <%
    %> id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>"<%
    if (jcmsContext.isDebug()) { %>
      data-jalios-blog-is-search='<%= postSearched %>'
      data-jalios-blog-results-total-size='<%= prTotalSize %>'
      data-jalios-blog-posts-total-size='<%= blogPostsCount %>'
      data-jalios-blog-without-posts='<%= blogWithoutPosts %>'
      data-jalios-blog-no-results='<%= noResults %>'
      data-jalios-blog-display-results='<%= displayResults %>'
    <% } %>>
    <% if (formHandler.isBlogDebug()) {
      BlogPostQueryBuilder queryBuilder = formHandler.getQueryBuilder();
      %><div class="blog-debug"><%
        %>BlogPostQueryBuilder: <code><%= queryBuilder %></code><br /><%
        %>pr.totalSize: <code><%= pageResult.getTotalSize() %></code><br /><%
      %></div><%
    } %>
    <% if (workspace.isCollaborativeSpace()) {
      %><div class="publication-header"><%
        %><h1 class="publication-title" <%= gfla(blog, "title") %> itemprop="name"><%
          %><%= blog.getTitle(userLang) %><%
        %></h1><%
        if (hasBlogDescription) {
          %><div class="description-toggler-wrapper"><%
            %><a href="#" class="blog-description-toggler toggle-blog-description"<%
                %> role="button"<%
                %> onclick="return false;"<%
                %> data-jalios-action="toggle:hide"<%
                %> data-jalios-target=".toggle-blog-description"<%
                %> title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.blog-desc.btn.show-more.title")) %>"><%
              %><%= glp("jcmsplugin.blog.label.blog.desc.show-more") %><%
              %>&nbsp;<jalios:icon src="caret-down" css="toggle-blog-description" /><%
            %></a><%
            %><a href="#" class="blog-description-toggler toggle-blog-description hide"<%
                %> role="button"<%
                %> data-jalios-action="toggle:hide"<%
                %> data-jalios-target=".toggle-blog-description"<%
                %> title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.blog-desc.btn.show-less.title")) %>"><%
              %><%= glp("jcmsplugin.blog.label.blog.desc.show-more") %><%
              %>&nbsp;<jalios:icon src="caret-up" css="toggle-blog-description hide" /><%
            %></a><%
          %></div><%
        }
      %></div><%
      if (hasBlogDescription) {
        %><div class="blog-description description-wrapper toggle-blog-description hide" itemprop="description"><%
          %><jalios:wysiwyg data="<%= blog %>" field="description"><%
            %><%= blogDescription %><%
          %></jalios:wysiwyg><%
        %></div><%
      }
    } %>
  
    <% if (blogWithoutPosts) { %>
      <jalios:buffer name="buttonBuffer">
        <% if (isDataWriteEnabled && canPublishPostInBlog) { %>
          <jalios:link data="<%= blog %>" params="blogDisplay=addPost" css="noTooltipCard btn btn-primary btn-add-blog-post">
            <%= glp("jcmsplugin.blog.label.action.add-post") %>
          </jalios:link>
        <% } %>
      </jalios:buffer>
      <%
      request.setAttribute("app.no-result.icon", "jcmsplugin-blog-onboarding");
      request.setAttribute("app.no-result.text", glp("jcmsplugin.blog.label.empty"));
      request.setAttribute("app.no-result.content", buttonBuffer);
      %>
      <%@ include file="/front/app/doAppNoResult.jspf" %>
    <% } else if (noResults) { %>
      <%@ include file="/front/app/doAppNoResult.jspf" %>
    <% } %>
<% } %>
  <% if (displayResults) { %>
    <% Publication backup = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION); %>
    
    <jalios:pager name='pagerHandler' declare='true' action='init'
        sort="<%= formHandler.getAvailableSort() %>"
        pageSize='<%= formHandler.getPageSize() %>'
        paramPrefix='<%= BlogPostQueryHandler.PARAM_PAGER_PREFIX %>'
        reverse='<%= formHandler.isReverse() %>' />
    <% if (displayResultsCount) {
      %><div class="navbar navbar-default navbar-results"><%
        %><div class="container-fluid"><%
          %><div class="navbar-header"><%
            %><a class="navbar-brand" href="#"><%
              %><%= glp("ui.work.query.txt.result", prTotalSize) %><%
            %></a><%
          %></div><%
        %></div><%
      %></div><%
    } %>
    <% if (isJNews) { %>
      <jalios:pager name='pagerHandler' pageSize="<%= jnewsPageSize %>" size='<%= prTotalSize %>' action='compute' />
      <%
      // BLOG-259: JNews template
      jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog-app-jnews.css");
      Collection<Publication> resultList = new ArrayList();
      //String layoutModel = "model3";
      //request.setAttribute("layoutModel", layoutModel);
      %>
      <%-- JNews result list --%>
      <jalios:foreach collection="<%= pageResult.getResultList() %>" type="BlogPost" name="itBlogPost" max='<%= jnewsPageSize %>' skip='<%= formHandler.getStart() %>'>
        <% resultList.add(itBlogPost); %>
      </jalios:foreach>
      <jalios:cardsData collection="<%= resultList %>" resource="cardsdata.jnews.predictive" />

      <%-- "See more" pagination --%>
      <%
      boolean doMorePubs = prTotalSize > (jnewsPageNumber * jnewsPageSize);
      if (doMorePubs) {
        Map<String, String> formParamMap = formHandler.getAllFormParameters();
        int newPageNumber = jnewsPageNumber+1;
        formParamMap.put("blogJNewsPageNumber", String.valueOf(newPageNumber));
        formParamMap.put("isBlogJNewsMore", Boolean.TRUE.toString());
        // AJAX-REFRESH PARAMS
        Map<String, String> ajaxParamsMap = new HashMap<>();
        ajaxParamsMap.putAll(formParamMap);
        // AJAX-REFRESH OPTIONS
        ObjectMapper objectMapper = new ObjectMapper();
        String ajaxParams = objectMapper.writeValueAsString(ajaxParamsMap);
        String ajaxOptions = "{"
          + MessageFormat.format(
              "\"params\" : {0}",
              ajaxParams)
          + "}";
        // AJAX HTML/DATA ATTRIBUTES
        DataAttribute ajaxDataAttr = new DataAttribute();
        ajaxDataAttr.addData("jalios-ajax-refresh", "isform");
        ajaxDataAttr.addData("jalios-ajax-refresh-inner", "#append-inner-id");
        ajaxDataAttr.addData("jalios-action", "ajax-refresh");
        ajaxDataAttr.addData("jalios-options", ajaxOptions);
        %><div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/BlogPlugin/types/Blog/doBlogFullDisplay.jsp"><%
          %><div id="append-inner-id"><%
            %><div class="pagination-wrapper"><%
              %><a href="#" onclick="return false;" class="btn btn-default" <%= ajaxDataAttr %>><%
               %><%= glp("ui.com.txt.more-results") %><%
             %></a><%
            %></div><%
          %></div><%
          %><%@ include file='/jcore/doAjaxFooter.jspf' %><%
        %></div><%
      } /* EOF.IF doMorePubs */
      %>
    <% } else { %>
      <jalios:pager name='pagerHandler' size='<%= prTotalSize %>' action='compute' />

      <%-- default result list --%>
      <jalios:foreach collection="<%= pageResult.getResultList() %>" type="BlogPost" name="itBlogPost" max='<%= pagerHandler.getPageSize() %>' skip='<%= pagerHandler.getStart() %>'>
        <% request.setAttribute(PortalManager.PORTAL_PUBLICATION, itBlogPost); %>
        <jalios:include jsp="/plugins/BlogPlugin/types/BlogPost/doBlogPostResultDisplay.jsp" />
      </jalios:foreach>
      <%-- standard paged pager --%>
      <jalios:pager name='pagerHandler' template='pqf'/>
    <% } %>
    <% request.setAttribute(PortalManager.PORTAL_PUBLICATION, backup); %>
  <% } %>
<% if (!isBlogJNewsMore) { %>
</div>
<% } %>
