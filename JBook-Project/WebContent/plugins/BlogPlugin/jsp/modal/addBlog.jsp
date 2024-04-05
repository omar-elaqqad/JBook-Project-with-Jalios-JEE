<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%  
	BlogManager blogMgr = BlogManager.getInstance();
	Workspace blogosphereWs = channel.getWorkspace(BlogConstants.BLOGOSPHERE_VID);
	Workspace blogWorkspace = (getBooleanParameter("memberBlog",false) || getBooleanParameter("isMemberBlogAdd",false)) && blogMgr.canCreateBlogInBlogosphere(loggedMember) ? blogosphereWs : workspace;
%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditBlogHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='workspace' value='<%= blogWorkspace %>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
  <jsp:setProperty name='formHandler' property='ignoreWorkspaceCompliance' value='true' />
</jsp:useBean>
<% if(formHandler.validate()){
	if(formHandler.getPublication() != null){
		request.setAttribute("modal.redirect", formHandler.getPublication().getDisplayUrl(userLocale));
	}
%>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<%  
  formHandler.prepare();
	boolean isMemberBlogAdd = getBooleanParameter("memberBlog",false) || getBooleanParameter("isMemberBlogAdd",false);
  String modalTitle = isMemberBlogAdd ? glp("jcmsplugin.blog.label.blog-create") : glp("jcmsplugin.blog.label.blog-ws-create");
%>
<jalios:modal title="<%= modalTitle %>" url="plugins/BlogPlugin/jsp/modal/addBlog.jsp" formHandler="<%= formHandler %>">
	<jalios:field name="title" formHandler="<%= formHandler %>" value="<%= Util.isEmpty(formHandler.getAvailableTitleML()) ? blogMgr.getBlogTitleLangMap(isMemberBlogAdd ? blogosphereWs : workspace) : formHandler.getAvailableTitleML() %>">
		<jalios:control/>
	</jalios:field>
	
	<jalios:field name="description" formHandler="<%= formHandler %>" >
		<jalios:control/>
	</jalios:field>

  <% if (!isMemberBlogAdd) { %>
    <jalios:field name="cids" label="jcmsplugin.blog.blog-root.label" description="jcmsplugin.blog.blog-root.description" value='<%= formHandler.getCategorySet("cids") %>' >
      <jalios:control settings="<%= new CategoryTreeSettings().root(workspace.getCatSet()).disableSearch().radio().level(2) %>"/>
    </jalios:field>
  <% } %>
  
  <%= formHandler.getHiddenField("author", loggedMember.getId()) %>
  <%= formHandler.getHiddenField("isMemberBlogAdd", isMemberBlogAdd) %>
</jalios:modal>