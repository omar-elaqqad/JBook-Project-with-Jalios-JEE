<%@ page import="com.jalios.jcmsplugin.blog.*" %>
<%@ include file='/plugins/SmartPhonePlugin/jsp/workspace/doInitWorkspaceApplication.jspf' %><%
Blog blog = (Blog) Util.getFirst(workspace.getPublicationSet(Blog.class));
%>
<div id="service-workspace-blog" data-role="page" class="service-blog-page service-background-contrast" data-dom-cache="true">
  <smartphone:breadcrumb service="<%= service %>" workspace="<%= workspace %>" />
  <%@ include file='/plugins/SmartPhonePlugin/jsp/common/doServiceTopbarMenu.jspf' %>
  <div data-role="content">
    <% if (blog == null) { %>
      <jalios:message msg="jcmsplugin.blog.label.no-workspace-blog" dismissable="false"/>
    <% } else { %>
      <jalios:include jsp="plugins/BlogPlugin/smartphone/jsp/service/workspace/blogWorkspaceMore.jsp"/>
    <% } %>
  </div>  
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>