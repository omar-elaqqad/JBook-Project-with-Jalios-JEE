<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.types"),0);
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  boolean advanced    = channel.getBooleanProperty("query.facets.advanced",false);
  QueryResultSet queryResultSet = (QueryResultSet) request.getAttribute("query.queryResultSet");
  boolean refine = false;
  String lblPrefix = refine ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  
  Set<Class<? extends Publication>> dstClassSet        = qh.getClassSet(); 
  Set dstRefineSet       = (Set) request.getAttribute("dstRefineSet");
  Collection dstTypesOff = (Collection) request.getAttribute("dstTypesOff");
  
  // JCMS-6449 :  Facet search : cannot selected document type if FileDocument selected
  Set<Class<? extends Publication>> unfilteredClassSet = new HashSet<Class<? extends Publication>>();
  if (dstClassSet != null) {
    unfilteredClassSet.addAll(dstClassSet);
  }
  if (qh.getTypes() != null) {
    // Otherwise iterates types and build classSet
    for (String type : qh.getTypes()) {
      try {
        unfilteredClassSet.add(channel.getClass(type));
      } catch (ClassNotFoundException ex) {
        logger.debug("Could not find class " + type);
      }
    }
  }
  
  boolean dstShowReplaceFileDoc = Util.toBoolean((String)request.getAttribute("dstShowReplaceFileDoc"), true); 
  boolean dstShowEmptyType      = Util.toBoolean((String)request.getAttribute("dstShowEmptyType"),      true);
  boolean dstShowAbstractType   = Util.toBoolean((String)request.getAttribute("dstShowAbstractType"),   true);
 
  if (boxStatus != 0) {
    for(Class<? extends Publication> itClass: dstClassSet) {
      if (itClass != Content.class && itClass != UserContent.class) {
        boxStatus = 1;
        break;
      }
    }
  }
  
  List typeList = new ArrayList(channel.getPublicationTypeList(userLang));
  
  String[] typesFacetOff = channel.getStringArrayProperty("query.default.types-facet-off", new String[0]);
  for (String typeOff : typesFacetOff) { 
    try {
      typeList.remove(channel.getClass(typeOff));
    } catch (ClassNotFoundException ex) {
      logger.debug("Invalid class specified in query.default.types-facet-off : " + typeOff);
    }
  }
  
  
  String sidebarFilterId="filterTypes";
  boolean collapsed =  boxStatus == 2;
  
  boolean isAllContentType = Util.isEmpty(qh.getTypes()) || (Arrays.asList(qh.getTypes()).contains("com.jalios.jcms.Content") || Arrays.asList(qh.getTypes()).contains("com.jalios.jcms.UserContent"));
%>
<jalios:appSidebarSection css='<%= boxStatus == 0 ? "hidden" : "" %>' icon="search-type" title='<%= glp("ui.work.search.tab.type") %>' name="types" collapsable="true" collapsed='<%= collapsed %>'>
  <ul class="app-sidebar-menu app-sidebar-menu-formitems">
    <li class='js-deselect-types <%= isAllContentType ? "active":"" %>'>
      <% if (isAllContentType) { %>
        <jalios:icon src="app-list-check" css="app-list-right-icon"/>
      <% } %>
      <label >
        <jalios:icon src="query-all-types"  />
        <%= glp("ui.work.pub.lbl.all-type") %>
      </label>
    </li>    
    <jalios:foreach name="itClass" counter="typeCounter" type="Class" collection="<%= typeList %>">
      <%
        if (Content.class.isAssignableFrom(itClass) || UserContent.class.isAssignableFrom(itClass)) {
  	      boolean checkAbstractType = dstShowAbstractType || !((itClass.getModifiers() & java.lang.reflect.Modifier.ABSTRACT) > 0);
          boolean checkTypeOff = dstTypesOff == null || !dstTypesOff.contains(itClass);
          Plugin plugin = channel.getTypeEntry(itClass).getPlugin();
          boolean checkPlugin = plugin == null || plugin.isEnabled(); 
            
          if (checkAbstractType && checkTypeOff && checkPlugin) {
            boolean checked = unfilteredClassSet.contains(itClass);
            
            int typeCount = 1;
            String icon = "images/jalios/icons/publication.gif";
            // DBData type
  	        if (DBData.class.isAssignableFrom(itClass)) {
  	          typeCount = HibernateUtil.queryCount(itClass);
  	          icon = "images/jalios/icons/publicationdb.gif";
  	        }
  	        // Storable type
  	        else {
  	          Set set = channel.getDataSet(itClass);
  	          if (dstRefineSet != null) { set = Util.interSet(dstRefineSet, set);  }
  	          typeCount = set != null ? set.size() : 0;
  	          if (refine){
  	            set = Util.interSet(queryResultSet, set);
  	            typeCount = set.size();
  	          }
  	        }
  	        if (dstShowEmptyType || typeCount > 0) {
  	          String inputId = FACET_PREFIX + "types" + itClass.getName();
              String typeLabel = channel.getTypeLabel(itClass, workspace, userLang);
              if (itClass == FileDocument.class) {
                if (!typeList.contains(DBFileDocument.class)) {
                  typeLabel = glp("ui.fo.query.documents");
                }
              } 	    %>
      <li class='<%= checked ? "active":"" %> <%= typeCount == 0 ? "empty" : "" %>'>
        <% if (checked) { %>
        <jalios:icon src="app-list-check" css="app-list-right-icon"/>
        <% } %>
        <label for="<%= inputId %>">
          <input id="<%= inputId %>" type="checkbox" name="types" value="<%= itClass.getName() %>" <%= checked ? "checked=\"checked\"" : ""%> data-jalios-action="ajax-refresh" />
          <jalios:dataicon class="<%= itClass %>"  />
          <%= typeLabel %>
        </label>
      </li>
      <% } %>
    <%   } %>
    <% } %>
    </jalios:foreach>
  </ul>
</jalios:appSidebarSection>