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
boolean showAddPortlet = !hasParameter("opUpdate") && Util.notEmpty(csMobileSettingsHandler.getAvailableSelectedPortletType());
%>
<% if (csMobileSettingsHandler.isOpAddPortlet() && hasValidated) { %>
  <% Portlet addedPortlet = csMobileSettingsHandler.getAvailableSelectedPortlet(); %>
  <div class="mobile-portlet added-portlet">
    <img alt="" src="<%= addedPortlet.getTemplateEntry("jmobile", false).getThumbnailPath() %>" />
    <div class="mobile-portlet-content">
      <div class="mobile-portlet-actions">
        <button aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.settings.lbl.jmobile-delete-portlet")) %>" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.settings.lbl.jmobile-delete-portlet")) %>" type="button" class="btn btn-link btn-rounded mobile-portlet-delete"><jalios:icon src="delete" /></button>
        <button aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.settings.lbl.jmobile-drag-portlet")) %>" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.settings.lbl.jmobile-drag-portlet")) %>" type="button" class="btn btn-link btn-rounded mobile-portlet-drag"><jalios:icon src="glyph: icomoon-menu3" /></button>
      </div>
      <div class="mobile-portlet-name"><%= addedPortlet.getTitle(userLang) %></div>
      <div class="mobile-portlet-template">
        <div class="mobile-portlet-template-name"><%= addedPortlet.getTemplateEntry("jmobile", false).getLabel(userLang) %></div>
        <% if (Util.notEmpty(addedPortlet.getTemplateEntry("jmobile", false).getDescription(userLang))) { %>
          <div class="mobile-portlet-template-desc"><%= addedPortlet.getTemplateEntry("jmobile", false).getDescription(userLang) %></div>
        <% } %>
      </div>
      <div class="mobile-portlet-workspace"><%= addedPortlet.getWorkspace().getTitle(userLang) %></div>
      <jalios:control settings='<%= new HiddenSettings().name("mobilePortlets").value(addedPortlet.getId()) %>' />
    </div>
  </div>
<% } %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/CollaborativeSpacePlugin/jsp/settings_mobileAddPortlet.jsp" >
  <% if (!showAddPortlet) { %>
  <button type="button" class="mobile-portlet mobile-portlet-add js-toggle-add-portlet" data-jalios-action="toggle:hide" data-jalios-target=".js-toggle-add-portlet">
    <jalios:icon src="add" /> <%= glp("jcmsplugin.collaborativespace.settings.lbl.add-portlet") %>
  </button>
  <% } %>
  <div class="mobile-portlet mobile-portlet-add-form js-toggle-add-portlet <% if (!showAddPortlet) { %>hide<% } %>">
    <%@ include file='/jcore/doMessageBox.jspf' %>
    <jalios:field name="selectedPortletType" label="Portlet type" value="<%= csMobileSettingsHandler.getAvailableSelectedPortletType() %>">
      <jalios:control settings="<%= csMobileSettingsHandler.getSmartPhonePortletTypeSettings() %>" />
    </jalios:field>
    <% Set<Portlet> mobilePortlets = csMobileSettingsHandler.getMobilePortletsForType(); %>
    <% if (Util.isEmpty(mobilePortlets) && Util.notEmpty(csMobileSettingsHandler.getAvailableSelectedPortletType())) { %>
      <p>No portlet available for this type.</p>
    <% } else if (Util.notEmpty(mobilePortlets)) { %>
      <jalios:field name="selectedPortlet" label="Portlet">
        <jalios:control settings="<%= csMobileSettingsHandler.getSmartPhonePortletSettings() %>" />
      </jalios:field>
      <button type="submit" name="opAddPortlet" value="true" data-jalios-action="ajax-refresh" class="btn btn-primary"><%= glp("ui.com.btn.add") %></button>
    <% } %>
  </div>
</div>