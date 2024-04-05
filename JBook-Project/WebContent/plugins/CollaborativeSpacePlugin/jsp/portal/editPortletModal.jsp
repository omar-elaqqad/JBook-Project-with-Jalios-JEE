<%@page import="com.jalios.jcms.jportal.JPortalEditPortletUIHandler.SkinSection"%>
<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.portal.EditCSPortletHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean><%
jcmsContext.addJavaScript("js/jalios/core/jalios-admin-templates.js");
boolean showSettingsTab = formHandler.showSettingsTab(); 
boolean showTemplatesTab = formHandler.showTemplateTab();
boolean showTabs = showTemplatesTab || showSettingsTab;
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
<% if (formHandler.validate()) { %>
  <script>
    jQuery.plugin.CollaborativeSpace.refreshPortletWithUpdatedParams("<%= formHandler.getAvailableEditedPortlet().getId() %>");
    jQuery.jalios.ui.Modal.close(false);
  </script>
<% } %>
<jalios:modal css="modal-lg jportal-edit-portlet" op="opUpdateUI" button="ui.com.btn.save" formHandler="<%= formHandler %>" title="portlet.edit-skin-modal" url="plugins/CollaborativeSpacePlugin/jsp/portal/editPortletModal.jsp">
  
  <% if (formHandler.isSkinablePortlet() ) { %>
  
    <% if (showTabs) { %>
      <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
        <li class="active"><a href="#header" role="tab" data-toggle="tab" onclick="return false;"><%= glp("jportal.edition.sidebar.ui.jalios-skin.title") %></a></li>
        <% if (formHandler.showTemplateTab()) { %>
          <li><a href="#templates" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.form.lbl.templates") %></a></li>
        <% } %>
        <% if (showSettingsTab) { %>
          <li><a href="#editComplex" role="tab" data-toggle="tab" onclick="return false;"><%= glp("jportal.edition.sidebar.ui.settings") %></a></li>
        <% } %>
      </ul>
    <% } %>
    
    <!-- Tab panes -->
    <div class="tab-content">
      <div class="tab-pane active" id="header">
        <% if (formHandler.isSkinablePortlet()) { %>
          <%-- Skin --%>
          <% Set<TypeTemplateEntry> boxSkinTemplateSet = formHandler.getTemplateEntrySet(); %>
          <% if (Util.getSize(boxSkinTemplateSet) > 1) { %>
            <jalios:field label='jportal.edition.sidebar.ui.jalios-skin.label' css="template-wrapper">
              <select class="form-control template-chooser" name="skin" data-jalios-action="ajax-refresh">
                <jalios:foreach collection='<%= boxSkinTemplateSet %>' name="tte" type="TypeTemplateEntry">
                  <% String selected = formHandler.isSkinSelected(tte) ? "selected='selected'" : ""; %>
                  <option value="<%= tte.getName() %>" <%= selected %> data-jalios-path="<%= tte.getPath() %>"><%= itCounter.intValue() %>. <%= tte.getLabel(userLang) %></option>
                </jalios:foreach>
              </select>
            </jalios:field>
          <% } %>
        <% } %>
        <% if (formHandler.showSection(SkinSection.HEADER)) { %>
          <% if (formHandler.showSection(SkinSection.HEADER_SECONDARY_COLOR)) { %>
          <%-- Skin : secondary color --%>
          <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderSecondaryColor() %>" name="skinHeaderSecondaryColor" label="jportal.edition.sidebar.ui.jalios-skin-header-secondary.label" description="jportal.edition.sidebar.ui.jalios-skin-header-secondary.help">
            <jalios:control settings='<%= new ColorSettings().paletteColorsProperty("portlet-header-secondary-colorpicker") %>' />
          </jalios:field>
          <% } else { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderSecondaryColor").value(formHandler.getSkinHeaderSecondaryColor()) %>' />
          <% } %>
          <% if (formHandler.showSection(SkinSection.HEADER_TITLE)) { %>
            <%-- Skin : display title --%>
            <jalios:field resource="field-horizontal" ml="true" value="<%= formHandler.getDisplayTitleML() %>" name="displayTitle" label="jportal.edition.sidebar.ui.jalios-skin-header-display-title">
              <jalios:control settings='<%= new TextFieldSettings().placeholder(formHandler.getAvailableEditedPortlet().getTitle()) %>' />
            </jalios:field>
          <% } else { %>
            <% for (String itLang : formHandler.getDisplayTitleML().keySet()) { %>
              <jalios:control settings='<%= new HiddenSettings().name("displayTitle").value(formHandler.getDisplayTitleML().get(itLang)) %>' />
            <% } %>
          <% } %>
          <% if (formHandler.showSection(SkinSection.HEADER_PRIMARY_COLOR)) { %>
            <%-- Skin : primary color --%>
            <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderPrimaryColor() %>" name="skinHeaderPrimaryColor" label="jportal.edition.sidebar.ui.jalios-skin-header-primary.label" description="jportal.edition.sidebar.ui.jalios-skin-header-primary.help">
              <jalios:control settings='<%= new ColorSettings().paletteColorsProperty("portlet-header-primary-colorpicker") %>' />
            </jalios:field>
          <% } else { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderPrimaryColor").value(formHandler.getSkinHeaderPrimaryColor()) %>' />
          <% } %>
          <% if (formHandler.showSection(SkinSection.HEADER_ICON)) { %>
            <% 
              boolean isFieldSkinHeaderIconVisible = formHandler.isFieldSkinHeaderIconVisible();
              boolean isFieldSkinHeaderIconDeactivatable = formHandler.isFieldSkinHeaderIconDeactivatable();
            %>
            <jalios:field label="jportal.edition.sidebar.ui.jalios-skin-header-icon.label" disabled="<%= !isFieldSkinHeaderIconDeactivatable %>"  name="skinHeaderIconDisplay" value="<%= isFieldSkinHeaderIconVisible %>">
              <jalios:control settings='<%= new BooleanSettings().dataAttribute("jalios-action", "toggle:hide").dataAttribute("jalios-target",".skinHeaderIconDisplay")  %>' />
            </jalios:field>
            <div class="skinHeaderIconDisplay <%= isFieldSkinHeaderIconVisible ? "" : "hide" %>">
              <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderIcon() %>" name="skinHeaderIcon" description="jportal.edition.sidebar.ui.jalios-skin-header-icon.help">
                <jalios:control settings='<%= new IconSettings().placeholder("jportal.edition.sidebar.ui.jalios-skin-header-icon.placeholder").iconPropPrefix(channel.getProperty("widget-icon.portlet-skin-set-prefix")) %>' />
              </jalios:field>
              <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderIconColor() %>" name="skinHeaderIconColor" description="jportal.edition.sidebar.ui.jalios-skin-header-icon-color.help">
                <jalios:control settings='<%= new ColorSettings().placeholder("jportal.edition.sidebar.ui.jalios-skin-header-icon-color.placeholder").paletteColorsProperty("portlet-header-icon-colorpicker") %>' />
              </jalios:field>
            </div>
          <% } else { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIconDisplay").value(true) %>' />
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIcon").value(formHandler.getSkinHeaderIcon()) %>' />
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIconColor").value(formHandler.getSkinHeaderIconColor()) %>' />
          <% } %>
        <% } else { %>
          <% if (formHandler.canWorkOnPortlet()  && formHandler.showSection(SkinSection.HEADER_TITLE)) { %>
           <jalios:field resource="field-horizontal" ml="true" value="<%= formHandler.getDisplayTitleML() %>" name="displayTitle" label="jportal.edition.sidebar.ui.jalios-skin-header-display-title">
              <jalios:control settings='<%= new TextFieldSettings().placeholder(formHandler.getAvailableEditedPortlet().getTitle()) %>' />
            </jalios:field>
          <% } else { %>
            <% for (String itLang : formHandler.getDisplayTitleML().keySet()) { %>
              <jalios:control settings='<%= new HiddenSettings().name("displayTitle").value(formHandler.getDisplayTitleML().get(itLang)) %>' />
            <% } %>
          <% } %>
          <%-- Put all header fields if header is hidden --%>
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderPrimaryColor").value(formHandler.getSkinHeaderPrimaryColor()) %>' />
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderSecondaryColor").value(formHandler.getSkinHeaderSecondaryColor()) %>' />
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIconDisplay").value(true) %>' />
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIcon").value(formHandler.getSkinHeaderIcon()) %>' />
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIconColor").value(formHandler.getSkinHeaderIconColor()) %>' />
        <% } %>
        <% if (formHandler.isSkinablePortlet() && formHandler.showSection(SkinSection.HEADER_SUB_TEXT)) { %>
          <% 
            boolean isFieldskinHeaderSubTextVisible = formHandler.isFieldSkinHeaderSubTextVisible();
            boolean isFieldSkinHeaderSubTextDeactivatable = formHandler.isFieldSkinHeaderSubTextDeactivatable();
            String fieldskinHeaderSubTextCss = isFieldskinHeaderSubTextVisible ? "field-skinHeaderSubText" : "field-skinHeaderSubText hide";
          %>
          <jalios:field label="types.AbstractPortletSkinable.fields.skinHeaderSubText.label" disabled="<%= !isFieldSkinHeaderSubTextDeactivatable %>" name="skinHeaderSubTextDisplay" value="<%= isFieldskinHeaderSubTextVisible %>">
            <jalios:control settings='<%= new BooleanSettings().dataAttribute("jalios-action", "toggle:hide").dataAttribute("jalios-target",".field-skinHeaderSubText")  %>' />
          </jalios:field>
          <jalios:field resource="field-horizontal" css="<%= fieldskinHeaderSubTextCss %>" description="types.AbstractPortletSkinable.fields.skinHeaderSubText.help" value="<%= formHandler.getSkinHeaderButtonSubTextML() %>" name="skinHeaderSubText">
            <jalios:control settings='<%= new TextFieldSettings().placeholder("types.AbstractPortletSkinable.fields.skinHeaderSubText.label") %>' />
          </jalios:field>
        <% } else { %>
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderSubTextDisplay").value(true) %>' />
          <% for (String itLang : formHandler.getSkinHeaderButtonSubTextML().keySet()) { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderSubText").value(formHandler.getSkinHeaderButtonSubTextML().get(itLang)) %>' />
          <% } %>
        <% } %>
        
        <% if (formHandler.isSkinablePortlet()) { %>
          <% 
            boolean isFieldSkinHeaderButtonVisible = formHandler.isFieldSkinHeaderButtonVisible(); 
            boolean isFieldSkinHeaderButtonDeactivatable = formHandler.isFieldSkinHeaderButtonDeactivatable();

            boolean isFieldSkinFooterButtonVisible = formHandler.isFieldSkinFooterButtonVisible(); 
            boolean isFieldSkinFooterButtonDeactivatable = formHandler.isFieldSkinFooterButtonDeactivatable();
          %>
          <% if (formHandler.showSection(SkinSection.HEADER) && formHandler.showSection(SkinSection.HEADER_BUTTON)) { %>
            <jalios:field label="types.AbstractPortletSkinable.fields.skinHeaderButtonLabel.label" disabled="<%= !isFieldSkinHeaderButtonDeactivatable  %>" name="skinHeaderButtonDisplay" value="<%= isFieldSkinHeaderButtonVisible %>">
              <jalios:control settings='<%= new BooleanSettings().dataAttribute("jalios-action", "toggle:hide").dataAttribute("jalios-target",".skinHeaderButtonDisplay")  %>' />
            </jalios:field>
            <div class="skinHeaderButtonDisplay <%= isFieldSkinHeaderButtonVisible ? "" : "hide" %>">
              <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderButtonLabelML() %>" name="skinHeaderButtonLabel" >
                <jalios:control settings='<%= new TextFieldSettings().placeholder("types.AbstractPortletSkinable.fields.skinHeaderButtonLabel.placeholder") %>' />
              </jalios:field>
              <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderButtonLink() %>" name="skinHeaderButtonLink">
                <jalios:control settings='<%= new UrlSettings() %>' />
              </jalios:field>
            </div>
          <% } else { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderButtonDisplay").value(true) %>' />
            <% for (String itLang : formHandler.getSkinHeaderButtonLabelML().keySet()) { %>
              <jalios:control settings='<%= new HiddenSettings().name("skinHeaderButtonLabel").value(formHandler.getSkinHeaderButtonLabelML().get(itLang)) %>' />
            <% } %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderButtonLink").value(formHandler.getSkinHeaderButtonLink()) %>' />                  
          <% } %>
          <% if (formHandler.showSection(SkinSection.FOOTER_BUTTON)) { %>
            <jalios:field label="types.AbstractPortletSkinable.fields.skinFooterButtonLabel.label" disabled="<%= !isFieldSkinFooterButtonDeactivatable %>" name="skinFooterButtonDisplay" value="<%= isFieldSkinFooterButtonVisible %>">
              <jalios:control settings='<%= new BooleanSettings().dataAttribute("jalios-action", "toggle:hide").dataAttribute("jalios-target",".skinFooterButtonDisplay")  %>' />
            </jalios:field>
            <div class="skinFooterButtonDisplay <%= isFieldSkinFooterButtonVisible ? "" : "hide" %>">
              <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinFooterButtonLabelML() %>" name="skinFooterButtonLabel">
                <jalios:control settings='<%= new TextFieldSettings().placeholder("types.AbstractPortletSkinable.fields.skinFooterButtonLabel.placeholder") %>' />
              </jalios:field>
              <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinFooterButtonLink() %>" name="skinFooterButtonLink">
                <jalios:control settings='<%= new UrlSettings() %>' />
              </jalios:field>
              <% 
                TypeFieldEntry skinFooterButtonAlignTFE = channel.getTypeFieldEntry(AbstractPortletSkinable.class, "skinFooterButtonAlign");
                EnumerateSettings skinFooterButtonAlignSettings = (EnumerateSettings)(skinFooterButtonAlignTFE.getControlSettings());
                skinFooterButtonAlignSettings.
                  enumLabels(AbstractPortletSkinable.getSkinFooterButtonAlignLabels(userLang))
                  .enumValues(AbstractPortletSkinable.getSkinFooterButtonAlignValues())
                  .placeholder("types.AbstractPortletSkinable.fields.skinFooterButtonAlign.label");
              %>
              <jalios:field resource="field-horizontal" required="true" value="<%= formHandler.getSkinFooterButtonAlign() %>" name="skinFooterButtonAlign">
                <jalios:control settings='<%= skinFooterButtonAlignSettings %>' />
              </jalios:field>
            </div>
          <% } else { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinFooterButtonDisplay").value(true) %>' />
            <% for (String itLang : formHandler.getSkinFooterButtonLabelML().keySet()) { %>
              <jalios:control settings='<%= new HiddenSettings().name("skinFooterButtonLabel").value(formHandler.getSkinFooterButtonLabelML().get(itLang)) %>' />
            <% } %>
            <jalios:control settings='<%= new HiddenSettings().name("skinFooterButtonLink").value(formHandler.getSkinFooterButtonLink()) %>' />   
            <jalios:control settings='<%= new HiddenSettings().name("skinFooterButtonAlign").value(formHandler.getSkinFooterButtonAlign()) %>' />   
          <% } %>
        <% } %>
      </div>
      <% if (formHandler.showTemplateTab()) { %>
        <% TypeTemplateEntry tteCurrent = formHandler.getTemplateEntry(); %>
        <div class="tab-pane template-wrapper" id="templates">
          <jalios:field label='ui.editportlet.usage.box' >
            <select class="form-control template-chooser" name="template">
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
                <jalios:foreach collection="<%= formHandler.getBoxTemplateSet() %>" name="tte" type="TypeTemplateEntry">
                  <% String selected = tte.equals(tteCurrent) ? "" : "style='display:none;'"; %>
                  <div class="template-description-item <%= tte.getName() %>"  <%= selected %>><%= WikiRenderer.wiki2html(tte.getDescription(userLang), userLocale, null) %></div>
                </jalios:foreach>
              </div>
            </div>
          </jalios:field>
        </div>
      <% } %>
      
      <% if (showSettingsTab) { %>
        <div class="tab-pane" id="editComplex">
          <% for (TypeFieldEntry typeFieldEntry : formHandler.getPortletTypeFieldEntries()) { %>
            <jalios:field formHandler="<%= formHandler.getEditPortletHandler() %>" name="<%= typeFieldEntry.getName() %>" value="<%= formHandler.getFieldValue(typeFieldEntry) %>">
              <jalios:control settings='<%= formHandler.getTypeFieldEntrySettings(typeFieldEntry) %>' />
            </jalios:field>
          <% } %>
        </div>
      <% } %>
    </div>  
  <% } else { %>
    <% if (Util.notEmpty(formHandler.getPortletTypeFieldEntries())) { %>
      <% for (TypeFieldEntry typeFieldEntry : formHandler.getPortletTypeFieldEntries()) { %>
        <jalios:field formHandler="<%= formHandler.getEditPortletHandler() %>" name="<%= typeFieldEntry.getName() %>" value="<%= formHandler.getFieldValue(typeFieldEntry) %>">
          <jalios:control settings='<%= formHandler.getTypeFieldEntrySettings(typeFieldEntry) %>' />
        </jalios:field>
      <% } %>
    <% } else { %>
      <jalios:noResults text="jportal.simple-edition.no-form-portlet" />
    <% } %>
  <% } %>
  
  <% if (formHandler.showFullEditButton()) { %>
    <jalios:buffer name="MODAL_BUTTON"><jalios:edit css="btn btn-default" redirect='<%= formHandler.getCollaborativeSpace().getDisplayUrl(userLocale) %>' ctxEdit="false" data="<%= formHandler.getAvailableEditedPortlet() %>"><%= glp("ui.com.btn.edit-full") %></jalios:edit></jalios:buffer>
  <% } %>
  <jalios:control settings='<%= new HiddenSettings().name("jportal").value(formHandler.getAvailableJportal().getId()) %>' />
  <jalios:control settings='<%= new HiddenSettings().name("editedPortlet").value(formHandler.getAvailableEditedPortlet().getId()) %>' />
  <jalios:control settings='<%= new HiddenSettings().name("id").value(formHandler.getAvailableEditedPortlet().getId()) %>' />
</jalios:modal>