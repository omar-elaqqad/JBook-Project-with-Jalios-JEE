<%@page import="com.jalios.jcms.handler.QueryHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.dbcomment.*" %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
  DBCommentManager dbcommentMgr = DBCommentManager.getInstance();
  BlogPost post = (BlogPost)request.getAttribute("publication");
  Blog blog = (Blog)post.getBlog();
 
  if (blog == null) {
      return;
  }
  
  if (blog.isInBlogosphere() && JcmsUtil.isSameId(loggedMember,blog.getAuthor()) && !BlogManager.getInstance().checkAgreement(loggedMember)) {
    sendRedirect("plugins/BlogPlugin/jsp/agreement.jsp?blogId="+blog.getId());
    return;  
  }
  
  QueryHandler qh = new QueryHandler();
  qh.setTypes(new String[] { BlogPost.class.getSimpleName() });
  qh.setSearchInDB(true);
  qh.setSort("pdate");
  qh.setLoggedMember(loggedMember);
  Collection pubRelatedCollection = QueryManager.getInstance().getRelatedPublicationSet(post, qh);
  int pubRelatedMax = 4;
  
  request.setAttribute("jcmsplugin.blog.blog",blog); 
  jcmsContext.setAjaxRequestAttribute("jcmsplugin.blog.blog",blog.getId());
  request.setAttribute("jcmsplugin.blog.blogPost",post);
  request.setAttribute("skipFooter",true);
  
  jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog.css");
%>
<div id="Blog" itemscope="itemscope" itemtype="http://schema.org/Blog" class="fullDisplay Blog container-fluid <%= !post.isInVisibleState() ? "notVisible" : "" %>">
  <%@ include file='/plugins/BlogPlugin/jsp/doCommonBlogHeader.jspf' %>
  <div id="column-container" class="row">
    <div class="main-column col-sm-9">
      <div class="main-column-content">
        <jalios:include id="$id.jcmsplugin.blog.portlet.post-full"/>
        <%@ include file="/front/publication/doPublicationRelated.jspf" %>
        <%-- REPLACED FOOTER --%>
        <div class="fulldisplay-footer">
          <jalios:include jsp="/front/vote/doVoteFooter.jsp" />
          <%-- *** PLUGINS ***************** --%><%
          %><jalios:include target="DISPLAY_FOOTER" /><%
        %></div>
      </div><!--  EOF main-column-content -->
    </div>
    <% if(!jcmsContext.isPrintView()){ %>
      <%@ include file='/plugins/BlogPlugin/jsp/doSideColumn.jspf' %>
    <% } %>
  </div><!-- EOF column-container -->
</div><!-- EOF #Blog -->