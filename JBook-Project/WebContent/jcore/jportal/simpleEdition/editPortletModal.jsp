<%@page import="com.jalios.jcms.jportal.JPortalEditPortletUIHandler.SkinSection"%>
<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditPortletUIHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean><%
boolean showJPortalSettings = Util.toBoolean(request.getAttribute("jportal.show-portlet-settings"), true);
jcmsContext.addJavaScript("js/jalios/core/jalios-admin-templates.js");
boolean showSettingsTab = formHandler.showSettingsTab(); %>
<%-- Bufferize portlet handler to set it to the formHandler --%>
<jalios:buffer name="editPortletTemplateAndHandler">
  <% request.setAttribute("bypass-abstract-portlet-form", true); %>
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
    jQuery.jalios.AjaxRefresh.refreshPortlet("<%= formHandler.getAvailableEditedPortlet().getId() %>", function() {
      jQuery("div[data-portlet-id=<%= formHandler.getAvailableEditedPortlet().getId()  %>] .ajax-loading-component").remove();
    }, 
    {
      jaliosSkinHeaderIcon: "<%= Util.notEmpty(formHandler.getSkinHeaderIcon()) ? formHandler.getSkinHeaderIcon() : "" %>"
    }
    );
    jQuery("div[data-portlet-id=<%= formHandler.getAvailableEditedPortlet().getId()  %>]").displayLoading();
    
    jQuery.jalios.jportal.utils.refreshJPortalCSS();
    jQuery.jalios.ui.Modal.close(false);
  </script>
