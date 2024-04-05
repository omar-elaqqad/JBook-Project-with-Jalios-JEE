<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkConstants"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><%

if (!isLogged) {
  return;
}

BookmarkManager bookmarkManager = BookmarkManager.getInstance();
Publication pub = jcmsContext.getPublication();
Bookmark bookmark = null;

if (pub != null) {
  bookmark = bookmarkManager.getBookmarkFromDataId(loggedMember, pub.getId());
}

jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-slide-menu-keybinding.js");

%>
<div class="topbar-app-menu topbar-item-wrapper keep-open dropdown dropdown-topbar ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/BookmarksPlugin/jsp/bookmarkMenu.jsp" data-jalios-dropdown-topbar-lazy-url="plugins/BookmarksPlugin/jsp/bookmarkMenu_items.jsp">
  <a id="topbar-application-menu-opener" title="<%= glp("jcmsplugin.bookmarks.lbl.bookmarks") %>" href="#" class="topbar-item" data-toggle="dropdown" onclick="return false;" aria-haspopup="true">
    <jalios:icon src="jcmsplugin-bookmarks-topbar" />
  </a>
  <div class="dropdown-menu topbar-default-menu dropdown-menu-right topbar-menu topbar-bookmarks-menu has-header" aria-labelledby="topbar-application-menu-opener" role="menu" aria-hidden="true" id='ctxApplicationMenu'>
    <div class="topbar-ctxmenu-header">
      <% if (channel.isDataWriteEnabled()) { %>
        <div class="topbar-ctxmenu-header-actions">
          <a class="topbar-ctxmenu-header-item" href="plugins/BookmarksPlugin/jsp/manageBookmarksFullDisplay.jsp" title="<%= glp("jcmsplugin.bookmarks.lbl.manage-bookmark") %>"><jalios:icon src="jcmsplugin-bookmarks-topbar-manage" /></a>
          <% if (bookmarkManager.canAddBookmark(loggedMember)) { %>
            <% if(bookmark != null) { %>
              <a class="topbar-ctxmenu-header-item" data-jalios-action="ajax-refresh" href="#" title="<%= glp("jcmsplugin.bookmarks.lbl.remove-bookmark") %>"><jalios:icon src="jcmsplugin-bookmarks-topbar-remove" /></a>
            <% } else { %>
              <% 
                String pubId = (pub == null)?"":pub.getId();
                String addUrl = "plugins/BookmarksPlugin/jsp/bookmarkModal.jsp?" + BookmarkConstants.PARAMETER_ONLY_DATA_ID_MODAL+"="+pubId;
              %>
              <a class="topbar-ctxmenu-header-item" data-jalios-action="modal" href="<%= addUrl %>" title="<%= glp("jcmsplugin.bookmarks.lbl.add-bookmark") %>"><jalios:icon src="jcmsplugin-bookmarks-topbar-add" /></a>
            <% } %>
          <% } %>
        </div>
      <% } %>
      <%= glp("jcmsplugin.bookmarks.lbl.bookmarks") %>
    </div>
    <div class="topbar-ctxmenu-body topbar-bookmarks-item-wrapper clearfix">
      <div class='ajax-loading-component ajax-loading topbar-ctxmenu-firstload'><div class='ajax-loading-display'><div class='loader'></div></div></div>
   </div>
  </div>    
</div>