<%@ page import="com.jalios.jcmsplugin.smartphone.*" %>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>

<%
SmartPhoneService service = new DefaultSmartPhoneWSService("jcmsplugin.smartphone.workspace-service.search");
if (!service.isEnabled(jcmsContext)) {
  sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
  return;
}
if (workspace != null) {
	request.setAttribute("jcms.plugin.smartphone.workspace", workspace);
}
%>
<div id="service-search" class="service-search-page" data-role="page">
  <jalios:buffer name="searchTopbarLeftItems">
    <a class="topbar-item open-sort-panel"  href="#topbarSearchSortPopupMenu" data-rel="popup" data-transition="slideup">
      <jalios:icon src="smartphone-topbar-action-sort" />
    </a>
  </jalios:buffer>
  <% request.setAttribute("topbarLeftItems", searchTopbarLeftItems); %>
  
  <div data-role="popup" class="search-topbar-popup topbar-menu-dropdown" id="topbarSearchSortPopupMenu" data-theme="a">
    <ul data-role="listview" data-inset="true" style="min-width:210px;">
      <li data-role="list-divider"><%= glp("ui.portalihm.alt.orderby") %> :</li>
      <% String sort = getStringEnumParameter("sort", "", "cdate", "pdate", "mdate", "relevance"); // FIXME doesn't work %>
      <li <%= "cdate".equals(sort) ? "data-icon=\"check\"" : "data-icon=\"false\"" %>><a class="ajax-autocomplete-refresh" data-jalios-ajax-params='{"sort":"cdate"}' data-jalios-ajax-target=".smartphone-search-autocomplete"><%= glp("ui.com.lbl.cdate-long") %></a></li>
      <li <%= "pdate".equals(sort) ? "data-icon=\"check\"" : "data-icon=\"false\"" %>><a class="ajax-autocomplete-refresh" data-jalios-ajax-params='{"sort":"pdate"}' data-jalios-ajax-target=".smartphone-search-autocomplete"><%= glp("ui.com.lbl.pdate-long") %></a></li>
      <li <%= "mdate".equals(sort) ? "data-icon=\"check\"" : "data-icon=\"false\"" %>><a class="ajax-autocomplete-refresh" data-jalios-ajax-params='{"sort":"mdate"}' data-jalios-ajax-target=".smartphone-search-autocomplete"><%= glp("ui.com.lbl.mdate-long") %></a></li>
      <li <%= "relevance".equals(sort) ? "data-icon=\"check\"" : "data-icon=\"false\"" %>><a class="ajax-autocomplete-refresh" data-jalios-ajax-params='{"sort":"relevance"}' data-jalios-ajax-target=".smartphone-search-autocomplete"><%= glp("ui.com.lbl.relevance") %></a></li>
    </ul>
  </div>
  <%@ include file='/plugins/SmartPhonePlugin/jsp/common/doServiceTopbarMenu.jspf' %>
  <jalios:include jsp="/plugins/SmartPhonePlugin/jsp/service/search/doSearch.jsp"/>
</div>
<%-- EOF #search --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>