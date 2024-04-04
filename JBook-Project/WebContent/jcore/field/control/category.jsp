<%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings.SelectorType"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.CategorySettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
boolean categoryTree = getOption(CategorySettings.TREE, false);
boolean improveBigTree = Util.toBoolean(request.getAttribute("jcms.field.category-tree.handle-tree-performance"), true);
AbstractCategorySettings categorySettings = (AbstractCategorySettings) getIncludeObject(ControlTag.CONTROL_SETTINGS, null);
request.setAttribute("categoryKeyword.categorySettings", categorySettings);
if (improveBigTree && CategoryTreeSettings.useTree(categorySettings, fieldValuesArray)) { %>
  <% request.setAttribute("categoryTreeAlternativeValues", fieldValuesArray); %>
  <jalios:include jsp="jcore/field/control/doCategoryTreeAlternative.jsp" />
  <% request.removeAttribute("categoryTreeAlternativeValues"); %>
<% 
} else if(categoryTree) {
  %><%@ include file="/jcore/field/control/doCategoryTree.jspf" %><%
} else {
  SelectorType catSelectorType = getOption(SelectorSettings.SELECTOR_TYPE, SelectorType.CHOOSER);
  addOption(SelectorSettings.SELECTOR_TYPE, catSelectorType);
  /*
  if(SelectorType.CHOOSER.equals(catSelectorType)) {
    boolean liveCreation = getOption(CategorySettings.LIVE_CREATION, true);
    if(!liveCreation) {
      addOption(BasicSettings.CSS, "acadd_false " + getOption(BasicSettings.CSS,""));
    }
  }
  */
  // force to add a select item with an empty value
  addOption(SelectorSettings.SELECT_ITEM_EMPTY_VALUE, true);
  %><%@ include file="/jcore/field/control/doData.jspf" %><%
}
%><%
request.removeAttribute("categoryKeyword.categorySettings");
%>