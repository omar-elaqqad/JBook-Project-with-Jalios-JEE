<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import="com.jalios.jcmsplugin.blog.*" %>
<%  
	Blog blog = getDataParameter("blogId",Blog.class);
	
	if(!loggedMember.canWorkOn(blog) || !channel.isDataWriteEnabled()){ 
		sendForbidden(request, response);
		return;
	}
String intro = glp("jcmsplugin.blog.admin.add-authors-description", blog.getTitle(userLang));
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.blog.EditBlogAuthorHandler'>
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='blog' value="<%= blog %>"/>
  <jsp:setProperty name='formHandler' property='loggedMember' value="<%= loggedMember %>"/>
</jsp:useBean>
<% if (formHandler.validate() || blog == null || blog.getBloggerGroup() == null) { %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal op="opUpdate" button="ui.com.btn.save" title="jcmsplugin.blog.admin.add-authors" url="plugins/BlogPlugin/jsp/modal/handleAuthors.jsp" formHandler="<%= formHandler %>">
	
  <jalios:message dismissable="false" title=""><%
	  %><%= intro %><%
  %></jalios:message>
	
	<jalios:field name="authors" mv="1" keyword="true" value="<%= formHandler.getAvailableAuthors() %>" resource="field-inline">
    <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
	</jalios:field>		 	
	
	<input type="hidden" name="blogId" value="<%= blog.getId() %>"/>
	
</jalios:modal>