<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.portal.EditCSApplicationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean><%
jcmsContext.addJavaScript("js/jalios/core/jalios-admin-templates.js");
%>
<%-- Bufferize portlet handler to set it to the formHandler --%>
<jalios:buffer name="editPortletTemplateAndHandler">
  <jalios:include jsp='<%= formHandler.getPortletEditFormHandlerPath() %>' />
  <%
  
  EditPortalElementHandler genericFormHandler = (EditPortalElementHandler) request.getAttribute(formHandler.getAvailableEditedPortlet().getClass().getSimpleName() + ".formHandler");
  request.setAttribute(EditPortletSkinableHandler.DISPLAY_PORTLET_SKINABLE_FORM_REQUEST_ATTR, false);
  request.setAttribute("jcms.edit.footer.display", true);
  // Validate must be performed to initialize handler
  if (genericFormHandler.validate()) {
    return;
  }
  %>
  <% request.setAttribute("formHandler", genericFormHandler); %>
  <jalios:include jsp='<%= formHandler.getPortletEditTemplatePath() %>' />
</jalios:buffer>
<%
EditPortalElementHandler portletHandler = (EditPortalElementHandler) request.getAttribute("formHandler");
formHandler.setEditPortletHandler(portletHandler);
%>
<% if (formHandler.validate()) { %><%@ include file="/jcore/modal/modalRedirect.jspf" %><% return; } %>
<jalios:modal css="modal-lg jportal-edit-portlet" op="opUpdateApplication" button="ui.com.btn.save" formHandler="<%= formHandler %>" title="jcmsplugin.collaborativespace.edit-app-modal.title" url="plugins/CollaborativeSpacePlugin/jsp/portal/editApplicationModal.jsp">
  <!-- Tab panes -->
  <% if (formHandler.isSkinablePortlet()) { %>
    <jalios:field resource="field-horizontal" ml="true" value="<%= formHandler.getDisplayTitleML() %>" name="displayTitle" label="jcmsplugin.collaborativespace.edit-app-modal.title.label">
      <jalios:control settings='<%= new TextFieldSettings().placeholder(formHandler.getAvailableEditedPortlet().getTitle()) %>' />
    </jalios:field>
  <% } %>
  <% if (formHandler.showTemplateField()) { %>
    <div class="template-wrapper">
      <% TypeTemplateEntry tteCurrent = formHandler.getTemplateEntry(); %>
      <jalios:field label='jcmsplugin.collaborativespace.edit-app-modal.template.label' >
        <%-- Use templates (Select name) for current workspace edition since we delegate to the real type handler instead of using overrides--%>
        <select class="form-control template-chooser" name="<%= formHandler.isCurrentWorkspaceApplication() ? "templates" : "template" %>">
          <jalios:foreach collection='<%= formHandler.getTemplateSettings() %>' name="tte" type="TypeTemplateEntry">
            <% String selected = formHandler.isTemplateSelected(tte) ? "selected='selected'" : ""; %>
            <option value="<%= tte.getName() %>" <%= selected %> data-jalios-path="<%= tte.getPath() %>"><%= itCounter.intValue() %>. <%= tte.getLabel(userLang) %></option>
          </jalios:foreach>
        </select>
      </jalios:field>
      <jalios:field>
        <div class="template-description-wrapper">
          <img src="<%= tteCurrent.getThumbnailPath() %>" class="template-image img-thumbnail" alt='<%= encodeForHTMLAttribute(glp("ui.com.alt.preview")) %>'/>
          <div class="well template-description">
            <jalios:foreach collection="<%= formHandler.getFullTemplateSet() %>" name="tte" type="TypeTemplateEntry">
              <% String selected = tte.equals(tteCurrent) ? "" : "style='display:none;'"; %>
              <div class="template-description-item <%= tte.getName() %>"  <%= selected %>><%= WikiRenderer.wiki2html(tte.getDescription(userLang), userLocale, null) %></div>
            </jalios:foreach>
          </div>
        </div>
      </jalios:field>
    </div>
    <%-- Provide map of other templates usage values --%>
    <% for (String itUsage : channel.getTypeEntry(AbstractPortletSkinable.class).getTemplateUsageSet()) { %>
      <% if (!"full".equals(itUsage)) { %>
        <input type="hidden" name="templates" value="<%= itUsage %>.<%= ((EditPortletSkinableHandler) formHandler.getEditPortletHandler()).getAvailableTemplateEntry(itUsage).getInternalName() %>" />
      <% } %>
    <% } %>
  <% } %>
  
  <% if (formHandler.isCurrentWorkspaceApplication()) { %>
    <%= editPortletTemplateAndHandler %>
  <% } else { %>
    <% for (TypeFieldEntry typeFieldEntry : formHandler.getPortletTypeFieldEntries()) { %>
      <jalios:field formHandler="<%= formHandler.getEditPortletHandler() %>" name="<%= typeFieldEntry.getName() %>" value="<%= formHandler.getFieldValue(typeFieldEntry) %>">
        <jalios:control settings='<%= formHandler.getTypeFieldEntrySettings(typeFieldEntry) %>' />
      </jalios:field>
    <% } %>
  <% } %>
  <% if (formHandler.showFullEditButton()) { %>
    <jalios:buffer name="MODAL_BUTTON"><jalios:edit css="btn btn-default" redirect='<%= formHandler.getCollaborativeSpace().getDisplayUrl(userLocale) + "?portlet=" + formHandler.getAvailableEditedPortlet().getId() %>' ctxEdit="false" data="<%= formHandler.getAvailableEditedPortlet() %>"><%= glp("ui.com.btn.edit-full") %></jalios:edit></jalios:buffer>
  <% } %>
  <jalios:control settings='<%= new HiddenSettings().name("editedPortlet").value(formHandler.getAvailableEditedPortlet().getId()) %>' />
  <jalios:control settings='<%= new HiddenSettings().name("id").value(formHandler.getAvailableEditedPortlet().getId()) %>' />
</jalios:modal>