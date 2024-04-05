<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%  
%><%@ include file='/jcore/doInitPage.jspf'%>

<%
BlogPost post = (BlogPost) getPublicationParameter("id");
if (post == null) {
  return;
}  

boolean isBlogOldFullDisplay = BlogTemplatePolicyFilter.isBlogOldFullDisplay();
if (isBlogOldFullDisplay) {
  // Edit using the old editFront page
  sendRedirect("types/BlogPost/doBlogPostEditDisplayOld.jsp?id=" + post.getId());
  return;
}

BlogManager blogMgr = BlogManager.getInstance();

Blog blog = post.getBlog();
  
boolean canPublishPostInBlog = blogMgr.canPublishPostInBlog(loggedMember,blog);
boolean isDataWriteEnabled = channel.isDataWriteEnabled();

if(!isDataWriteEnabled || !loggedMember.canWorkOn(post)){
  sendForbidden(request, response);
  return;
}

boolean showOptions = getBooleanParameter("showOptions", false);

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
    String pubRedirect = formHandler.getPublication().getDisplayUrl(userLocale);
    pubRedirect += "?preview=true";
    request.setAttribute("modal.redirect", pubRedirect);
    %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%  
    return;
  }
  formHandler.prepare();
  jcmsContext.addCSSHeader("plugins/BlogPlugin/css/blog.css");
  request.setAttribute("formHandler",formHandler);
  String formAction = "types/BlogPost/doBlogPostEditDisplay.jsp";
%>
<%@ include file='/jcore/doHeader.jspf' %>
<div class="jcms-blog post-container ajax-refresh-div" data-jalios-ajax-refresh-url="<%= formAction %>">  
  <form class="blog-form edit-post well" name="editForm" id="editForm" method="post" action="<%= formAction %>">
    <%@ include file='/jcore/doMessageBox.jspf' %>
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
    <input type='hidden' name='portal' value='<%= encodeForHTMLAttribute(getUntrustedStringParameter("portal","")) %>' />              
    <input type="hidden" name="redirect" value="<%= "$DISPLAY_URL$" %>" />
    <input type="hidden" name="inFo" value="<%= true %>"/>
    <%
    Set<Category> hiddenCategorySet = formHandler.getFOEditHiddenCategorySet();
    for (Category itCat : hiddenCategorySet) {
      %><input type="hidden" name="cids" value="<%= itCat.getId() %>"/><%
    }
    %>
    <%--
    <table class="layout">
      <jalios:include target="EDIT_PUB_MAINTAB" targetContext="tr" />
    </table>
     --%>

    <div class="buttons">
    <%
    boolean displayDraftButton = blogMgr.canPublishDraft(blog.getWorkspace(),blog,loggedMember);
    boolean displayPublishButton = post.getPstatus() != WorkflowManager.PUBLISHED_PSTATUS
        && blogMgr.canReachState(blog.getWorkspace(), blog, loggedMember, WorkflowManager.PUBLISHED_PSTATUS);
    int currentState = post.getPstatus();
    boolean displaySaveButton = post.checkUpdate(loggedMember).isOK() && !post.isDraft();
    String opDraftLabel = glp("jcmsplugin.blog.title.save-as-draft");
    String opUpdateLabel = glp("ui.com.btn.update");
    String opPublishLabel = glp("jcmsplugin.blog.label.action.publish");
    String mainOpCss = "";
    String mainOpLabel = "";
    String mainOpValue = "";
    String secondOpCss = "";
    String secondOpLabel = "";
    String secondOpValue = "";
    mainOpCss += " btn-primary";
    mainOpLabel = opUpdateLabel;
    mainOpValue = "opUpdate";
    if (post.isInVisibleState()) {
      mainOpLabel = opUpdateLabel;
      if (displayDraftButton) {
        secondOpCss += " btn-warning";
        secondOpLabel = opDraftLabel;
        secondOpValue = "opUpdateDraft";
      }
    } else {
      if (displayDraftButton) {
        mainOpCss += " btn-warning";
        mainOpValue = "opUpdateDraft";
        mainOpLabel = opDraftLabel;
        secondOpCss += " btn-primary";
        secondOpLabel = opPublishLabel;
        secondOpValue = "opUpdatePublished";
      }
    }
    %>
    <input class="ajax-refresh btn <%= mainOpCss %>"<%
      %> type="submit"<%
      %> name="<%= mainOpValue %>"<%
      %> value='<%= encodeForHTMLAttribute(mainOpLabel) %>' />
    <% if (displayDraftButton) { %>
      <input class="ajax-refresh btn <%= secondOpCss %>"<%
        %> type="submit"<%
        %> name="<%= secondOpValue %>"<%
        %> value='<%= encodeForHTMLAttribute(secondOpLabel) %>' />
    <% } %>
    <input type="submit" class="ajax-refresh btn btn-default" name="opCancel" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.cancel")) %>"/>
    <button class="btn btn-default" data-jalios-action="toggle:hide" data-jalios-target=".post-container .toggle-options-state">
      <span class="toggle-options-state "><%= glp("types.BlogPost.btn.show-options") %></span>
      <span class="toggle-options-state hide"><%= glp("types.BlogPost.btn.hide-options") %></span>
    </button>
  </form>
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>

<%@ include file='/jcore/doFooter.jspf' %>
<%  
    //Put back original workspace
    Workspace.setRequestWorkspace(request , workspace);
    jcmsContext.forceUpdate(); 
%>