<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.docs"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  
  String[] dskTypes = qh.getDocumentKinds();
  Set<String> kindSet = new HashSet<String>();
  if (dskTypes != null){
    kindSet.addAll(Arrays.asList(dskTypes));
    boxStatus = 1;
  }
  String sidebarFilterId="filterDocs";
  boolean collapsed =  boxStatus == 2;
%>
<jalios:appSidebarSection icon="search-document" title='<%= glp(lblPrefix + "kind") %>' name="docs" collapsable="true" collapsed='<%= collapsed %>'>
  <ul class="app-sidebar-menu">
    <%
      // Retrieve map of the "kind group name" to "document kind group label"
      Map<String,String> kindGroupMap = QueryHandler.getDocumentKindsGroupMap(userLang);
      for (Map.Entry<String,String> groupEntry : kindGroupMap.entrySet()) {
        String kindGroupName = groupEntry.getKey();
        String kindGroupLabel = groupEntry.getValue();
    %>
    <li>
      <a data-toggle="collapse" data-target="#<%= kindGroupName %>" tabindex="0" aria-expanded="<%= collapsed ? "false" : "true" %>" aria-controls="<%= kindGroupName %>" role="button" class="app-sidebar-menu-node <%= collapsed ? "collapsed" : "" %>"><%= kindGroupLabel %></a>
      <ul class="app-sidebar-menu app-sidebar-menu-formitems <%= collapsed ? "collapse" : "collapse in" %>" id="<%= kindGroupName %>">
        <% 
          Map<String,String> kindMap = QueryHandler.getDocumentKindsMap(userLang, kindGroupName);
          for (Map.Entry<String,String> kindEntry : kindMap.entrySet()) {
            String kindName = kindEntry.getKey();
            String kindLabel = kindEntry.getValue();
            String kindHelp = "file-document.kinds." + kindName + ".h";
            String kindIcon = channel.getProperty("file-document.kinds." + kindName + ".icon", "s.gif"); 
            String kindUserInputId = FACET_PREFIX + "kind" + kindName; 
            boolean checked = kindSet.contains(kindName);
        %>
        <li <%= checked ? "class='active'" : "" %>>
          <% if (checked) { %>
          <jalios:icon src="app-list-check" css="app-list-right-icon"/>
          <% } %>
          <label for="<%= kindUserInputId %>" role="button" tabindex="0"> 
            <input id="<%= kindUserInputId %>" type="checkbox" name="documentKinds" value="<%= kindName %>" <%= checked ? "checked='checked'" : "" %> data-jalios-action="ajax-refresh" />
            <jalios:tooltip property="<%= kindHelp %>" icon="<%= kindIcon %>" />
            <%= kindLabel %>
          </label>
        </li>
        <% } %>
      </ul>
    </li>
    <% } %>
  </ul>
</jalios:appSidebarSection>