<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%--  
--%><%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

  Blog blog = (Blog) request.getAttribute("jcms.plugin.smartphone.fulldisplay.pub");
  
  if (blog == null) {
    blog = (Blog) getPublicationParameter("blogId");
  }
  
  if (blog == null) {
    return;
  }
  
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max",smartPhoneManager.getDefaultPageSize());
  
  PageResult<BlogPost> blogResult = blog.getBlogPostPageResult("pdate", true, skip, max,loggedMember,false,null);
%>
<jalios:foreach collection="<%= blogResult.getResultList() %>" type="BlogPost" name="itBlogPost" skip="<%= skip %>" max="<%= max %>">
  <div class="card card-news blogpost">
    <div class="card-item">
      <a data-role="none" href="<%= smartPhoneManager.getDataUrl(itBlogPost) %>">
        <h2 class="title"><%= itBlogPost.getTitle(userLang,true) %></h2>
        <% if (Util.notEmpty(itBlogPost.getAbstract())) { %>
          <p class="abstract">
            <%= itBlogPost.getAbstract() %>
          </p>
        <% } %>
        <div class="text-info"><%= itBlogPost.getAuthor() %> &middot; <jalios:date format="timeDateOrTime" date="<%= itBlogPost.getPdate() %>"/></div>
      </a>
    </div>
  </div>
</jalios:foreach>
<% if ((skip + max) < blogResult.getTotalSize()) {%>
  <a data-role="button" class="ui-btn-showmore ajax-refresh  ui-btn " data-jalios-ajax-action="plugins/BlogPlugin/smartphone/jsp/blogMore.jsp?blogId=<%= blog.getId() %>&amp;skip=<%= skip +max %>&amp;max=<%= max %>"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
<% } %>