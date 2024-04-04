<%--
  @Summary: Search facet to extend search to sub Workspaces.
  @Deprecated: False
  @Customizable: False
  @Category: Search / Query
  @Since: jcms-7.1.3, jcms-8.0
--%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%

int boxStatus = Util.toInt(request.getAttribute("query.facets.workspaces"),0);
if (boxStatus == 0){ return; }

QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");

if (qh == null) {
  return;
}

// Have workspace any Sub workspaces ?
Workspace forcedWS = getWorkspaceParameter("wrkspc");
forcedWS = forcedWS != null ? forcedWS : workspace;
if (Util.isEmpty(forcedWS.getAllSubWorkspaces())) {
  return;
}
if (qh.getSearchInSubWorkspaces()){
  boxStatus = 1;
}

final String facetName = "searchInSubWorkspaces";
boolean checked = getBooleanParameter(facetName, false);
String sidebarFilterId="filterWS";
boolean collapsed =  boxStatus == 2;
String[] labels = new String[] {glp("ui.work.search.ws")};
Object[] values = new Object[] {"true"};
%>
<jalios:appSidebarSection icon="search-workspace" title='<%= glp("ui.work.search.tab.ws") %>' name="workspace" collapsable="true" collapsed='<%= collapsed %>'>
  <ul class="app-sidebar-menu app-sidebar-menu-formitems" >
    <jalios:field name="<%= facetName %>" value="<%= checked %>" resource="field-light">
      <jalios:control settings='<%= 
      new EnumerateSettings().checkbox()
      .enumValues(values)
      .enumLabels(labels)
      .dataAttribute("jalios-action", "ajax-refresh") %>' />
    </jalios:field>
  </ul>
</jalios:appSidebarSection>