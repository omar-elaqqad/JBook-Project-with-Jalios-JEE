<%@ page import="com.jalios.jcmsplugin.blog.*" %>
<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %> 
<%
String esnProfileTab = getUntrustedStringParameter("esnProfileTab","");

boolean showBlog  = "blog".equals(esnProfileTab);
request.setAttribute("esn.showBlog",showBlog);
  
int blogPostCount = Util.getSize(BlogManager.getInstance().getMemberBlogSet(member,loggedMember));

%>
<% if(blogPostCount > 0){ %>
    <li <%= showBlog ? "class='active'" : "" %>><a href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnProfileTab", "blog") %>"><span><%= glp("jcmsplugin.blog.label.blog") %></span></a></li>
<% } %>