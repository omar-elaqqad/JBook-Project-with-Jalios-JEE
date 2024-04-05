<%@ page contentType="text/html; charset=UTF-8" %><%----%>
<%----%><%@ include file='/jcore/doInitPage.jspf' %><%----%>
<%@ page import="com.jalios.jcmsplugin.blog.*" %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.blog.EditBlogCategoryHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
  <jsp:setProperty name='formHandler' property='id' value='<%= null %>' />
</jsp:useBean>
<% 
    String catId = getDataIdParameter("catId");
    String blogId = getDataIdParameter("blogId");
    Category cat = channel.getCategory(catId);
    Blog blog = (Blog) channel.getPublication(blogId);
%>
<% if (formHandler.validate() || cat == null || blog == null) { %>
    <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<%
    Category blogRootCat = BlogManager.getInstance().getBlogRootCategory(blog);
    boolean isSubCat = blogRootCat != cat;
    
    String modalTitle = isSubCat ? glp("jcmsplugin.blog.title.add-sub-cat",cat.getName(userLang,true)) : glp("jcmsplugin.blog.title.add-cat");
%>
<jalios:modal css="modal-md blog-addcategory" op="opCreate" button="ui.com.btn.create" formHandler="<%= formHandler %>" title="<%= modalTitle %>" picture="plugins/BlogPlugin/images/butt_add_32.png" url="plugins/BlogPlugin/jsp/modal/addCategory.jsp">
	<div class="alert alert-info">
		<%= glp("jcmsplugin.blog.label.add-cat") %>
	</div>      
  <%= formHandler.getHiddenField("catId", catId) %>
  <%= formHandler.getHiddenField("blogId", blogId) %>
  <%= formHandler.getHiddenField("catRootId", catId) %>
	<jalios:field name="catName">
	  <jalios:control type="<%= ControlType.TEXTFIELD %>"/>
	</jalios:field>		
</jalios:modal>