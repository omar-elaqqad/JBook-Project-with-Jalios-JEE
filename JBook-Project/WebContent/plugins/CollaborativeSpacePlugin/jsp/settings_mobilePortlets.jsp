<%@page import="com.jalios.jcmsplugin.collaborativespace.EditCSJMobileSettingsHandler"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneWorkspaceManager.CollaborativeSpaceUsage"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneWorkspaceManager"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.portal.CollaborativeSpaceMobileDashboardResolver"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/settings_mobileHandler.jsp" />
<%
EditCSJMobileSettingsHandler csMobileSettingsHandler = (EditCSJMobileSettingsHandler) request.getAttribute("csDisplayMobileSettingsHandler");
request.setAttribute("field-vertical", true);
boolean hasValidated = csMobileSettingsHandler.validate();

/* PortalElement[] portalElements = csMobileSettingsHandler.getMobileDashboardPortlets();
List<PortalElement> portalElementList = Arrays.asList(portalElements);
if (csMobileSettingsHandler.isOpAddPortlet()) {
  portalElementList.add(csMobileSettingsHandler.getAvailableSelectedPortlet());
} */
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/CollaborativeSpacePlugin/jsp/settings_mobilePortlets.jsp" >
  <jalios:field name="mobilePortlets" label="types.CollaborativeSpace.fields.mobilePortlets.label">
    <div class="mobile-portlets">
      <% for (PortalElement itPortalElement : csMobileSettingsHandler.getMobileDashboardPortlets()) { %>
        <% if (itPortalElement != null) { %>
          <div class="mobile-portlet">
            <jalios:thumbnail  path='<%= itPortalElement.getTemplateEntry("jmobile", false).getThumbnailPath() %>' width="320" height="180"><img alt="" src="test.jpg" /></jalios:thumbnail>
            <div class="mobile-portlet-content">
              <div class="mobile-portlet-actions">
                <button type="button" class="btn btn-link btn-rounded mobile-portlet-delete"><jalios:icon src="jcmsplugin-collaborativespace-settings-mobile-portlet-remove" /></button>
                <button type="button" class="btn btn-link btn-rounded mobile-portlet-drag"><jalios:icon src="jcmsplugin-collaborativespace-settings-mobile-portlet-drag" /></button>
              </div>
              <div class="mobile-portlet-name"><%= itPortalElement.getTitle(userLang) %></div>
              <div class="mobile-portlet-template">
                <div class="mobile-portlet-template-name"><%= itPortalElement.getTemplateEntry("jmobile", false).getLabel(userLang) %></div>
                <% if (Util.notEmpty(itPortalElement.getTemplateEntry("jmobile", false).getDescription(userLang))) { %>
                  <div class="mobile-portlet-template-desc"><%= itPortalElement.getTemplateEntry("jmobile", false).getDescription(userLang) %></div>
                <% } %>
              </div>
              <div class="mobile-portlet-workspace"><%= itPortalElement.getWorkspace().getTitle(userLang) %></div>
              <jalios:control settings='<%= new HiddenSettings().name("mobilePortlets").value(itPortalElement.getId()) %>' />
            </div>
          </div>
        <% } %>
      <% } %>
    </div>
    <jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/settings_mobileAddPortlet.jsp" />
  </jalios:field>
</div>