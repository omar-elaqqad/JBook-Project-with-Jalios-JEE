<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%@ page import="com.jalios.jcmsplugin.blog.*" %><%  
  BlogManager blogMgr = BlogManager.getInstance();
  
  BlogPost post = (BlogPost) getPublicationParameter("id");
  if (post == null) {
    return;
  }  
  
  Blog blog = post.getBlog();
  
  boolean canPublishPostInBlog = blogMgr.canPublishPostInBlog(loggedMember,blog);
  boolean isDataWriteEnabled = channel.isDataWriteEnabled();
  
  if(!isDataWriteEnabled || !loggedMember.canWorkOn(post)){
    sendForbidden(request, response);
    return;
  }
  
  //Force workspace for media browser of wysiwyg
  Workspace.setRequestWorkspace(request , blog.getWorkspace());
  jcmsContext.forceUpdate();
      
  request.setAttribute("jcmsplugin.blog.blog",blog); 
  jcmsContext.setAjaxRequestAttribute("jcmsplugin.blog.blog",blog.getId());
  request.setAttribute("title",post.getTitle()) ;
  request.setAttribute("field-vertical", "true");
%>
<jsp:useBean id="formHandler" scope="page" class="generated.EditBlogPostHandler">
  <jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/> 
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
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
  jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog.css");
  request.setAttribute("formHandler",formHandler);
%>
<%@ include file='/jcore/doHeader.jspf' %>
<%@ include file='/jcore/doMessageBox.jspf' %>
<div class="fullDisplay container-fluid <%= blog.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
  <div id="Blog" class="blog">
    <%@ include file='/plugins/BlogPlugin/jsp/doCommonBlogHeader.jspf' %>             
    <div id="column-container" class="row">
      <div class="main-column col-sm-9">        
        <div class="main-column-content ">
          <div class="post-container">  
            <form class="edit-post well" name="editForm" id="editForm" method="post" action="types/BlogPost/doBlogPostEditDisplayOld.jsp">
              <%@ include file='/work/doEditLangChooser.jspf' %>
                        
              <jalios:field name="title" formHandler='<%= formHandler %>' >
                <jalios:control/>
              </jalios:field>   
              <% request.setAttribute("jcmsplugin.blog.form.blogId",blog.getId()); %>
              <jalios:include jsp="/types/BlogPost/doEditBlogPost.jsp" />
  
              <%= blogMgr.printHiddenBlogPostWSTypeEntryCategories(workspace) %>
              <input type="hidden" name="ws" value="<%= blog.getWorkspace().getId() %>"/>
              <input type="hidden" name="blog" value="<%= blog.getId() %>"/>
              <input type="hidden" name="id" value="<%= post.getId() %>" />
              <input type='hidden' name='portal'   value='<%= encodeForHTMLAttribute(getUntrustedStringParameter("portal","")) %>' />              
              <input type="hidden" name="redirect" value="<%= "$DISPLAY_URL$" %>" />
              <input type="hidden" name="inFo" value="<%= true %>"/>
              
              <table class="layout">
                <jalios:include target="EDIT_PUB_MAINTAB" targetContext="tr" />
              </table>             
      
              <div class="buttons">
                <% if(blogMgr.canPublishDraft(blog.getWorkspace(),blog,loggedMember) && post.isDraft()){%>
                  <input class="btn btn-warning" type="submit" name="opUpdateDraft" value='<%= glp("jcmsplugin.blog.title.save-as-draft") %>' />
                  <input class="btn btn-primary" type="submit" name="opUpdate" value="<%= glp("jcmsplugin.blog.label.action.publish")%>" />
                <% } else { %>
                  <input class="btn btn-primary" type="submit" name="opUpdate" value="<%= glp("ui.com.btn.save")%>" />
                <% } %>                    
                <input type="submit" class="btn btn-default" name="opCancel"  value="<%= glp("ui.com.btn.cancel") %>"/>
              </div>  
            </form>
          </div>

        </div><!--  EOF main-column-content -->
      </div>
      <% 
        //Hide new blog post button in side column
        request.setAttribute("jcmsplugin.blog.hide-new-blog-btn", true); 
      %>
      <%@ include file='/plugins/BlogPlugin/jsp/doSideColumn.jspf' %>
    </div><!-- EOF column-container -->
  </div><!-- EOF #Blog -->
</div>
<%@ include file='/jcore/doFooter.jspf' %>
<%  
    //Put back original workspace
    Workspace.setRequestWorkspace(request , workspace);
    jcmsContext.forceUpdate(); 
%>