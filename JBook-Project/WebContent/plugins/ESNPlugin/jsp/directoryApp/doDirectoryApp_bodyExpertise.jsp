<%@page import="com.jalios.jcmsplugin.esn.directory.CompetenceQueryHandler.BreadCrumbItem"%><%
%><%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@page import="com.jalios.jcmsplugin.esn.directory.CompetenceQueryHandler"%><%
%><%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%

if (!ESNManager.getInstance().canAccessExpertDirectory(loggedMember)) {
  return;
}

CompetenceQueryHandler formHandler;

if (jcmsContext.isAjaxRequest()) {
  formHandler = (CompetenceQueryHandler) jcmsContext.getAjaxRequestAttribute(CompetenceQueryHandler.HANDLER_REQUEST_ATTR);
} else {
  formHandler = (CompetenceQueryHandler) request.getAttribute(CompetenceQueryHandler.HANDLER_REQUEST_ATTR);
}

if (formHandler == null) {
  return;
}
// formHandler.validate(): already called in doDirectoryApp_queryExpertise.jsp

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/directoryApp/esn-directory-app-expertise.css");
jcmsContext.addJavaScript("plugins/ESNPlugin/js/esn-directory-app-expertises.js");

ESNManager esnMgr = ESNManager.getInstance();


Set<Category> displayRootSet = formHandler.getCompetenceRootCategories();

Set<String> competenceIds = formHandler.getAvailableCompetenceIds();

Category currentCompetenceCategory = formHandler.getAvailableCurrentCompetenceCategory();
%>
<%-- ESN filters: <%= formHandler.getFilterCompetenceCategories() %> --%>
<%-- ESN current filter: <%= JcmsUtil.dataToString(formHandler.getAvailableCurrentCompetenceCategory()) %> --%>

<div class="expertises-search directory-body-wrapper">
  <%-- Navbar --%>
  <jalios:include jsp="plugins/DirectoryPlugin/jsp/app/doDirectoryApp_directoryNavbar.jsp" />

  <%@ include file='/jcore/doMessageBox.jspf' %>

  <% if (Util.isEmpty(displayRootSet)) { %>
    <p><%= glp("ui.com.lbl.no-result") %></p>
  <% } else { %>
    <%
    Set<Category> pinnedCatSet = formHandler.getAvailableCompetenceCategories();
    %>
    
    <%
    // ----------------------------------------------------------------------
    // BREADCRUMB
    // ----------------------------------------------------------------------
    List<BreadCrumbItem> breadCrumbs = formHandler.getCurrentBreadCrumbs();
    %>
    <% if (Util.notEmpty(breadCrumbs)) { %>
      <div class="esn-directory-explore-breadcrumb">
        <%
        for (BreadCrumbItem item : breadCrumbs) {
          %>
          <% if (item.getCategory() != null) { %>
            <a class="breadcrumb-item breadcrumb-item-category <%= Util.getString(item.getCss(), "") %>" href="#" role="button" onclick="return false;" tabindex="0" data-jalios-data-id="<%= JcmsUtil.getId(item.getCategory()) %>"><span class="breadcrumb-item-label js-title"><%= item.getLabel() %></span></a>
          <% } else { %>
            <a class="breadcrumb-item <%= Util.getString(item.getCss(), "") %>" role="button" onclick="return false;" tabindex="0" data-jalios-data-id="<%= JcmsUtil.getId(item.getCategory()) %>"><span class="breadcrumb-item-label js-title"><%= item.getLabel() %></span></a>
          <% } %>
        <% } %>
      </div>
    <% } %>
    
    <%
    // ----------------------------------------------------------------------
    // PINNED FILTERS
    // ----------------------------------------------------------------------
    %>
    <% if (Util.notEmpty(pinnedCatSet)) { %>
      <div class="expertise-filters pinned-expertises category-filters">
        <%
        String toggleFiltersFilterProp = "jcmsplugin.esn.directory.app.competence.expertise.filters.remove";
        String toggleFiltersFilterLabel = JcmsUtil.glpNoDefault(userLang, toggleFiltersFilterProp, null);
        for (Category pinnedCat : pinnedCatSet) {
          DataAttribute pinnedCatDatAttributes = new DataAttribute();
          pinnedCatDatAttributes.addData("jalios-data-id", pinnedCat.getId());
          %>
          <div class="category-filter-item">
            <%= pinnedCat.getName(userLang) %>
            <a class="category-filter-item-remove" <%= pinnedCatDatAttributes %>
                role="button" onclick="return false;" tabindex="0"
                aria-label="<%= encodeForHTMLAttribute(toggleFiltersFilterLabel) %>"
                title="<%= encodeForHTMLAttribute(toggleFiltersFilterLabel) %>"
                data-toggle="tooltip" data-placement="top">
              <span class="jalios-icon cross icomoon-cross2"></span>
            </a>
          </div>
        <% } %>
      </div>
    <% } %>

    <%
    // ----------------------------------------------------------------------
    // EXPLORE FILTERS
    // ----------------------------------------------------------------------
    %>
    <div class="expertise-filters category-filters">
    
      <div id="competenceContextMenu" class="competence-context-menu dropdown clearfix">
        <ul class="competence-dropdown dropdown-menu" role="menu"<%
            %> aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.directory.app.context-menu-label")) %>"<%
            %> style="display:block;position:static;margin-bottom:5px;">
        </ul>
      </div>
    
      <jalios:include jsp="/plugins/ESNPlugin/jsp/directoryApp/categories/doDirectoryApp_categoriesCards.jsp" />
  </div>

  <% } %>
</div>

<%-- Results --%>
<jalios:include resource="directory.app.results" />

<%= formHandler.getFormStepHiddenFields() %>