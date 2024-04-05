<%@ include file="/plugins/SmartPhonePlugin/types/AbstractPortletSkinable/doInitAbstractPortletSkinableMobileDisplay.jspf" %>
<div class="portlet-skinable-wrapper portlet-skinable-wrapper-default portlet-type-<%= portlet.getClass().getSimpleName() %> <%= portlet.getCssClasses()%>" data-jalios-data-id="<%= portlet.getId() %>">
  <div class="portlet-title"><%= Util.notEmpty(portlet.getDisplayTitle(userLang)) ? portlet.getDisplayTitle(userLang) : portlet.getTitle(userLang) %></div>
  <div class="ajax-refresh-wrapper" data-jalios-ajax-action="<%= templatePath %>">
    <%= portletInclude %>
  </div>
</div>