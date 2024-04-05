<%@ include file="/plugins/SmartPhonePlugin/types/AbstractPortletSkinable/doInitAbstractPortletSkinableMobileDisplay.jspf" %>
<div class="portlet-skinable-wrapper portlet-skinable-wrapper-light portlet-type-<%= portlet.getClass().getSimpleName() %> <%= portlet.getCssClasses()%>">
  <div class="ajax-refresh-wrapper" data-jalios-ajax-action="<%= templatePath %>">
    <%= portletInclude %>
  </div>
</div>