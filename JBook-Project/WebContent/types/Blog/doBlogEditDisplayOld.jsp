<%@ page contentType="text/html; charset=UTF-8"         %>
<%@ include file='/jcore/doInitPage.jspf'                %>
<%@ include file='/jcore/portal/doPortletParams.jspf'  %>
<%@ page import="com.jalios.jcmsplugin.blog.*" %>
<%  
  BlogManager blogMgr = BlogManager.getInstance();
  
  Blog blog = (Blog) getPublicationParameter("id");
  
  request.setAttribute("jcmsplugin.blog.blog",blog); 
  jcmsContext.setAjaxRequestAttribute("jcmsplugin.blog.blog",blog.getId());
  jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog.css");
%>
<jsp:useBean id="formHandler" scope="page" class="generated.EditBlogHandler">
  <jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/> 
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name="formHandler" property="id" value="<%= blog.getId() %>"/>
  <jsp:setProperty name="formHandler" property="workspace" value="<%= blog.getWorkspace() %>"/>
  <jsp:setProperty name="formHandler" property="noRedirect" value="true" />
</jsp:useBean>
<% 
  if (formHandler.validate()){
    String redirect = formHandler.getPublication().getDisplayUrl(userLocale);
    redirect += "?preview=true";
    sendRedirect(redirect);
    return;
  } 
  boolean isCreate = blog == null || !(blog instanceof Blog);
%>

<%@ include file='/jcore/doHeader.jspf'%>
<%@ include file='/jcore/doMessageBox.jspf'%>
<div class="fullDisplay Blog1 container-fluid <%= blog.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
  <div id="Blog" class="blog">
    <%@ include file='/plugins/BlogPlugin/jsp/doCommonBlogHeader.jspf' %>             
    <div id="column-container" class="row">
      <div class="main-column col-sm-9">        
        <div class="main-column-content ">
          <div class="post-container">
            <form class='add-post well well-sm' name='editBlog' id='editForm' method='post' action='types/Blog/doBlogEditDisplayOld.jsp'>
              <% 
                request.setAttribute("formHandler", formHandler);
                request.setAttribute("field-vertical",true);
              %>
              <jalios:include jsp="/types/Blog/doEditBlog.jsp" />
              <% request.removeAttribute("field-vertical"); %>
              
              <input type="hidden" name="ws" value="<%= blog.getWorkspace().getId() %>"/>
              <input type="hidden" name="blogId" value="<%= blog.getId() %>"/>
              <input type='hidden' name='id'       value='<%= encodeForHTMLAttribute(getUntrustedStringParameter("id","")) %>' />
              <input type='hidden' name='portal'   value='<%= encodeForHTMLAttribute(getUntrustedStringParameter("portal","")) %>' />
              <input type='hidden' name='redirect' value='<%= "$DISPLAY_URL$" %>' />                
              <input type="hidden" name="inFo" value="<%= true %>"/>

              <div class="buttons">
                <input class='btn btn-primary' type="submit" name="opUpdate" value='<%= encodeForHTMLAttribute(glp("ui.com.btn.update")) %>' />
                <input type="submit" class="btn btn-default" name="opCancel" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.cancel")) %>"/>
              </div>                                          
                                        
            </form>
          </div>
        </div><!--  EOF main-column-content -->
      </div>
      <%@ include file='/plugins/BlogPlugin/jsp/doSideColumn.jspf' %>
    </div><!-- EOF column-container -->
  </div><!-- EOF #Blog -->
</div>
<%@ include file='/jcore/doFooter.jspf' %>