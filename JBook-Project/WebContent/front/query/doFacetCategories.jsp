<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  
  int boxStatus = Util.toInt(request.getAttribute("query.facets.categories"),0);
  if (boxStatus == 0){ return; }
  
  if (Util.isEmpty(channel.getSearchRootSet())){
    return;
  }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  QueryResultSet queryResultSet = (QueryResultSet) request.getAttribute("query.queryResultSet");
  
  boolean refine = "and".equals(qh.getCatMode()); // channel.getBooleanProperty("query.facets.refine.cids", true);
  
  final Set<Category> rootSet = new TreeSet<Category>(Category.getNameComparator(userLang));
  final Set<Category> searchRootSet = channel.getSearchRootSet();
  if (searchRootSet != null) {
    rootSet.addAll(Category.getReadableCatSet(searchRootSet, loggedMember));
  }
  
  // Fill the set of retained categories
  Set<Category> retainedSet = new HashSet<Category>();
  if (refine && queryResultSet.getResultSize() > 0){
    Set<Publication> resultSet  = queryResultSet.getAsSortedSet();
    for (Publication itPub : resultSet){
      retainedSet.addAll(itPub.getCategorySet());
    }
    // Filter rootSet
    Set<Category> tmpSet = new HashSet<Category>();
    for (Iterator<Category> it = rootSet.iterator() ; it.hasNext() ; ){
      Category itRoot = it.next();
      for(Category itRetain : retainedSet){
        if (itRetain.hasAncestor(itRoot)){ 
          tmpSet.add(itRoot);
          break; 
        }
      }
    }
    rootSet.clear(); rootSet.addAll(tmpSet);
  }
  
  /* Add Collaborative Space Roots
  rootSet = new LinkedHashSet(rootSet);
  if (workspace != null && workspace.isCollaborativeSpace()){
    rootSet.add( ... );
  }*/
  
  final int boxStatusSetting = boxStatus;
%>
<jalios:foreach collection="<%= rootSet %>" name="rootCat" type="Category">
<%
  boxStatus = boxStatusSetting;
  String icon   = Util.getString(rootCat.getIcon(), "category-tree");
  String prefix = "search_"+rootCat.getId();
  
  if (!rootCat.isLeaf()){
    Set<Category> usedCatSet = JcmsUtil.idCollectionToDataSet(qh.getAllCidSet(), Category.class);
    // Open box with matching decendant
    if (Util.notEmpty(usedCatSet)) {
      for (Iterator<Category> it = usedCatSet.iterator(); it.hasNext();) {
        Category itCat = it.next();
        if (itCat != rootCat && !itCat.hasAncestor(rootCat)) {
          it.remove();
          continue;
        }
        boxStatus = 1;
      }
    }

    
    String sidebarFilterId="filterCats_" + rootCat.getId();
    boolean collapsed =  boxStatus == 2;
%>
  <jalios:appSidebarSection name='<%= "category-" + rootCat.getId() %>' css="app-sidebar-section-category" icon="search-category" title='<%= rootCat.getName(userLang) %>' collapsable="true" collapsed='<%= collapsed %>'>
    <jalios:field name="cids" mv="1" value='<%= usedCatSet %>' keyword="false" resource="field-app" css="nodnd no-add-field">
      <jalios:control settings='<%= 
      new CategorySettings()
      .root(rootCat)      
      .filter(CategoryFilter.READ)
      .disableLiveCreation()
      .addOption(BasicSettings.CLEAR_BUTTON, Util.notEmpty(qh.getCids()))
      .placeholder("ui.fo.query.categories-placeholder")
      .aria("labelledby", request.getAttribute("sidebarSectionTitleId"))
      .title(glp("widget.category.label", rootCat.getName(userLang)))
      .dataAttribute("jalios-event", "change")
      .dataAttribute("jalios-action", "ajax-refresh")
      %>'  />
    </jalios:field>
  </jalios:appSidebarSection>
<% } %>
</jalios:foreach>