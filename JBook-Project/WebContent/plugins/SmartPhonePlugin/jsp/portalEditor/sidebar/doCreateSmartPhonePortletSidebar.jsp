<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<%
request.setAttribute(JPortalEditorHandler.PORTLET_EDITION_REQUEST_ATTR, true);
request.setAttribute(SmartPhonePortalEditorHandler.FORMHANDLER_REQUEST_ATTR, formHandler);
request.setAttribute("jcms.edit.footer.display", false);
request.setAttribute("smartphone.portal-editor-creation", true);
request.setAttribute(EditPortletSkinableHandler.DISPLAY_PORTLET_SKINABLE_FORM_REQUEST_ATTR, false);
request.setAttribute("field-vertical", true);

jcmsContext.addJavaScript("js/jalios/core/jalios-admin-templates.js");
%>
<form>
<div class="edition-sidebar sidebar-component sidebar-left sidebar-tabbed is-open" data-jalios-sidebar-overlay="false" data-jalios-sidebar-direction="left" >
  <div class="sidebar-header-icon">
    <a class="" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.header.back.title")) %>" data-jalios-jmobile-portal-action="cancelPortletOperation"><jalios:icon src="glyph: icomoon-mobile2" />
    </a>
  </div>
  <ul class="sidebar-tabs" role="tablist">
    <li role="presentation" class="active">
      <a href="#PORTLET_SETUP" data-toggle="tab" aria-controls="paths" role="tab" title='<%= encodeForHTMLAttribute(glp("portal.edition.sidebar.portal-edit.tab-edit.title")) %>'>
        <jalios:icon src="jcmsplugin-smartphone-portal-editor-tab-add" />
      </a>
    </li>  
  </ul>
  <div class="sidebar-body">
    <div class="sidebar-tab-title">EDIT</div>
    <div class="portal-sidebar-group">
      <jalios:include jsp="<%= formHandler.getPortletEditTemplatePath() %>" />
      <% EditPortalElementHandler genericFormHandler = (EditPortalElementHandler) request.getAttribute("formHandler"); %>
      <input type="hidden" name="cids" value="" />
    </div>
<%
boolean createSuccess = Util.toBoolean(request.getAttribute("smartphone.portal-editor-creation.success-create"), false);
if (createSuccess || genericFormHandler.validate()) {
  String templateImage = "";
  if(genericFormHandler.getPublication() instanceof PortletSkinable){
    templateImage = ((PortletSkinable) genericFormHandler.getPublication()).getTemplateEntry(SmartPhonePortalManager.TEMPLATE_USAGE_NAME, false).getThumbnailPath();
  }else{
    templateImage =  ((Portlet) genericFormHandler.getPublication()).getPreview(jcmsContext, 300, 200, null);
  }
  String componentImage = Util.isEmpty(templateImage) || genericFormHandler.getPublication() instanceof PortletImage ? ((PortletImage) genericFormHandler.getPublication()).getDataImage() : templateImage;
  componentImage = Util.isEmpty(componentImage) ? "images/jalios/jportal/jportlet/core/Default_grey.png" : componentImage;
%>
  <script>
    jQuery.plugin.SmartphonePortalApp.triggerEvent("createPortlet",{
      portletId: "<%= genericFormHandler.getPublication().getId() %>",
      portletLabel: "<%= encodeForJavaScript(genericFormHandler.getPublication().getTitle(userLang)) %>",
      portletImage: "<%= componentImage %>",
    });
  </script>
<% 
  return;
}

if (AbstractPortletSkinable.class.isAssignableFrom(genericFormHandler.getPublicationClass())) {

TypeTemplateEntry tteCurrent = ((EditPortletSkinableHandler)genericFormHandler).getAvailableTemplateEntry("box");
Set<TypeTemplateEntry> boxTemplateSet = SmartPhonePortalEditorHandler.getPortletTypeTemplateEntrySet(genericFormHandler.getPublicationClass());
%>
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

<% if (PortletSkinable.class.isAssignableFrom(genericFormHandler.getPublicationClass())) { %>
  <%
  //Portlet Skin 
  TypeTemplateEntry skinCurrent = ((EditPortletSkinableHandler)genericFormHandler).getAvailableSkinTemplateEntry(SmartPhonePortalManager.TEMPLATE_USAGE_NAME);
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

  <% }  %>
    <div class="buttons">
      <input type="hidden" name="ws" value="<%= formHandler.getAvailablePortal().getWorkspaceId() %>" />
      <a class="btn btn-default" data-jalios-jmobile-portal-action="cancelPortletOperation"><%= glp("ui.com.btn.cancel") %></a>
      <input type="hidden" name="portletClass" value="<%= formHandler.getAvailablePortletClass().getSimpleName() %>" />
      <button class="btn btn-primary btn-create" data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doCreateSmartPhonePortletSidebar.jsp" name="opCreate" value="true" data-jalios-action="ajax-refresh"><%= glp("ui.com.btn.save") %></button>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doPortalLangChooser.jspf' %>
    </div>      
  </div>
</div>

</form>
<%@ include file='/jcore/doAjaxFooter.jspf' %>
