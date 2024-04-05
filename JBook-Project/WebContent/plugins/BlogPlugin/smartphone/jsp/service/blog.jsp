<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%-- 
--%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%  
  request.setAttribute("jcms.plugin.smartphone.topbar.title",glp("jcmsplugin.smartphone.service.blog"));
  SmartPhoneService service = new DefaultSmartPhoneService("jcmsplugin.smartphone.service.blog");
  if (!service.isEnabled(jcmsContext)) {
    sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
    return;
  }
%>
<div id="service-blog" data-role="page" data-dom-cache="true" class="service-blog-page">
  <div class="colored-banner">
    <smartphone:breadcrumb service="<%= service %>" />
  </div>
  <div class="nav-menu">
    <div data-role="navbar">
      <ul class="menu" >
        <li><a class="ui-btn-active ui-state-persist" data-jalios-navmenu-target=".blogposts"><%= glp("jcmsplugin.blog.smartphone.lbl.blogpost-list") %></a></li>
        <li><a data-jalios-navmenu-target=".blog-list"><%= glp("jcmsplugin.blog.smartphone.lbl.blog") %></a></li>
      </ul>
    </div>
    <div class="nav-menu-container service-blogposts-content-all blogposts fade in service-background-contrast" data-role="content">
      <jalios:include jsp="plugins/BlogPlugin/smartphone/jsp/service/allBlogPostsMore.jsp"/>
    </div>    
    <div class="nav-menu-container service-blog-content-mine blog-list hide fade in" data-role="content">
      <ul data-role="listview">
        <%
          Set<AbstractBlog> blogSet = new TreeSet(Publication.getTitleComparator(userLang));
          blogSet.addAll(BlogManager.getInstance().getMemberBlogSet(loggedMember));
          if (Util.notEmpty(blogSet)) {
        %>
          <li data-role="list-divider"><%= glp("jcmsplugin.blog.smartphone.lbl.blog.my-blogs") %></li>
          <jalios:foreach collection="<%= blogSet %>" type="Blog" name="itBlog">
            <smartphone:listItem data="<%= itBlog %>" />
          </jalios:foreach>
        <% } %>
        <li data-role="list-divider"><%= glp("jcmsplugin.blog.smartphone.lbl.blog.other-blogs") %></li>
        <jalios:include jsp="plugins/BlogPlugin/smartphone/jsp/service/otherBlogMore.jsp"/>
      </ul>
    </div>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>