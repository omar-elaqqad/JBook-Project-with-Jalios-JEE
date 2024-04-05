<%@page import="com.jalios.jcmsplugin.blog.BlogManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%--  
--%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  BlogManager blogMgr = BlogManager.getInstance();
  
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max",smartPhoneManager.getDefaultPageSize());
  
  workspace = getWorkspaceParameter("workspaceId");

  if (Util.isEmpty(workspace)) {
    workspace = (Workspace) request.getAttribute("jcms.plugin.smartphone.workspace");
  }
  
  Blog blog = (Blog) Util.getFirst(workspace.getPublicationSet(Blog.class));
  
  if (blog == null) {
    return;
  }
  
  PageResult<BlogPost> postResult = blog.getBlogPostPageResult("pdate", true, skip, max, loggedMember, false, null);
%>
<jalios:foreach collection="<%= postResult.getResultList() %>" type="BlogPost" name="itBlogPost" skip="<%= skip %>" max="<%= max %>">
  <jalios:cardData data="<%= itBlogPost %>" template="jmobile-detailed" css="has-rounded-corners"/>
</jalios:foreach>
<% if ((skip + max) < postResult.getTotalSize()) {%>
  <a data-jalios-ajax-action="plugins/BlogPlugin/smartphone/jsp/service/workspace/blogWorkspaceMore.jsp?workspaceId=<%= workspace.getId() %>&amp;skip=<%= skip +max %>&amp;max=<%= max %>" data-role="button" class="ajax-refresh ui-btn ui-btn-showmore"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
<% } %>