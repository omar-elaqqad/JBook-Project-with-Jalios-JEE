<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%

BlogManager blogMgr = BlogManager.getInstance();

Blog blog = (Blog) getPublicationParameter("id");

boolean isBlogOldFullDisplay = BlogTemplatePolicyFilter.isBlogOldFullDisplay();
if (isBlogOldFullDisplay) {
  // Edit using the old editFront page
  sendRedirect("types/Blog/doBlogEditDisplayOld.jsp?id=" + blog.getId());
  return;
}
  
request.setAttribute("jcmsplugin.blog.blog",blog); 
jcmsContext.setAjaxRequestAttribute("jcmsplugin.blog.blog",blog.getId());
jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog.css");
request.setAttribute("title", blog.getTitle()) ;
request.setAttribute("field-vertical", "true");
%>
<jsp:useBean id="formHandler" scope="page" class="generated.EditBlogHandler">
  <jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/> 
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name="formHandler" property="id" value="<%= blog.getId() %>"/>
  <jsp:setProperty name="formHandler" property="noRedirect" value="true" />
</jsp:useBean>
<% 
  if (formHandler.validate()){
    String pubRedirect = formHandler.getPublication().getDisplayUrl(userLocale);
    pubRedirect += "?preview=true";
    request.setAttribute("modal.redirect", pubRedirect);
    %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%  
    return;
  }
  formHandler.prepare();
  boolean isCreate = blog == null || !(blog instanceof Blog);
  request.setAttribute("formHandler",formHandler);
  String formAction = "types/Blog/doBlogEditDisplay.jsp";
%>
<%@ include file='/jcore/doHeader.jspf' %>
<div class="jcms-blog post-container ajax-refresh-div" data-jalios-ajax-refresh-url="<%= formAction %>">  
  <form class="blog-form edit-blog edit-post well" name="editForm" id="editForm" method="post" action="<%= formAction %>">
    <%@ include file='/jcore/doMessageBox.jspf' %>
    <%@ include file='/work/doEditLangChooser.jspf' %>

    <jalios:field name="title" formHandler='<%= formHandler %>' >
      <jalios:control/>
    </jalios:field>
    <% request.setAttribute("jcmsplugin.blog.form.blogId",blog.getId()); %>
    <jalios:include jsp="/types/Blog/doEditBlog.jsp" />

    <input type="hidden" name="ws" value="<%= blog.getWorkspace().getId() %>"/>
    <input type="hidden" name="id" value="<%= blog.getId() %>" />
    <input type='hidden' name='portal' value='<%= encodeForHTMLAttribute(getUntrustedStringParameter("portal","")) %>' />              
    <input type="hidden" name="redirect" value="<%= "$DISPLAY_URL$" %>" />
    <input type="hidden" name="inFo" value="<%= true %>"/>

    <div class="buttons">
      <input class='ajax-refresh btn btn-primary' type="submit" name="opUpdate" value='<%= encodeForHTMLAttribute(glp("ui.com.btn.update")) %>' />
      <input type="submit" class="ajax-refresh btn btn-default" name="opCancel" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.cancel")) %>"/>
    </div>
  </form>
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>

<%@ include file='/jcore/doFooter.jspf' %>
<%  
// Put back original workspace
Workspace.setRequestWorkspace(request , workspace);
jcmsContext.forceUpdate(); 
%>