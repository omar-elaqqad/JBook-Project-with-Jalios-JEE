<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %><%
%><%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogRights.jspf" %><%
  if (blog == null || blogMgr.isBlogInBlogosphere(blog)) {
    return;
  }
  Set<Member> memberSet = blog.getBlogAuthorSet(loggedMember);
  if (Util.isEmpty(memberSet)) {
    return;
  }
  Map pagerMap = new HashMap();
  pagerMap.put("blogId",blog.getId());
%>
<jalios:panel title="jcmsplugin.blog.title.authors" css="panel-default blog-authorlist" picture="member">
  <jalios:pager name='pagerHandler' declare='true' pageSize='5' action='init' paramPrefix='blog_' parameterMap='<%= pagerMap %>' />
  <jalios:pager name='pagerHandler' size='<%= memberSet.size() %>' action='compute' />
  <ul class="item-box">
  <jalios:foreach name='itAuthor' type='Member' collection='<%= memberSet %>' max='<%= pagerHandler.getPageSize() %>' skip='<%= pagerHandler.getStart() %>'>
  <li>
    <div class="media blog-authorlist-item">
      <jalios:memberphoto css="pull-left" member="<%= itAuthor %>" size="<%= PhotoSize.TINY %>" />
      <div class="author-infos media-body">
        <jalios:link data="<%= itAuthor %>" />
      </div>
    </div>
  </li>
  </jalios:foreach>
  </ul>
  <jalios:pager name='pagerHandler' template='pqf'/>
  <% if(isDataWriteEnabled && isLogged && loggedMember.canWorkOn(blog) && blog.getBloggerGroup() != null ){ %>
  <jalios:buffer name="PANEL_FOOTER">
    <a href="plugins/BlogPlugin/jsp/modal/handleAuthors.jsp?blogId=<%= blog.getId() %>" class="modal">
      <jalios:icon src="group-add" /> <%= glp("jcmsplugin.blog.admin.add-authors") %>
    </a>
  </jalios:buffer>
  <% } %>
</jalios:panel>