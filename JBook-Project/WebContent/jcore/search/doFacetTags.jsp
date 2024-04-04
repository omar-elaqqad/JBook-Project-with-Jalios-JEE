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
%>
<jalios:accordion-panel title="<%= rootCat.getName(userLang) %>" css="panel-default facet-tags" picture="<%= icon %>" active="<%= boxStatus != 2 %>">
  <jalios:field name='cids' value='<%= usedCidSet %>' keyword='true'>
    <jalios:control settings="<%= new CategorySettings().root(rootCat).filter(CategoryFilter.READ) %>"  />
  </jalios:field>
</jalios:accordion-panel>