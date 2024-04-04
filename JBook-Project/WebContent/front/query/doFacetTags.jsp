<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  
  int boxStatus = Util.toInt(request.getAttribute("query.facets.tags"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");  
  Set<Category> usedCidSet = JcmsUtil.idCollectionToDataSet(qh.getAllCidSet(), Category.class);
 
  Category rootCat = channel.getTagRoot(workspace);  
  if (rootCat == null || rootCat.isLeaf()){
    return;
  }
  
  String   icon    = Util.getString(rootCat.getIcon(), "tag");
  String   suffix  = "search_"+rootCat.getId();
  
  // Open box with matching decendant
  if (Util.notEmpty(usedCidSet)) {
    for (Iterator<Category> it = usedCidSet.iterator(); it.hasNext();) {
      Category itCat = it.next();
      if (!itCat.hasAncestor(rootCat)) {
        // The category is not a child of the selected root cat -> remove it from the collection
        it.remove();
        continue;
      }
      // This category has been selected in facet tags -> Open the panel
      boxStatus = 1;
    }
  }
  String sidebarFilterId="filterTags";
  boolean collapsed =  boxStatus == 2;
%>
<jalios:appSidebarSection icon="search-tag" title='<%= rootCat.getName(userLang) %>' name="tags" collapsable="true" collapsed='<%= collapsed %>'>
  <jalios:field name="cids" mv="1" value='<%= usedCidSet %>' keyword="false"  resource="field-app" css="nodnd">
    <jalios:control settings='<%= 
    new CategorySettings()
    .root(rootCat)      
    .filter(CategoryFilter.READ)
    .disableLiveCreation()
    .placeholder("ui.fo.query.tag-placeholder")
    .addOption(BasicSettings.HIDE_CLEAR_BUTTON, Util.isEmpty(qh.getCids()))
    .dataAttribute("jalios-event", "change")
    .dataAttribute("jalios-action", "ajax-refresh")
    %>'  />
  </jalios:field>
</jalios:appSidebarSection>