<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%>
<%@page import="com.jalios.jcms.handler.EditPublicationHandler"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<%
SmartPhonePortalEditorHandler portalHandler = (SmartPhonePortalEditorHandler) request.getAttribute(SmartPhonePortalEditorHandler.FORMHANDLER_REQUEST_ATTR);

jcmsContext.addJavaScript("js/jalios/core/jalios-admin-templates.js");
EditPublicationHandler formHandler  = (EditPublicationHandler) request.getAttribute("formHandler");
EditPublicationHandler genericFormHandler  = formHandler;
if (!AbstractPortletSkinable.class.isAssignableFrom(formHandler.getPublicationClass()) && !(formHandler.getPublication() instanceof AbstractPortletSkinable)) {
  return;
}

TypeTemplateEntry tteCurrent = ((EditPortletSkinableHandler)formHandler).getAvailableTemplateEntry("jmobile");
Set<TypeTemplateEntry> boxTemplateSet = SmartPhonePortalEditorHandler.getPortletTypeTemplateEntrySet(formHandler.getPublicationClass());
%>


<div class="sidebar-tab-title"><%= glp("jportal.edition.sidebar.portlet-edit.templates.title") %></div>
<div class="portal-sidebar-group">
<% if (Util.getSize(boxTemplateSet) > 1 ) { %>
    <jalios:field label='<%= "ui.editportlet.usage.box" %>' css="template-wrapper">
      <select class="form-control template-chooser" name="templates">
        <jalios:foreach collection='<%= boxTemplateSet %>' name="tte" type="TypeTemplateEntry">
          <% String selected = tte == tteCurrent ? "selected='selected'" : ""; %>
          <option value="<%= tte.getName() %>" <%= selected %> data-jalios-path="<%= tte.getPath() %>"><%= itCounter.intValue() %>. <%= tte.getLabel(userLang) %></option>
        </jalios:foreach>
      </select>
      <div class="media">
        <div class="pull-left">
          <img src="<%= tteCurrent.getThumbnailPath() %>" class="template-image img-thumbnail" alt='<%= glp("ui.com.alt.preview")%>'/>
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
  TypeTemplateEntry skinCurrent = ((EditPortletSkinableHandler)formHandler).getAvailableSkinTemplateEntry(SmartPhonePortalManager.TEMPLATE_USAGE_NAME);
  Set<TypeTemplateEntry> boxSkinTemplateSet = SmartPhonePortalEditorHandler.getSkinTemplateEntrySet();
  %>
  <% if (Util.getSize(boxSkinTemplateSet) > 1 ) { %>
      <jalios:field label='<%= "ui.editportlet.usage.skin.box" %>' css="template-wrapper">
        <select class="form-control template-chooser" name="skins">
          <jalios:foreach collection='<%= boxSkinTemplateSet %>' name="tte" type="TypeTemplateEntry">
            <% String selected = tte == skinCurrent ? "selected='selected'" : ""; %>
            <option value="<%= tte.getName() %>" <%= selected %> data-jalios-path="<%= tte.getPath() %>"><%= itCounter.intValue() %>. <%= tte.getLabel(userLang) %></option>
          </jalios:foreach>
        </select>
        <div class="media">
          <div class="pull-left">
            <img src="<%= skinCurrent.getThumbnailPath() %>" class="template-image img-thumbnail"  alt='<%= glp("ui.com.alt.preview")%>'/>
          </div> 
          <div class="media-body">
            <%= glp("jportal.edition.sidebar.portlet-edit.templates-description.label") %>
            <div class="well template-description">
              <jalios:foreach collection="<%= boxSkinTemplateSet %>" name="tte" type="TypeTemplateEntry">
                <% String selected = tte.equals(tteCurrent) ? "" : "style='display:none;'"; %>
                <div class="template-description-item <%= tte.getName() %>"  <%= selected %>><%= WikiRenderer.wiki2html(tte.getDescription(userLang), userLocale, null) %></div>
              </jalios:foreach>
            </div>
          </div>          
        </div>    
      </jalios:field>
  <% } %>
<% } // end of specific AbstractPortletSkinable fields %>
</div>

<input type="hidden" name="templates" value="<%= ((EditPortletSkinableHandler)formHandler).getAvailableTemplateEntry("box").getName() %>" />
<input type="hidden" name="templates" value="<%= ((EditPortletSkinableHandler)formHandler).getAvailableTemplateEntry("full").getName() %>" />
<input type="hidden" name="skins" value="<%= ((EditPortletSkinableHandler)formHandler).getAvailableSkinTemplateEntry("box").getName() %>" />
<input type="hidden" name="skins" value="<%= ((EditPortletSkinableHandler)formHandler).getAvailableSkinTemplateEntry("full").getName() %>" />
<input type="hidden" name="skins" value="<%= ((EditPortletSkinableHandler)formHandler).getAvailableSkinTemplateEntry("collaborativeSpace").getName() %>" />

<div class="buttons">
  <a class="btn btn-default" data-jalios-portal-action="cancel-"><%= glp("ui.com.btn.cancel") %></a>
  <button data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doEditSmartPhonePortletSidebar.jsp" class="btn btn-primary btn-create" name="opUpdate" value="true" data-jalios-action="ajax-refresh"><%= glp("ui.com.btn.save") %></button>
  <%@ include file='/plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doPortalLangChooser.jspf' %>
</div>  