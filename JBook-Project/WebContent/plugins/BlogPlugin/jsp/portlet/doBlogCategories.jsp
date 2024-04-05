<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %><%
%><%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogRights.jspf" %><%

Category catRoot = blogMgr.getBlogRootCategory(blog);
Comparator<Category> comparator = null;
Set<Category> categorySet = new TreeSet(comparator);
if (catRoot != null) {
  Set<Category> readRightCatSet = JcmsUtil.select(catRoot.getChildrenSet(), Category.getAuthorizedSelector(loggedMember), null);
  categorySet.addAll(readRightCatSet);
	if (catRoot.isCustomOrder()) {
	  comparator = Category.getOrderComparator(userLang);
	} else {
	  comparator = Category.getNameComparator(userLang);
	}
} else if (catRoot == null) {
  return;
}
if (Util.isEmpty(categorySet) && (!isAdminOrAuthor && !blogMgr.canAddCategories(loggedMember,blog))) {
  return;
}
boolean canEdit = false;
%>
<jalios:panel css="noTooltipCard panel-default blog-categories" title="jcmsplugin.blog.title.categories" picture="category">
  <ul class="item-box">
  <% if(Util.notEmpty(categorySet)){%>
  <jalios:foreach collection="<%= categorySet %>" type="Category" name="itCategory" >
    <%
    if(Util.notEmpty(loggedMember)){
      canEdit = blogMgr.canAddCategories(loggedMember,blog,itCategory);
    }
    int postCount = blog.getBlogPostByCategoryCount(loggedMember,itCategory);
    String param = "blogCatId="+itCategory.getId();
    %>
    <li class="blog-cat-lvl-1">
      <span class="item-info" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.label.post-in-cat", postCount, itCategory.getName(userLang))) %>"><%= postCount %></span>
      <jalios:link data="<%= blog %>" params="<%= param %>">
        <%= itCategory.getName(userLang) %>
      </jalios:link>
      <% if (canEdit) { %>
      <%
        String redirect = ServletUtil.encodeURL(ServletUtil.getUrl(request));
        String editUrl = "work/editCat.jsp?id=" + itCategory.getId() + "&amp;redirect=" + redirect;
        String deleteUrl = "work/editCat.jsp?opDelete=true&amp;id=" + itCategory.getId() + "&amp;redirect=" + redirect;
        String confirmDelete = glp("msg.js.confirm-delete", itCategory.getName(userLang));
      %>
      <div class="item-icons dropdown">
        <a data-toggle="dropdown" href="#"><jalios:icon src="caret"/></a>
        <ul class="dropdown-menu" role="menu">
          <li>
            <a title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.label.action.add-sub-category")) %>" class="modal" href="plugins/BlogPlugin/jsp/modal/addCategory.jsp?catId=<%= itCategory.getId() %>&amp;blogId=<%= blog.getId()%>">
              <jalios:icon src="add-small" /> <%= glp("ui.com.alt.add") %>
            </a>
          </li>
          <li>
            <a href="<%= editUrl %>" title="<%= encodeForHTMLAttribute(glp("ui.com.alt.edit")) %>">
              <jalios:icon src="edit-small" /> <%= glp("ui.com.alt.edit") %>
            </a>
          </li>
          <li>
            <a href="<%= HttpUtil.getUrlWithCSRFToken(deleteUrl,request,true) %>" class="modal confirm" data-jalios-text='<%= encodeForHTMLAttribute(confirmDelete) %>' title="<%= encodeForHTMLAttribute(glp("ui.com.alt.remove")) %>">
              <jalios:icon src="remove-small" /> <%= glp("ui.com.alt.remove") %>
            </a>
          </li>
        </ul>
      </div><%-- EOF .list-group-item-action --%>
      <% } %>
    </li><%-- EOF .list-group-item-level-1 --%>
    <%
    Comparator<Category> childrenComparator;
    if (itCategory.isCustomOrder()) {
      childrenComparator = Category.getOrderComparator(userLang);
    } else {
      childrenComparator = Category.getNameComparator(userLang);
    }
    Collection<Category> descendantSet = new TreeSet(childrenComparator);
    descendantSet.addAll(JcmsUtil.select(itCategory.getDescendantSet(), Category.getAuthorizedSelector(loggedMember), null));
    %>
    <jalios:foreach collection="<%= descendantSet %>" counter="itChildCounter" type="Category" name="itChildrenCategory" >
      <%
        param = "blogCatId="+itChildrenCategory.getId();
        if(Util.notEmpty(loggedMember)){
          canEdit = blogMgr.canAddCategories(loggedMember,blog,itCategory);
        }
        postCount = blog.getBlogPostByCategoryCount(loggedMember, itChildrenCategory);
      %>
      <li class="blog-cat-lvl-2">
        <span class="item-info" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.label.post-in-cat", postCount, itChildrenCategory.getName(userLang))) %>"><%= blog.getBlogPostByCategoryCount(loggedMember,itChildrenCategory) %></span>
        <jalios:link data="<%= blog %>" params="<%= param %>">
          <%= itChildrenCategory.getName(userLang) %>
        </jalios:link>
        <% if (canEdit) { %>
        <%
          String redirect = ServletUtil.encodeURL(ServletUtil.getUrl(request));
          String editUrl = "work/editCat.jsp?id=" + itChildrenCategory.getId() + "&amp;redirect=" + redirect;
          String deleteUrl = "work/editCat.jsp?opDelete=true&amp;id=" + itChildrenCategory.getId() + "&amp;redirect=" + redirect;
          String confirmDelete = glp("msg.js.confirm-delete", itChildrenCategory.getName(userLang));
        %>
        <div class="item-icons dropdown">
          <a data-toggle="dropdown" href="#"><jalios:icon src="caret"/></a>
          <ul class="dropdown-menu" role="menu">
          <li>
            <a title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.label.action.add-sub-category")) %>" class="modal" href="plugins/BlogPlugin/jsp/modal/addCategory.jsp?catId=<%= itCategory.getId() %>&amp;blogId=<%= blog.getId()%>">
              <jalios:icon src="add-small" /> <%= glp("ui.com.alt.add") %>
            </a>
          </li>
          <li>
            <a href="<%= editUrl %>" title="<%= encodeForHTMLAttribute(glp("ui.com.alt.edit")) %>">
              <jalios:icon src="edit-small" /> <%= glp("ui.com.alt.edit") %>
            </a>
          </li>
          <li>
            <a href="<%= HttpUtil.getUrlWithCSRFToken(deleteUrl,request,true) %>" class="modal confirm" data-jalios-text='<%= encodeForHTMLAttribute(confirmDelete) %>' title="<%= encodeForHTMLAttribute(glp("ui.com.alt.remove")) %>">
              <jalios:icon src="remove-small" /> <%= glp("ui.com.alt.remove") %>
            </a>
          </li>
          </ul>
        </div><%-- EOF .list-group-item-action --%>
        <% } %>
      </li><%-- EOF .list-group-item-level2 --%>
    </jalios:foreach>
  </jalios:foreach>
  <% } %>
  <%
    String param = "blogCatId="+catRoot.getId();
    int uncategorizedCount = blog.getBlogPostByCategoryCount(loggedMember,catRoot);
  %>
  <li>
    <span class="item-info" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.label.post-in-cat", uncategorizedCount, catRoot.getName(userLang))) %>"><%= uncategorizedCount %></span>
    <jalios:link data="<%= blog %>" params="<%= param %>">
      <%= glp("jcmsplugin.blog.title.no-category") %>
    </jalios:link>
  </li>
  </ul><%-- EOF .list-group --%>
  <% if (blogMgr.canAddCategories(loggedMember,blog)) { %>
    <jalios:buffer name="PANEL_FOOTER">
      <a onclick="return false;" href="plugins/BlogPlugin/jsp/modal/addCategory.jsp?catId=<%= catRoot.getId() %>&amp;blogId=<%= blog.getId()%>" class="modal">
        <jalios:icon src="add"/>
        <%= glp("jcmsplugin.blog.label.action.add-category") %>
      </a>
    </jalios:buffer>
  <% } %>
</jalios:panel>