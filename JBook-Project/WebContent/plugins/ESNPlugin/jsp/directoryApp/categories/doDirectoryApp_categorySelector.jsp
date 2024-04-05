<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><%@ include file='/plugins/ESNPlugin/jsp/directoryApp/doInitDirectoryApp_expertiseHandler.jspf'%><%

Category itCat = (Category) request.getAttribute("directory-app-esn-expertise");
if (itCat == null) {
  return;
}

Set<Category> pinnedCatSet = formHandler.getAvailableCompetenceCategories();
boolean isPinned = pinnedCatSet != null && pinnedCatSet.contains(itCat);

String toggleFiltersFilterProp;
if (isPinned) {
  toggleFiltersFilterProp = "jcmsplugin.esn.directory.app.competence.expertise.filters.remove";
} else {
  toggleFiltersFilterProp = "jcmsplugin.esn.directory.app.competence.expertise.filters.add";
}
// Unescape to raw data for opRename as it will be properly encoded by encodeForHTMLAttribute
String toggleFiltersTitle = JcmsUtil.glpNoDefault(userLang, toggleFiltersFilterProp, JcmsUtil.unescapeHtml(itCat.getName(userLang)));

String actionIconSrc = "jcmsplugin-esn-directory-competence-pin";
if (isPinned) {
  actionIconSrc = "jcmsplugin-esn-directory-competence-unpin";
}
%>
<span class="js-activate-card" title="<%= encodeForHTMLAttribute(toggleFiltersTitle) %>" data-toggle="tooltip" data-placement="top"
      role="button" tabindex="0" aria-label="<%= encodeForHTMLAttribute(toggleFiltersTitle) %>">
  <span class="checkbox-text">
    <span class="checkbox-icon">
      <jalios:icon src="<%= actionIconSrc %>" alt="" />
    </span>
  </span>
</span>