<% } %>
<jalios:modal css="modal-lg jportal-edit-portlet" op="opUpdateUI" button="ui.com.btn.save" formHandler="<%= formHandler %>" title="portlet.edit-skin-modal" url="jcore/jportal/simpleEdition/editPortletModal.jsp">
  <% if (formHandler.isSkinablePortlet()) { %>
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
      <li class="active"><a href="#header" role="tab" data-toggle="tab" onclick="return false;"><%= glp("jportal.edition.sidebar.ui.jalios-skin.title") %></a></li>
      <% if (formHandler.showTemplateTab()) { %>
        <li><a href="#templates" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.form.lbl.templates") %></a></li>
      <% } %>
      <% if (showSettingsTab) { %>
        <li><a href="#editComplex" role="tab" data-toggle="tab" onclick="return false;"><%= glp("jportal.edition.sidebar.ui.settings") %></a></li>
      <% } %>
    </ul>
    
    <!-- Tab panes -->
    <div class="tab-content">
      <div class="tab-pane active" id="header">
        <%
        //Portlet Skin
        if (formHandler.canWorkOnPortlet()) {
          Set<TypeTemplateEntry> boxSkinTemplateSet = formHandler.getTemplateEntrySet();
          %>
          <% if (Util.getSize(boxSkinTemplateSet) > 1 ) { %>
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
          <% if (showJPortalSettings && formHandler.showSection(SkinSection.HEADER_SECONDARY_COLOR)) { %>
            <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderSecondaryColor() %>" name="skinHeaderSecondaryColor" label="jportal.edition.sidebar.ui.jalios-skin-header-secondary.label" description="jportal.edition.sidebar.ui.jalios-skin-header-secondary.help">
              <jalios:control settings='<%= new ColorSettings().paletteColorsProperty("portlet-header-secondary-colorpicker") %>' />
            </jalios:field>
          <% } else { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderSecondaryColor").value(formHandler.getSkinHeaderSecondaryColor()) %>' />
          <% } %>
          <% if (formHandler.canWorkOnPortlet() && formHandler.showSection(SkinSection.HEADER_TITLE)) { %>
            <jalios:field resource="field-horizontal" ml="true" value="<%= ((EditPortletSkinableHandler) portletHandler).getAllAvailableDisplayTitleML() %>" name="displayTitle" label="jportal.edition.sidebar.ui.jalios-skin-header-display-title">
              <jalios:control settings='<%= new TextFieldSettings().placeholder(formHandler.getAvailableEditedPortlet().getTitle()) %>' />
            </jalios:field>
          <% } else { %>
            <% for (String itLang : ((EditPortletSkinableHandler) portletHandler).getAllAvailableDisplayTitleML().keySet()) { %>
              <jalios:control settings='<%= new HiddenSettings().name("displayTitle").value(((EditPortletSkinableHandler) portletHandler).getAllAvailableDisplayTitleML().get(itLang)) %>' />
            <% } %>
          <% } %>
          <% if (showJPortalSettings) { %>
            <% if (formHandler.showSection(SkinSection.HEADER_PRIMARY_COLOR)) { %>
              <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderPrimaryColor() %>" name="skinHeaderPrimaryColor" label="jportal.edition.sidebar.ui.jalios-skin-header-primary.label" description="jportal.edition.sidebar.ui.jalios-skin-header-primary.help">
                <jalios:control settings='<%= new ColorSettings().paletteColorsProperty("portlet-header-primary-colorpicker") %>' />
              </jalios:field>
            <% } else { %>
              <jalios:control settings='<%= new HiddenSettings().name("skinHeaderPrimaryColor").value(formHandler.getSkinHeaderPrimaryColor()) %>' />
            <% } %>
            <% if (formHandler.showSection(SkinSection.HEADER_ICON)) { %>
              <% 
                boolean isFieldSkinHeaderIconVisible = formHandler.isFieldSkinHeaderIconVisible();
              %>
              <jalios:field label="jportal.edition.sidebar.ui.jalios-skin-header-icon.label" name="skinHeaderIconDisplay" value="<%= isFieldSkinHeaderIconVisible %>">
                <jalios:control settings='<%= new BooleanSettings().dataAttribute("jalios-action", "toggle:hide").dataAttribute("jalios-target",".skinHeaderIconDisplay")  %>' />
              </jalios:field>
              <div class="skinHeaderIconDisplay <%= isFieldSkinHeaderIconVisible ? "" : "hide" %>">
                <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderIcon() %>" name="skinHeaderIcon"  description="jportal.edition.sidebar.ui.jalios-skin-header-icon.help">
                  <jalios:control settings='<%= new IconSettings().placeholder("jportal.edition.sidebar.ui.jalios-skin-header-icon.placeholder").iconPropPrefix(channel.getProperty("widget-icon.portlet-skin-set-prefix")) %>' />
                </jalios:field>
                <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinHeaderIconColor() %>" name="skinHeaderIconColor"  description="jportal.edition.sidebar.ui.jalios-skin-header-icon-color.help">
                  <jalios:control settings='<%= new ColorSettings().placeholder("jportal.edition.sidebar.ui.jalios-skin-header-icon-color.placeholder").paletteColorsProperty("portlet-header-icon-colorpicker") %>' />
                </jalios:field>
              </div>
            <% } else { %>
              <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIconDisplay").value(true) %>' />
              <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIcon").value(formHandler.getSkinHeaderIcon()) %>' />
              <jalios:control settings='<%= new HiddenSettings().name("skinHeaderIconColor").value(formHandler.getSkinHeaderIconColor()) %>' />
            <% } %>
          <% } %>
        <% } else { %>
          <% if (formHandler.canWorkOnPortlet()  && formHandler.showSection(SkinSection.HEADER_TITLE)) { %>
            <jalios:field resource="field-horizontal" ml="true" value="<%= ((EditPortletSkinableHandler) portletHandler).getAllAvailableDisplayTitleML() %>" name="displayTitle" label="jportal.edition.sidebar.ui.jalios-skin-header-display-title">
              <jalios:control settings='<%= new TextFieldSettings().placeholder(formHandler.getAvailableEditedPortlet().getTitle()) %>' />
            </jalios:field>
          <% } else { %>
            <% for (String itLang : ((EditPortletSkinableHandler) portletHandler).getAllAvailableDisplayTitleML().keySet()) { %>
              <jalios:control settings='<%= new HiddenSettings().name("displayTitle").value(((EditPortletSkinableHandler) portletHandler).getAllAvailableDisplayTitleML().get(itLang)) %>' />
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
            String fieldskinHeaderSubTextCss = isFieldskinHeaderSubTextVisible ? "field-skinHeaderSubText" : "field-skinHeaderSubText hide";
          %>
          <jalios:field label="types.AbstractPortletSkinable.fields.skinHeaderSubText.label" value="<%= isFieldskinHeaderSubTextVisible %>" formHandler="<%= ((EditPortletSkinableHandler) portletHandler) %>" name="skinHeaderSubTextDisplay">
            <jalios:control settings='<%= new BooleanSettings().dataAttribute("jalios-action", "toggle:hide").dataAttribute("jalios-target",".field-skinHeaderSubText")  %>' />
          </jalios:field>
          <jalios:field resource="field-horizontal" css="<%= fieldskinHeaderSubTextCss %>" label="" description="types.AbstractPortletSkinable.fields.skinHeaderSubText.help" value="<%= formHandler.getSkinHeaderSubTextML() %>" name="skinHeaderSubText">
            <jalios:control settings='<%= new TextFieldSettings().placeholder("types.AbstractPortletSkinable.fields.skinHeaderSubText.label") %>' />
          </jalios:field>
        <% } else { %>
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderSubTextDisplay").value(true) %>' />
          <% for (String itLang : formHandler.getSkinHeaderSubTextML().keySet()) { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderSubText").value(formHandler.getSkinHeaderSubTextML().get(itLang)) %>' />
          <% } %>
        <% } %>
        <% if (formHandler.isSkinablePortlet()) { %>
          <% 
            boolean isFieldSkinHeaderButtonVisible = formHandler.isFieldSkinHeaderButtonVisible(); 
            boolean isFieldSkinFooterButtonVisible = formHandler.isFieldSkinFooterButtonVisible(); 
          %>
          <% if (formHandler.showSection(SkinSection.HEADER) && formHandler.showSection(SkinSection.HEADER_BUTTON)) { %>
            <jalios:field label="types.AbstractPortletSkinable.fields.skinHeaderButtonLabel.label" name="skinHeaderButtonDisplay" value="<%= isFieldSkinHeaderButtonVisible %>">
              <jalios:control settings='<%= new BooleanSettings().dataAttribute("jalios-action", "toggle:hide").dataAttribute("jalios-target",".skinHeaderButtonDisplay")  %>' />
            </jalios:field>
            <div class="skinHeaderButtonDisplay <%= isFieldSkinHeaderButtonVisible ? "" : "hide" %>">
              <jalios:field resource="field-horizontal" formHandler="<%= ((EditPortletSkinableHandler) portletHandler) %>" label="" value="<%= ((EditPortletSkinableHandler) portletHandler).getAllAvailableSkinFooterButtonLabelML() %>" name="skinHeaderButtonLabel" >
                <jalios:control settings='<%= new TextFieldSettings().placeholder("types.AbstractPortletSkinable.fields.skinHeaderButtonLabel.placeholder") %>' />
              </jalios:field>
              <jalios:field resource="field-horizontal" formHandler="<%= ((EditPortletSkinableHandler) portletHandler) %>" label="" value="<%= formHandler.getSkinHeaderButtonLink() %>" name="skinHeaderButtonLink">
                <jalios:control settings='<%= new UrlSettings() %>' />
              </jalios:field>
            </div>
          <% } else { %>
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderButtonDisplay").value(true) %>' />
          <% for (String itLang : ((EditPortletSkinableHandler) portletHandler).getAllAvailableSkinFooterButtonLabelML().keySet()) { %>
            <jalios:control settings='<%= new HiddenSettings().name("skinHeaderButtonLabel").value(((EditPortletSkinableHandler) portletHandler).getAllAvailableSkinFooterButtonLabelML().get(itLang)) %>' />
          <% } %>
          <jalios:control settings='<%= new HiddenSettings().name("skinHeaderButtonLink").value(formHandler.getSkinHeaderButtonLink()) %>' />                  
          <% } %>
          <% if (formHandler.showSection(SkinSection.FOOTER_BUTTON)) { %>
            <jalios:field label="types.AbstractPortletSkinable.fields.skinFooterButtonLabel.label" name="skinFooterButtonDisplay" value="<%= isFieldSkinFooterButtonVisible %>">
              <jalios:control settings='<%= new BooleanSettings().dataAttribute("jalios-action", "toggle:hide").dataAttribute("jalios-target",".skinFooterButtonDisplay")  %>' />
            </jalios:field>
            <div class="skinFooterButtonDisplay <%= isFieldSkinFooterButtonVisible ? "" : "hide" %>">
              <jalios:field resource="field-horizontal" value="<%= formHandler.getSkinFooterButtonLabelML() %>" name="skinFooterButtonLabel">
                <jalios:control settings='<%= new TextFieldSettings().placeholder("types.AbstractPortletSkinable.fields.skinFooterButtonLabel.placeholder") %>' />
              </jalios:field>
              <jalios:field resource="field-horizontal" label="" formHandler="<%= ((EditPortletSkinableHandler) portletHandler) %>" value="<%= ((EditPortletSkinableHandler) portletHandler).getAvailableSkinFooterButtonLink() %>" name="skinFooterButtonLink">
                <jalios:control />
              </jalios:field>
              <jalios:field resource="field-horizontal" label="" formHandler="<%= ((EditPortletSkinableHandler) portletHandler) %>" value="<%= ((EditPortletSkinableHandler) portletHandler).getAvailableSkinFooterButtonAlign() %>" required="true" name="skinFooterButtonAlign">
                <jalios:control />
              </jalios:field>
            </div>
            <% } else { %>
              <jalios:control settings='<%= new HiddenSettings().name("skinFooterButtonDisplay").value(true) %>' />
              <% for (String itLang : formHandler.getSkinFooterButtonLabelML().keySet()) { %>
                <jalios:control settings='<%= new HiddenSettings().name("skinFooterButtonLabel").value(formHandler.getSkinFooterButtonLabelML().get(itLang)) %>' />
              <% } %>
              <jalios:control settings='<%= new HiddenSettings().name("skinFooterButtonLink").value(((EditPortletSkinableHandler) portletHandler).getAvailableSkinFooterButtonLink()) %>' />   
              <jalios:control settings='<%= new HiddenSettings().name("skinFooterButtonAlign").value(((EditPortletSkinableHandler) portletHandler).getAvailableSkinFooterButtonAlign()) %>' />   
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
          <%= editPortletTemplateAndHandler %>
        </div>
      <% } %>
    </div>  
  <% } else { %>
    <% if (Util.notEmpty(editPortletTemplateAndHandler)) { %>
      <%= editPortletTemplateAndHandler %>
    <% } else { %>
      <jalios:noResults text="jportal.simple-edition.no-form-portlet" />
    <% } %>
  <% } %>
  
  <% if (formHandler.showFullEditButton()) { %>
    <% PortalInterface redirectPortal = workspace.isCollaborativeSpace() ? workspace.getHomePortal() : displayPortal; %>
    <jalios:buffer name="MODAL_BUTTON"><jalios:edit css="btn btn-default" ctxEdit="false" redirect="<%= redirectPortal.getDisplayUrl(userLocale) %>"  data="<%= formHandler.getAvailableEditedPortlet() %>"><%= glp("ui.com.btn.edit-full") %></jalios:edit></jalios:buffer>
  <% } %>
    
  <jalios:control settings='<%= new HiddenSettings().name("jportal").value(formHandler.getAvailableJportal().getId()) %>' />
  <jalios:control settings='<%= new HiddenSettings().name("editedPortlet").value(formHandler.getAvailableEditedPortlet().getId()) %>' />
  <jalios:control settings='<%= new HiddenSettings().name("id").value(formHandler.getAvailableEditedPortlet().getId()) %>' />
</jalios:modal>