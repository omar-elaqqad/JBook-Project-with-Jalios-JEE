<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %>  
<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogRights.jspf" %>  
<%@ include file='/jcore/doHeader.jspf' %>
<%  
  //Force workspace for media browser of wysiwyg
  Workspace.setRequestWorkspace(request , blog.getWorkspace());
  jcmsContext.forceUpdate();
  request.setAttribute("field-vertical", "true");
  jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog.css");
%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditBlogPostHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='workspace' value='<%= blog.getWorkspace() %>'/>
  <jsp:setProperty name='formHandler' property='blog' value='<%= blog.getId() %>'/>
</jsp:useBean>
<%
  request.setAttribute("formHandler",formHandler);
  
  if (!isDataWriteEnabled || !canPublishPostInBlog) {
    sendForbidden(request, response);
    return;
  }
  
  if (formHandler.validateCancel()) {
    sendRedirect(blog.getDisplayUrl(userLocale));
    return;
  }   
     
  if (formHandler.validate()) {
    String redirect = formHandler.getPublication() != null ? formHandler.getPublication().getDisplayUrl(userLocale) : "#";
    redirect += "?preview=true";
    sendRedirect(redirect);
    return;
  }
  formHandler.prepare();
%>
<div class="post-container">
  <form class="add-post well well-sm" action="<%= ServletUtil.getResourcePath(request) %>" method="post" name="editForm">
    <%@ include file='/jcore/doMessageBox.jspf' %>

    <% if (channel.isMultilingual()) { %>
      <jalios:field name="mainLanguage" label="">
        <% String editLang = formHandler.getAvailableMainLanguage(); %>
        <div class="widget-content">
        <a href="#" lang="<%= editLang %>" class="ctxLangForm ctxmenu lang-fix langStatus btn btn-default"><%= glp("ui.com.lbl.language.edit") %> <jalios:lang lang='<%= editLang %>' /></a>
        </div>
      </jalios:field>
    <% } %>

    <jalios:field name="title" formHandler='<%= formHandler %>' >
      <jalios:control/>
    </jalios:field>
    <% request.setAttribute("jcmsplugin.blog.form.blogId",blog.getId()); %>
     <jalios:include jsp="/types/BlogPost/doEditBlogPost.jsp" />
    <%= blogMgr.printHiddenBlogPostWSTypeEntryCategories(workspace) %>
    
    <%= formHandler.getHiddenField("ws", blog.getWorkspace().getId()) %>
    <%= formHandler.getHiddenField("inFo", true) %>
    <%= formHandler.getHiddenField("blogDisplay", "addPost") %>
    
    <div class="buttons">
    <%
    boolean displayDraftButton = blogMgr.canPublishDraft(blog.getWorkspace(), blog, loggedMember);
    boolean displayPublishButton = blogMgr.canReachState(blog.getWorkspace(), blog, loggedMember, WorkflowManager.PUBLISHED_PSTATUS);
    int initState = blog.getWorkspace().getWorkflow(blogMgr.getPostClass()).getInitState().getPstatus();
    boolean displayCreateButton = initState != WorkflowManager.PUBLISHED_PSTATUS 
                               && initState != WorkflowManager.DEFAULT_DRAFT_PSTATUS;
    %>
      <% if (displayDraftButton) { %>
        <input class="btn btn-warning" type="submit" name="opCreateDraft" value='<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.title.save-as-draft")) %>' />
      <% } %>
      <% if (displayPublishButton) {%>
        <input class="btn btn-primary" type="submit" name="opCreatePublished" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.publish")) %>" />
      <% } %>
      <% if (displayCreateButton) {%>
        <input class='btn <%= displayPublishButton ? "btn-default" : "btn-primary" %>' type="submit" name="opCreate" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.publish")) %>" />
      <% } %>
      <button class="btn btn-default" data-jalios-action="toggle:hide" data-jalios-target=".post-container .toggle-options-state">
        <span class="toggle-options-state "><%= glp("types.BlogPost.btn.show-options") %></span>
        <span class="toggle-options-state hide"><%= glp("types.BlogPost.btn.hide-options") %></span>
      </button>
      <input type="submit" class="btn btn-default" name="opCancel" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.cancel")) %>"/>
    </div>
  </form>
</div>
<jalios:javascript>
!function ($) {
  // Activate unload message, require jalios-single-submit.js
  initUnloadMessage();
}(window.jQuery);
</jalios:javascript>
<%  
  //Put back original workspace
  Workspace.setRequestWorkspace(request , workspace);
  jcmsContext.forceUpdate(); 
%>

<% if (BlogUtil.isBlogDebug()) { %>
  blog: <pre><%= blog != null ? encodeForHTML(blog.toString()) : null %></pre><br/>
  blog.catSet: <pre><%= blog != null && blog.getCategorySet() != null ? encodeForHTML(blog.getCategorySet().toString()) : null %></pre><br/>
  formHandler.getBlogCatRoot(): <pre><%= formHandler.getBlogCatRoot() != null ? encodeForHTML(JcmsUtil.dataToString(formHandler.getBlogCatRoot())) : null %></pre><br/>
  formHandler.showContentTabCategories(): <pre><%= formHandler.showContentTabCategories() %></pre><br/>
  formHandler.getPublication(): <pre><%= formHandler.getPublication() != null ? encodeForHTML(formHandler.getPublication().toString()) : null %></pre><br/>
  formHandler.getAvailableContentTabCategories() = <pre><%= formHandler.getAvailableContentTabCategories() %></pre><br/>
  formHandler.getContentTabCategorySettings() = <pre><%= formHandler.getContentTabCategorySettings() %></pre><br/>
  formHandler.getContentTabCategorySettings().resolveRootCategories() = <pre><%= Util.getArrayList(formHandler.getContentTabCategorySettings().resolveRootCategories()) %></pre><br/>
  formHandler.showContentTabCategories() = <code><%= formHandler.showContentTabCategories() %></code><br/>
<% } %>