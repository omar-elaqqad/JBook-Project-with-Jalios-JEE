<%@ page import="com.jalios.jcms.handler.EditPublicationHandler" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id="inlineEditionFormHandler" scope="page" class="com.jalios.jcms.wysiwyg.WysiwygInlineEditionHandler"><%
  %><jsp:setProperty name="inlineEditionFormHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="inlineEditionFormHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="inlineEditionFormHandler" property="*" /><%
%></jsp:useBean><%

if (!inlineEditionFormHandler.validate()) { 
  // Expected parameters were NOT properly specified, we could display 
  // a message but this situation indicates an invalid implementation
  return;
}

%><jsp:include page="<%= inlineEditionFormHandler.getEditHandlerPath() %>"/><%

final EditPublicationHandler formHandler = inlineEditionFormHandler.getEditHandlerFromAttribute();
formHandler.setNoRedirect(true);
formHandler.setNoSendRedirect(true);
final boolean validated = formHandler.validate();
final boolean finished = HttpUtil.hasParameter(request, "opCancel") || validated;
%>
<div class="ajax-refresh-div">
<%
Object editedFieldValue = formHandler.getPublication().getFieldValue(jcmsContext, inlineEditionFormHandler.getField());

if (finished) { 
  if (inlineEditionFormHandler.getTypeFieldEntry().isFieldWiki()) { 
    %><jalios:wiki data="<%= formHandler.getPublication() %>" field="<%= inlineEditionFormHandler.getField() %>"><%= editedFieldValue %></jalios:wiki><%
  } else { 
    %><jalios:wysiwyg data="<%= formHandler.getPublication() %>" field="<%= inlineEditionFormHandler.getField() %>"><%= editedFieldValue %></jalios:wysiwyg><%
  } 
} else { 
  String editFormId = ServletUtil.generateUniqueDOMId(request, "editForm");
  boolean showWysiwygInlineButtonsAfter = channel.getBooleanProperty("wysiwyg.inline-edit.button-after", true);
%>
<form class="wysiwyg-inline-edit-form <%= (showWysiwygInlineButtonsAfter) ? "buttons-after" : "buttons-before" %>" id="<%= editFormId %>Id" name="<%= editFormId %>Name" action="jcore/wysiwyg/wysiwygInline.jsp" 
      lang="<%= formHandler.getAvailableMainLanguage() %>" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
      
 <jalios:buffer name="wysiwygInlineButtons">
  <div class="wysiwyg-inline-buttons" aria-hidden="true">
    <button class="btn btn-primary btn-sm wysiwyg-inline-btn wysiwyg-inline-btn-save ajax-refresh" type="submit" name="opUpdate" value="true"><%= glp("wysiwyg.inline-edit.save") %></button>
    <button class="btn btn-default btn-sm wysiwyg-inline-btn wysiwyg-inline-btn-cancel ajax-refresh" type="submit" name="opCancel" value="true"><%= glp("wysiwyg.inline-edit.cancel") %></button>    
    <% 
    if (channel.isMultilingual() && formHandler.showLanguageChooser() &&
        inlineEditionFormHandler.getTypeFieldEntry().isFieldML()) {
      // For inline edition, we directly want to propose the field edition in the  
      // language that was initialy displayed to the user, aka userLang
      // (contrary to behavior of edit form which uses formHandler.getAvailableMainLanguage())
      // However it may not be the value in the specified language (see DEVJCMS-1789), as it may be empty, thus 
      // check which language was really displayed to the user, with channel.getUsedLanguage
      String lang = channel.getUsedLanguage(formHandler.getPublication(), inlineEditionFormHandler.getField(), userLang);
      %><a href="#" lang="<%= lang %>" class="ctxLangForm ctxmenu lang-fix langStatus btn btn-default btn-sm ">
        <%= glp("ui.com.lbl.language.edit") %> <jalios:lang lang='<%= lang %>' />
        </a>
    <% } %>
  </div>
 </jalios:buffer>
  
  <%@ include file="/jcore/doMessageBox.jspf" %>
  
  <% if (!showWysiwygInlineButtonsAfter) { %>
   <%= wysiwygInlineButtons %>
  <% } %>
  <jalios:field name="<%= inlineEditionFormHandler.getField() %>" label="" value="<%= editedFieldValue %>" formHandler="<%= formHandler %>" resource="field-vertical" css="focus">
    <jalios:control settings='<%= new DefaultSettings().dataAttribute("scrollto", inlineEditionFormHandler.getScrollTo()) %>' />
  </jalios:field>
  <% if (showWysiwygInlineButtonsAfter) { %>
   <%= wysiwygInlineButtons %>
  <% } %>
  
  <input type="hidden" name="id" value="<%= formHandler.getId() %>" />
  <input type="hidden" name="field" value="<%= inlineEditionFormHandler.getField() %>" />
</form>
<jalios:javascript>jQuery.jalios.form.SingleSubmit.initUnload();</jalios:javascript>
<% } %>
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>