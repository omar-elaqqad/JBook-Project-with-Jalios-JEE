<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSHubHandler.Mode"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ include file="/jcore/doInitPage.jspf"%><%
%><%@ include file="/plugins/CollaborativeSpacePlugin/jsp/hub/doInitApp.jspf"%><%

boolean showSearch = formHandler.showSearch();
// Typology
Category typoRoot = CSManager.getInstance().getTypologyRoot();
Set<Category> selectedCatSet = formHandler.getSelectedCatSet();

boolean showViewsSection = formHandler.showViewsSection();
boolean showAccessPolicyFilter = formHandler.showAccessPolicyFilter();
boolean showCSCreationLink = formHandler.showCSCreationLink();
String createSpaceUrl = "plugins/CollaborativeSpacePlugin/jsp/createSpace.jsp";
if (showCSCreationLink) {
  Category firstTypoActive = formHandler.getFirstActiveTypology();
  if (firstTypoActive != null) {
    createSpaceUrl += "?cids=" + firstTypoActive.getId();
  }
}
%>
<jalios:appSidebar css="no-focus" appUrl="<%= formHandler.getAppJsp() %>"  icon="jcmsplugin-collaborativespace-hub-app-sidebar" iconTitleProp="jcmsplugin.collaborativespace.app.home.title">
  <jalios:include target="PLUGIN_CSP_HUB_SIDEBAR_TOP" />
  <% if (showSearch) { %>
    <jalios:appSidebarSectionSearch css="cs-hub-filter-text" label="jcmsplugin.collaborativespace.hub.search-text.placeholder" placeholder="jcmsplugin.collaborativespace.hub.search-text.placeholder"/>
  <% } %>
  <%-- MODE --%>
  <% if (showViewsSection) { %>
  <jalios:appSidebarSection name="views" css="cs-hub-sidebar-views" title="ui.app.sidebar-section.views">
    <ul class="app-sidebar-menu app-sidebar-menu-formitems mode-filters">
      <% for (Mode mode : formHandler.getModes()) { %>
      <li class="<%= formHandler.isActive(mode) ? "active" : "" %>">
        <% if (formHandler.isActive(mode)) { %>
          <%= JcmsUtil.getHtmlIcon("app-list-check", "", "", "app-list-right-icon", "", userLang) %>
        <% } %>
        <jalios:control settings='<%= formHandler.getModeSettings(mode, userLang) %>' />
      </li>
      <% } %>
      <jalios:include target="PLUGIN_CSP_HUB_SIDEBAR_MODE" />
    </ul>
  </jalios:appSidebarSection>
  <% } %><%-- .showViewsSection --%>
  
  <%-- Type --%>
  <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/hub/doTypeFilter.jspf"%>
  
  <%-- AccessPolicy --%>
  <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/hub/doAccessPolicyFilter.jspf"%>
  
  <jalios:include target="PLUGIN_CSP_HUB_SIDEBAR_FILTER" />
  
  <% if (showCSCreationLink) { %>
    <jalios:appSidebarSection name="actions">
      <jalios:buttonModal icon="add" label="jcmsplugin.collaborativespace.create.lbl.create" title="jcmsplugin.collaborativespace.create.lbl.create" url="<%= createSpaceUrl %>" css="btn btn-default app-sidebar-button create-collaborative-space"/>
    </jalios:appSidebarSection>
  <% } %>
  
  <jalios:include target="PLUGIN_CSP_HUB_SIDEBAR_BOTTOM" />
</jalios:appSidebar>
