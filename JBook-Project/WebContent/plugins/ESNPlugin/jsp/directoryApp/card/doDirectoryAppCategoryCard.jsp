<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%

Category itCat = (Category) data;
String color = itCat.getColor();

String colorHtmlAttr = "";
if (Util.notEmpty(color)) {
  colorHtmlAttr += " style=\"color:" + color + "\"";
}

boolean isNode = itCat.isNode(loggedMember);
if (isNode) {
  css += " card-folder";
}

boolean isActive = css != null && css.contains("active");
boolean isPinned = css != null && css.contains("is-pinned");

String catName = itCat.getName(userLang);

// Tooltips
String toggleFilterProp = "jcmsplugin.esn.directory.app.competence.expertise";
if (isPinned) {
  if (isNode) {
    toggleFilterProp += ".node.is-in-filters";
  } else {
    toggleFilterProp += ".is-in-filters";
  }
} else if (isActive) {
  toggleFilterProp += ".filter.remove";
} else {
  if (isNode) {
    toggleFilterProp += ".filter.node.add";
  } else {
    toggleFilterProp += ".filter.add";
  }
}
String toggleFilterLabel = JcmsUtil.glpNoDefault(userLang, toggleFilterProp, JcmsUtil.unescapeHtml(catName));
String cardTitle = JcmsUtil.glpNoDefault(userLang, toggleFilterProp, itCat.getName(userLang));
boolean hasCardTitle = Util.notEmpty(cardTitle);
if (hasCardTitle) {
  dataAttribute.addData("esn-directory-filter-expertise-title", toggleFilterLabel);
  // JS will init data-toggle="tooltip" (after it will have a non empty title attr) 
}

if (itCat.getParent() != null) {
  dataAttribute.addData("esn-directory-parent-data-id", JcmsUtil.getId(itCat.getParent()));
}
css += " directory-card-item";
css += " has-check-card";

request.setAttribute("directory-app-esn-expertise", itCat);
String compHtmlAttributes = "tabindex='0' role='button'";
compHtmlAttributes += MessageFormat.format(" aria-label=\"{0}\"", encodeForHTMLAttribute(toggleFilterLabel));
%>
<jalios:card css='<%= css %>' link='<%= link %>' dataAttribute="<%= dataAttribute %>" htmlAttributes='<%= compHtmlAttributes %>'>
  <jalios:include jsp="/plugins/ESNPlugin/jsp/directoryApp/categories/doDirectoryApp_categorySelector.jsp" />
  
  <jalios:cardBlock>
    <div class="card-title item-title">
      <jalios:include jsp="/plugins/ESNPlugin/jsp/directoryApp/categories/doDirectoryApp_categoryIcon.jsp" />
      
      <span class="js-title"><%= itCat.getDataName(userLang) %></span>
    </div>
  </jalios:cardBlock>
</jalios:card>
<%
request.removeAttribute("directory-app-esn-expertise");
%>