<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%>
<%@page import="com.jalios.jcms.handler.EditPublicationHandler"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<%
SmartPhonePortalEditorHandler portalHandler = (SmartPhonePortalEditorHandler) request.getAttribute(SmartPhonePortalEditorHandler.FORMHANDLER_REQUEST_ATTR);

jcmsContext.addJavaScript("js/jalios/core/jalios-admin-templates.js");
EditPortalElementHandler genericFormHandler  = (EditPortalElementHandler) request.getAttribute("formHandler");
if (!AbstractPortletSkinable.class.isAssignableFrom(genericFormHandler.getPublicationClass()) && !(genericFormHandler.getPublication() instanceof AbstractPortletSkinable)) {
  return;
}

TypeTemplateEntry tteCurrent = ((EditPortletSkinableHandler)genericFormHandler).getAvailableTemplateEntry("box");
Set<TypeTemplateEntry> boxTemplateSet = SmartPhonePortalEditorHandler.getPortletTypeTemplateEntrySet(genericFormHandler.getPublicationClass());

boolean isSkinablePortlet = channel.getPublication(portalHandler.getPortletId()) instanceof AbstractPortletSkinable;

%>
<div class="sidebar-tab-title"><%= glp("jportal.edition.sidebar.portlet-edit.advanced.title") %></div>
<% if (isSkinablePortlet) { %>
  <%@ include file='/jcore/jportal/portletSidebar/doJPortletMiscContent.jspf' %>
<% } %>
<%@ include file='/jcore/jportal/portletSidebar/doJPortletCacheContent.jspf' %>
<div class="buttons">
  <a class="btn btn-default" data-jalios-portal-action="cancel-"><%= glp("ui.com.btn.cancel") %></a>
  <button data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doEditSmartPhonePortletSidebar.jsp" class="btn btn-primary btn-create" name="opUpdate" value="true" data-jalios-action="ajax-refresh"><%= glp("ui.com.btn.save") %></button>
  <%@ include file='/plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doPortalLangChooser.jspf' %>
</div>  