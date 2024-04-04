<%@page import="java.util.stream.Collectors"%>
<%@page import="com.jalios.jcms.handler.EditPublicationHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!Util.toBoolean(request.getAttribute(JPortalEditorHandler.PORTLET_EDITION_REQUEST_ATTR), false)) {
  return;
}

jcmsContext.addJavaScript("js/jalios/core/jalios-admin-templates.js");
EditPublicationHandler formHandler  = (EditPublicationHandler) request.getAttribute("formHandler");
if (!AbstractPortletSkinable.class.isAssignableFrom(formHandler.getPublicationClass()) && !(formHandler.getPublication() instanceof AbstractPortletSkinable)) {
  return;
}

JPortalEditorHandler jportalEditorHandler = (JPortalEditorHandler) request.getAttribute("jportalEditorHandler");


// Portlet Template
TypeTemplateEntry tteCurrent = ((EditPortletSkinableHandler)formHandler).getAvailableTemplateEntry("box");
Set<TypeTemplateEntry> boxTemplateSet = JPortalEditorHandler.getPortletTypeTemplateEntrySet(formHandler.getPublicationClass());
%>
<% if (Util.getSize(boxTemplateSet) > 1 ) { %>
  <%
  // Order
  Set<TypeTemplateEntry> tteSet = new TreeSet<TypeTemplateEntry>(new TypeTemplateEntry.LabelComparator(userLang));
  tteSet.addAll(boxTemplateSet);
  %>
  <%-- Provide map of other templates usage values --%>
  <% for (String itUsage : channel.getTypeEntry(AbstractPortletSkinable.class).getTemplateUsageSet()) { %>
    <% if (!"box".equals(itUsage)) { %>
      <input type="hidden" name="templates" value="<%= itUsage %>.<%= ((EditPortletSkinableHandler)formHandler).getAvailableTemplateEntry(itUsage).getInternalName() %>" />
    <% } %>
  <% } %>
  <jalios:field label='ui.editportlet.usage.box' css="template-wrapper">
    <select class="form-control template-chooser" name="templates">
      <jalios:foreach collection='<%= tteSet %>' name="tte" type="TypeTemplateEntry">
        <% String selected = tte == tteCurrent ? "selected='selected'" : ""; %>
        <option value="<%= tte.getName() %>" <%= selected %> data-jalios-path="<%= tte.getPath() %>"><%= itCounter.intValue() %>. <%= tte.getLabel(userLang) %></option>
      </jalios:foreach>
    </select>
    <div class="media">
      <div class="pull-left">
        <img src="<%= tteCurrent.getThumbnailPath() %>" class="template-image img-thumbnail" alt='<%= encodeForHTMLAttribute(glp("ui.com.alt.preview")) %>'/>
      </div>
      <div class="media-body">
        <%-- Description --%>
        <div class="well template-description">
          <jalios:foreach collection="<%= boxTemplateSet %>" name="tte" type="TypeTemplateEntry">
            <% String selected = tte.equals(tteCurrent) ? "" : "style='display:none;'"; %>
            <div class="template-description-item <%= tte.getName() %>"  <%= selected %>><%= WikiRenderer.wiki2html(tte.getDescription(userLang), userLocale, null) %></div>
          </jalios:foreach>
        </div>
      </div>
    </div>
  </jalios:field>
<% } %>

<% if (PortletSkinable.class.isAssignableFrom(formHandler.getPublicationClass())) { %>
  <%
  //Portlet Skin
  TypeTemplateEntry skinCurrent = ((EditPortletSkinableHandler)formHandler).getAvailableSkinTemplateEntry(jportalEditorHandler.getSkinUsage());
  Set<TypeTemplateEntry> boxSkinTemplateSet = JPortalEditorHandler.getSkinTemplateEntrySet(jportalEditorHandler.getAvailableJPortal());
  %>
  <% if (Util.getSize(boxSkinTemplateSet) > 1 ) { %>
    <%
    // Order
    Set<TypeTemplateEntry> tteSet = new TreeSet<TypeTemplateEntry>(new TypeTemplateEntry.LabelComparator(userLang));
    tteSet.addAll(boxSkinTemplateSet);
    %>
    <%-- Provide map of other templates usage values --%>
    <% for (String itUsage : channel.getTypeEntry(AbstractPortletSkinable.class).getTemplateUsageSet()) { %>
      <% if (!jportalEditorHandler.getSkinUsage().equals(itUsage)) { %>
        <input type="hidden" name="skins" value="<%= itUsage %>.<%= ((EditPortletSkinableHandler)formHandler).getAvailableSkinTemplateEntry(itUsage).getInternalName() %>" />
      <% } %>
    <% } %>
    <jalios:field label='ui.editportlet.usage.skin.box' css="template-wrapper">
      <select class="form-control template-chooser" name="skins">
        <jalios:foreach collection='<%= tteSet %>' name="tte" type="TypeTemplateEntry">
          <% String selected = tte == skinCurrent ? "selected='selected'" : ""; %>
          <option value="<%= tte.getName() %>" <%= selected %> data-jalios-path="<%= tte.getPath() %>"><%= itCounter.intValue() %>. <%= tte.getLabel(userLang) %></option>
        </jalios:foreach>
      </select>
      <div class="media">
        <div class="pull-left">
          <img src="<%= skinCurrent.getThumbnailPath() %>" class="template-image img-thumbnail" alt='<%= encodeForHTMLAttribute(glp("ui.com.alt.preview")) %>'/>
        </div>
        <div class="media-body">
          <%= glp("jportal.edition.sidebar.portlet-edit.templates-description.label") %>
          <div class="well template-description">
            <jalios:foreach collection="<%= boxSkinTemplateSet %>" name="tte" type="TypeTemplateEntry">
              <% String selected = tte.equals(skinCurrent) ? "" : "style='display:none;'"; %>
              <div class="template-description-item <%= tte.getName() %>"  <%= selected %>><%= WikiRenderer.wiki2html(tte.getDescription(userLang), userLocale, null) %></div>
            </jalios:foreach>
          </div>
        </div>
      </div>
    </jalios:field>
  <% } %>
  <%-- Classes  --%>
<%--   <% String skinClassesValues  = ((EditPortletSkinableHandler)formHandler).getAvailableSkinClasses(); %> --%>
<%--   <jalios:field name='<%= "skinClasses" %>' label="ui.editportlet.skinclasses" tooltip="ui.editportlet.skinclasses.h" value='<%= skinClassesValues %>'> --%>
<%--     <jalios:control type="<%= ControlType.TEXTFIELD %>" /> --%>
<%--   </jalios:field> --%>
<%-- Skin footer  --%>
<%--   <% HashMap<String,String> skinFooterML  = ((EditPortletSkinableHandler)formHandler).getAllAvailableSkinFooterML(); %> --%>
<%--   <jalios:field name='<%= "skinFooter" %>' label="types.AbstractPortletSkinable.fields.skinFooter.label" value='<%= skinFooterML %>' ml="true"> --%>
<%--     <jalios:control settings='<%= new WysiwygSettings().configurationId("light").dataAttribute("data-height", "30").dataAttribute("data-min_height", "30") %>' /> --%>
<%--   </jalios:field> --%>
<% } // end of specific AbstractPortletSkinable fields %>