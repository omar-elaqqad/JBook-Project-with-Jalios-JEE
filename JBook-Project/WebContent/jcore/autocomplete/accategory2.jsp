<%@ include file="/jcore/doInitPage.jspf" %><%

  String autocomplete = getUntrustedStringParameter("autocomplete","").trim(); // ENCODE !!
  autocomplete = JcmsUtil.escapeHtml(autocomplete);
  
  String filterParam = getStringEnumParameter("filter", CategoryFilter.USE.toString(), EnumUtils.toStringArray(CategoryFilter.class));
  CategoryFilter filter = Util.notEmpty(filterParam) ? CategoryFilter.valueOf(filterParam) : null;
  boolean selectable = getBooleanParameter("selectable", true);
  Set<Category> parentSet = getDataSetParameterValues("rootCids", Category.class);
  boolean displayRoots = getBooleanParameter("displayRoots", true);
  Set<Category> removeSet = getDataSetParameterValues("rm", Category.class);
  
  List<Category> ancestors = Util.notEmpty(parentSet) ? new ArrayList<Category>(parentSet): new ArrayList<Category>(Arrays.asList(channel.getRootCategory()));
  Category firstAncestor = ancestors.get(0);
  
  boolean add = getBooleanParameter("acadd", true);
  boolean opAdd = getBooleanParameter("opAdd", false);
  int skip = getIntParameter("skip", 0);
	
  Collection<Category> resultCollection = new TreeSet(Category.getOrderComparator(userLang));
  if (Util.notEmpty(parentSet)) {
    for (Category cat : parentSet) {
      resultCollection.addAll(cat.getDescendantSet());
      if(displayRoots) {
        resultCollection.add(cat);
      }
    }
  }
  
  Set tmpSet = new HashSet();
  if (Util.notEmpty(removeSet)) {
    for (Iterator it = removeSet.iterator(); it.hasNext(); ) {
      Category itCategory = (Category) it.next();
      tmpSet.add(itCategory);
      tmpSet.addAll(itCategory.getDescendantSet());
    }
  }
  removeSet = tmpSet;
  
  // Handle live creation of categories 
  boolean canAdd = add && isLogged && loggedMember.canManageCategory(firstAncestor);
  
  Category itCat = new Category();
  itCat.setName(autocomplete);
  itCat.setParent(firstAncestor);
  itCat.setAuthor(loggedMember);

  ControllerStatus cs = itCat.checkCreate(loggedMember);
  boolean checkCreate = cs.isOK();
  
  if (canAdd && opAdd) {
    if (!checkCreate) {
      itCat = null;
      logger.warn("ERROR: "+cs.getMessage(userLang));
    } else {
      itCat.performCreate(loggedMember);
      resultCollection.add(itCat);
    }
  }
  
  DataSelector selector = new Category.NameSelector(autocomplete, userLang, true /* JCMS-3337 */);
  
  request.setAttribute("ACSelector", selector);
  request.setAttribute("ACResultCollection", resultCollection);
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.category", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        5));
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
%>
<jalios:include target="AC_CATEGORY" targetContext="empty" />
<%
  proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
  selector = (DataSelector) request.getAttribute("ACSelector");
  resultCollection = (Collection) request.getAttribute("ACResultCollection");
  String prefix = glp("ui.com.lbl.under-path");
  int more = skip + proposedResults;
  
  // Build acurl
  String acurl = "jcore/autocomplete/accategory.jsp?autocomplete=" + encodeForURL(JcmsUtil.unescapeHtml(autocomplete));
  acurl += "&filter=" + filterParam + "&selectable=" + selectable + "&acadd=" + add;
  if (Util.notEmpty(parentSet)){ acurl += "&rootCids=" + JcmsUtil.dataListToString(parentSet, "&rootCids="); }
  acurl += "&displayRoots=" + displayRoots;
  if (Util.notEmpty(removeSet)){ acurl += "&rm=" + JcmsUtil.dataListToString(removeSet, "&rm="); }
  acurl += "&skip=";
  
%><ul class="dropdown-menu"><%
  if (skip > 0) {
    %><li class="info results dropdown-header"><%= glp("ui.com.lbl.count-result", skip, (skip + proposedResults)) %></li><%
    %><li class="ajax-refresh previous"><a href="<%= acurl + (skip - proposedResults) %>" onclick="return false;"><%= glp("ui.com.lbl.prev-result") %></a></li><%
  }
  
  Collection<Category> filteredResultCollection = new TreeSet(Category.getNameComparator(userLang));
  
  // Filter the result -> skip categories according to the following conditions: 
  // - not matched by the DataSelector, 
  // - not selectable,
  // - filtered by the CategoryFilter,
  // - explicitly filtered by the removeSet
  for(Iterator<Category> it = resultCollection.iterator(); it.hasNext();) {
    Category itCategory = it.next();    
    
    if (!selector.isSelected(itCategory)) { continue; }
    if (selectable && !itCategory.isSelectable()) { continue; }
    if (CategoryFilter.isFiltered(itCategory, loggedMember, filter)) { continue; }
    // if (!filter && !itCategory.canBeReadBy(loggedMember)) { continue; }
    // if ( filter && (loggedMember == null || !loggedMember.canUseCategory(itCategory))) { continue; }
    if (removeSet.contains(itCategory)) { continue; }
    if (skip > 0) { skip--; continue; }

    filteredResultCollection.add(itCategory);
  }

  // Display the result
  
  boolean first = true;
  Iterator<Category> it = null;
  for(it = filteredResultCollection.iterator(); it.hasNext() && proposedResults > 0;) {
    Category itCategory = it.next();
    
    if (ancestors.contains(itCategory) && itCategory.getName(userLang).equalsIgnoreCase(autocomplete)) { canAdd = false; }
    Category ancestor = itCategory;
    while(ancestor != null && !ancestors.contains(ancestor)) {
      ancestor = ancestor.getParent();
    }
    String ancestorStr = itCategory.getAncestorString(ancestor, " > ", false, userLang);
    String path = Util.isEmpty(ancestorStr) ?  "" : "<br/><span class='meta-text info'>" + prefix + " " + encodeForHTML(ancestorStr) + "</span>";
    String clazz = (first ? "active " : "") + ((itCategory == itCat) ?  "select" : "");
    %><li<%= Util.notEmpty(clazz) ? " class='" + clazz + "'" : "" %> data-value="<%= itCategory.getId() %>" data-placeholder="<%= encodeForHTMLAttribute(itCategory.getName(userLang), true) %>" title="<%= encodeForHTMLAttribute(itCategory.getName(userLang) + (Util.notEmpty(ancestorStr) ? "\n" + prefix + " " + ancestorStr : "")) %>"><a href="#"><%= itCategory.getName(userLang) %><%= path %></a></li><%
    proposedResults--;
    first = false;
  } // End for
  
  if (filteredResultCollection.isEmpty() && !canAdd) { // No result and cannot add new category
    %><li class="nomatch"><a href="#"><%= glp("ui.com.lbl.no-result") %></a></li><%
  } else if (proposedResults == 0 && it.hasNext()) { // Display 'next' link after the last result of the current page
    %><li class="ajax-refresh next"><a href="<%= acurl + more %>" onclick="return false;"><%= glp("ui.com.lbl.next-result") %></a></li><%
  }
  if (canAdd && checkCreate) { // Link to create new categories
    %><li class="ajax-refresh add"><a href="<%= acurl %>&opAdd=true" onclick="return false;"><%= glp("ui.work.cat.lbl.add-asub-cat", encodeForHTML(JcmsUtil.unescapeHtml(autocomplete))) %></a></li><%
  }
%></ul>