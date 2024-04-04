<%@ include file="/jcore/doInitPage.jspf" %><%
AbstractCategorySettings categorySettings = (AbstractCategorySettings) request.getAttribute("categoryKeyword.categorySettings");

CategorySettings settings = new CategorySettings();
settings.root((String[]) categorySettings.getOption("root"));
settings.filter((CategoryFilter) categorySettings.getOption(AbstractCategorySettings.CATEGORY_FILTER));
if (categorySettings.getOption(ChooserConstants.WORKSPACE) != null) {
  settings.workspace((String) categorySettings.getOption(ChooserConstants.WORKSPACE));
}

List<String> categoryIds = Arrays.asList((String[]) request.getAttribute("categoryTreeAlternativeValues"));
Set<Category> categorySet = JcmsUtil.idCollectionToDataSet(categoryIds, Category.class);

List<String> rootIds = Arrays.asList((String[]) categorySettings.getOption("root"));
Set<Category> rootSet = JcmsUtil.idCollectionToDataSet(rootIds, Category.class);

Set<Category> filteredCategorySet = new HashSet();
for (Category itCategory : categorySet) {
  for (Category itRoot : rootSet) {
    if (itCategory.hasAncestor(itRoot) || itCategory == itRoot) {
      filteredCategorySet.add(itCategory);
    }
  }
}
settings.value(filteredCategorySet);

request.removeAttribute("categoryTreeAlternativeRemoved");

// Clean up values, by removing the one which doesn't have the parent as ancestor
boolean isMultiple = Util.toBoolean(categorySettings.getOption(SelectorSettings.MULTIPLE), false);
%>
<jalios:field resource="field-vertical" 
    keyword="<%= isMultiple %>" 
    value='<%= filteredCategorySet %>' 
    name='<%= Util.toString(request.getAttribute(FieldTag.FIELD_NAME), "") %>'
    disabled='<%= Util.toBoolean(request.getAttribute(FieldTag.FIELD_DISABLED), false) %>'
    required='<%= Util.toBoolean(request.getAttribute(FieldTag.FIELD_REQUIRED), false) %>'>
  <jalios:control settings="<%= settings %>" />
</jalios:field>