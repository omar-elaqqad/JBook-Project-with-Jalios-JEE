<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-header-search.css");
PortletSearch box = (PortletSearch) portlet;
String searchDisplayId = box.getDisplayPortal() != null ? box.getDisplayPortal().getId() : currentCategory.getId();
String searchLink;
if ("mixed".equals(box.getTemplate(TypeTemplateEntry.USAGE_DISPLAY_BOX))) { // FIXME: [Template] A little bit ugly
  searchLink = JcmsUtil.getDisplayUrl(box, userLocale);
} else if (box.getAdvancedSearchPortlet() != null) {
  searchLink = JcmsUtil.getDisplayUrl(box.getAdvancedSearchPortlet(), userLocale);
} else {
  searchLink = ResourceHelper.getSearch() + "?id=" + searchDisplayId; 
}
String placeholder = encodeForHTMLAttribute(Util.getString(box.getTitleText(userLang), glp("ui.com.placeholder.search-ws")));
boolean isInstantSearch = box.getInstantSearch();
%><%@ include file="/types/PortletSearch/doQueryHandler.jspf" %>
<form action="<%= box.getQueryPortlet() != null ? JcmsUtil.getDisplayUrl() : ResourceHelper.getQuery() %>" 
    method="get" 
    name="search" 
    class="form-search noSingleSubmitButton cs-header-search">

  <div class="search-container" title='<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.header.search-button", workspace.getTitle(userLang))) %>'>
    <label class="sr-only" for="workspace-search-field"><%= glp("ui.com.placeholder.search-ws") %></label>
    <% if (isInstantSearch) { %>
    <input class="form-control typeahead cs-header-search-query" 
        type="text" 
        id="workspace-search-field" 
        name="text" 
        size="20" 
        data-jalios-ajax-refresh-url="/jcore/autocomplete/acsearch.jsp?portletId=<%= box.getId() %>" 
        placeholder="<%= placeholder %>" 
        value="<%= encodeForHTMLAttribute(getUntrustedStringParameter("text", "")) %>" />
    <% } else { %>
    <input class="form-control search cs-header-search-query" 
        type="text" 
        name="text" 
        id="workspace-search-field" 
        size="20" 
        placeholder="<%= placeholder %>" 
        value="<%= encodeForHTMLAttribute(getUntrustedStringParameter("text", "")) %>" />
    <% } %>
    <button class="btn btn-default btn-cs-header-search" value="true" name="opSearch" type="submit" title='<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.header.search-button", workspace.getTitle(userLang))) %>'><%
      %><jalios:icon src="topbar-search" alt='<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.header.search-button", workspace.getTitle(userLang))) %>' /><%
    %></button>
  </div>

  <%= formHandler.getHiddenParams() %><%
  %><%@ include file="/types/PortletSearch/doHiddenParams.jspf" %>
</form>