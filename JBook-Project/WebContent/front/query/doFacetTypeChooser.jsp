<%@page import="com.jalios.jcms.ui.IconManager"%>
<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.types"),0);
  
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  QueryResultSet queryResultSet = (QueryResultSet) request.getAttribute("query.queryResultSet");
  boolean refine = false;
  
  Set<Class<? extends Publication>> dstClassSet        = qh.getClassSet(); 
  Set dstRefineSet       = (Set) request.getAttribute("dstRefineSet");
  Collection dstTypesOff = (Collection) request.getAttribute("dstTypesOff");
  
  // JCMS-6449 :  Facet search : cannot selected document type if FileDocument selected
  Set<Class<? extends Publication>> selectedTypeSet = new HashSet<Class<? extends Publication>>();
  if (dstClassSet != null) {
    selectedTypeSet.addAll(dstClassSet);
  }
  if (qh.getTypes() != null) {
    // Otherwise iterates types and build classSet
    for (String type : qh.getTypes()) {
      try {
        selectedTypeSet.add(channel.getClass(type));
      } catch (ClassNotFoundException ex) {
        logger.debug("Could not find class " + type);
      }
    }
  }
  
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
  
  List<Class<? extends Publication>> typeList = new ArrayList(channel.getPublicationTypeList(userLang));
  
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


<%
List filteredTypeList = new ArrayList<>();
for(Class itClass: typeList) {
  if (Content.class.isAssignableFrom(itClass) || UserContent.class.isAssignableFrom(itClass)) {
    boolean checkAbstractType = dstShowAbstractType || !((itClass.getModifiers() & java.lang.reflect.Modifier.ABSTRACT) > 0);
    boolean checkTypeOff = dstTypesOff == null || !dstTypesOff.contains(itClass);
    Plugin plugin = channel.getTypeEntry(itClass).getPlugin();
    boolean checkPlugin = plugin == null || plugin.isEnabled(); 
      
    if (checkAbstractType && checkTypeOff && checkPlugin) {
      boolean checked = selectedTypeSet.contains(itClass);
      
      int typeCount = 1;
      // DBData type
      if (DBData.class.isAssignableFrom(itClass)) {
        typeCount = HibernateUtil.queryCount(itClass);
      }
      // Storable type
      else {
        Set set = channel.getDataSet(itClass);
        if (dstRefineSet != null) { 
          set = Util.interSet(dstRefineSet, set);  
        }
        typeCount = set != null ? set.size() : 0;
        if (refine){
          set = Util.interSet(queryResultSet, set);
          typeCount = set.size();
        }
      }
      if (dstShowEmptyType || typeCount > 0) {  
        filteredTypeList.add(itClass);
      }
    }
  }
}
Set<String> selectedTypeNameSet = selectedTypeSet.stream()
.map(c -> c.getSimpleName())
.collect(java.util.stream.Collectors.toSet());   
%>

<jalios:field name="types" value="<%= selectedTypeNameSet %>">
  <jalios:control settings='<%= new TypeSettings().types(filteredTypeList).multiple().aria("label",glp("ui.work.search.tab.type")).dataAttribute("jalios-action", "ajax-refresh") %>' />
</jalios:field>

</jalios:appSidebarSection>