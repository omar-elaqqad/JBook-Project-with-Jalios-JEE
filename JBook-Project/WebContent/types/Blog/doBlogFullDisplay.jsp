<%@ page contentType="text/html; charset=UTF-8"         %><%
%><%@ include file='/jcore/doInitPage.jspf'              %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf'  %>
<%@ page import="com.jalios.jcmsplugin.blog.*" %><% %><% 
	Blog blog = (Blog) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
	
	request.setAttribute("jcmsplugin.blog.blog",blog); 
	jcmsContext.setAjaxRequestAttribute("jcmsplugin.blog.blog",blog.getId());
	
	String blogDisplay = getUntrustedStringParameter("blogDisplay","");
	
	if (blog.isInBlogosphere() && JcmsUtil.isSameId(loggedMember,blog.getAuthor()) && !BlogManager.getInstance().checkAgreement(loggedMember)) {
	  sendRedirect("plugins/BlogPlugin/jsp/agreement.jsp?blogId="+blog.getId());
	  return;  
	}
	
	request.setAttribute("skipFooter",true);
	
  jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog.css");
%>
<div id="Blog" itemscope="itemscope" class="fullDisplay Blog container-fluid" itemtype="http://schema.org/Blog">
	<%@ include file='/plugins/BlogPlugin/jsp/doCommonBlogHeader.jspf' %>             
	<div id="column-container" class="row">
		<div class="main-column col-sm-9">        
	    <div class="main-column-content">
	    <jalios:include target="BLOG_FULLDISPLAY_CONTENT_TOP" targetContext="bloc" />
	    <% if("addPost".equals(blogDisplay)){ %>
		    <jalios:include id="$id.jcmsplugin.blog.portlet.add-post"/>
	    <% }else if("posts".equals(blogDisplay)){ %>
		    <jalios:include id="$id.jcmsplugin.blog.portlet.handle-posts"/>
	    <% }else{ %>
		    <jalios:include id="$id.jcmsplugin.blog.portlet.post-list"/>
	    <% } %>     
	    <jalios:include target="BLOG_FULLDISPLAY_CONTENT_BOTTOM" targetContext="bloc" />
	    </div><!--  EOF main-column-content -->
	</div>
	<%@ include file='/plugins/BlogPlugin/jsp/doSideColumn.jspf' %>
	</div><!-- EOF column-container -->
</div><!-- EOF #Blog -->