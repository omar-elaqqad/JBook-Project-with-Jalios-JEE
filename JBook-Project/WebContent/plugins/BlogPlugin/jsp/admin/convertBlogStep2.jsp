<%@ include file="/jcore/doInitPage.jspf" %>
<jsp:useBean id="loadHandler" scope="page" class="com.jalios.jcmsplugin.blog.LoadBlog411DataHandler"> 
  <jsp:setProperty name="loadHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="loadHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name='loadHandler' property='*' />
</jsp:useBean>
<%
if (loadHandler.validate()) {
  return;
}
%>
<%@ include file="/admin/doAdminHeader.jspf" %>

<div class="page-header"><h1><%= glp("jcmsplugin.blog.tools.title")%></h1></div>

<%@ include file='/jcore/doMessageBox.jspf' %>

<form action='plugins/BlogPlugin/jsp/admin/convertBlogStep2.jsp' method='post' name='editForm' enctype="multipart/form-data">
   <div class='formBox'>
    <div class='infoArea'>
        <%= glp("jcmsplugin.blog.tools.text1")%>
        <p><%= glp("jcmsplugin.blog.tools.text2")%></p>
        <p><%= glp("jcmsplugin.blog.tools.text3")%></p>
    </div>
    <div class='inputArea'>
      <div style="margin:8px 8px 8px 0">
        <span class="formLabel"><%= glp("ui.com.lbl.file") %></span>
        <span class="formLabel"><input class='formTextfield' type='file' name='file' size='50' /></span>
      </div>
      <input name="opLoad" class='formButton mainButton' type='submit' value='<%= glp("ui.adm.jcms5-loader.btn.load") %>' />
    </div>
   </div>
</form>
<%@ include file="/admin/doAdminFooter.jspf" %>
