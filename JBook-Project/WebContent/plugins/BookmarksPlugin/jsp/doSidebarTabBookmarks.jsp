<%@ include file='/jcore/doInitPage.jspf' %><%

jcmsContext.addCSSHeader("css/jalios/core/components/loading/jalios-loading-circle.css");
jcmsContext.addCSSHeader("plugins/BookmarksPlugin/css/bookmarks-sidebar.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-loading-circle.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-field-autocomplete.js");
jcmsContext.addJavaScript("plugins/BookmarksPlugin/js/bookmark-sidebar-tab.js");

Map<String, Object> textFieldSettingsDataAttributes = new HashMap<String, Object>();
textFieldSettingsDataAttributes.put("jalios-field-autocomplete", "plugins/BookmarksPlugin/jsp/doSidebarTabBookmarks_autocomplete.jsp");
textFieldSettingsDataAttributes.put("jalios-target",".sidebar-tab-content-bookmarks .bookmarks-autocomplete-results");

Map<String, Object> htmlAttributesMap = new HashMap<String, Object>();
htmlAttributesMap.put("autocomplete", "off");
htmlAttributesMap.put("title", glp("jcmsplugin.bookmarks.topbar.search"));
%>
<jalios:javascript>
window.top.jQuery(".site-sidebar").on("show.jalios.sidebar", function() {
  window.top.jQuery(".ajax-refresh-div.sidebar-bookmarks").refresh();
});
</jalios:javascript>
<div class="ajax-refresh-div sidebar-bookmarks" data-jalios-ajax-refresh-url="plugins/BookmarksPlugin/jsp/doSidebarTabBookmarks.jsp">
  <div class="sidebar-tab-content-bookmarks">
    <h2 class="sidebar-tab-title"><%= glp("jcmsplugin.bookmarks.topbar.title") %></h2>
    <jalios:field css="sidebar-tab-search" name="bookmarkSearchText" resource="field-vertical" label=''>
      <jalios:control settings='<%= new TextFieldSettings().aria("describedby", "bookmarkAutocompleteHelper").htmlAttributes(htmlAttributesMap).placeholder("jcmsplugin.bookmarks.topbar.search").dataAttributes(textFieldSettingsDataAttributes) %>' />
    </jalios:field>
    
  	<p class="sr-only" id="bookmarkAutocompleteHelper"><%= glp("jcmsplugin.bookmarks.topbar.search.description") %></p>
  	
    <jalios:include jsp="plugins/BookmarksPlugin/jsp/doSidebarTabBookmarks_autocomplete.jsp" />
  
    <div class="list-group">
      <a class="btn btn-default manage-bookmarks-btn btn-block" href="plugins/BookmarksPlugin/jsp/manageBookmarksFullDisplay.jsp"><%= glp("jcmsplugin.bookmarks.lbl.manage-bookmark") %></a>
    </div>
  </div>
  
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>