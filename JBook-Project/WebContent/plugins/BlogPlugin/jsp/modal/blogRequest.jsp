<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import="com.jalios.jcmsplugin.blog.*" %><% 
  BlogManager blogMgr = BlogManager.getInstance();
  Workspace blogosphereWs = channel.getWorkspace(BlogConstants.BLOGOSPHERE_VID);
%><jsp:useBean id='formHandler' scope='page' class='generated.EditBlogRequestHandler'>
	<jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
	<jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
	<jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='workspace' value='<%= blogosphereWs %>' />
	<jsp:setProperty name='formHandler' property='noRedirect' value='true' />
  <jsp:setProperty name='formHandler' property='ignoreWorkspaceCompliance' value='true' />
  <jsp:setProperty name='formHandler' property='author' value='$id.BlogRequest.formAuthor'/>
</jsp:useBean>
<% if(formHandler.validate()){ %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
  <% 
  return;
}%>
<%
  String titleValue = Util.notEmpty(formHandler.getAvailableTitle()) ? formHandler.getAvailableTitle() : glp("jcmsplugin.blog.label.the-blog-of",loggedMember) ;
%>
<jalios:modal formHandler="<%= formHandler %>" url="plugins/BlogPlugin/jsp/modal/blogRequest.jsp" title="jcmsplugin.blog.title.blog-request" picture="jcmsplugin-blog-modal-add-blog">
	<jalios:field formHandler="<%= formHandler %>" name="title" value="<%= titleValue %>">
		<jalios:control/>
	</jalios:field>
	<jalios:field formHandler="<%= formHandler %>" name="description">
		<jalios:control/>
	</jalios:field>
</jalios:modal>