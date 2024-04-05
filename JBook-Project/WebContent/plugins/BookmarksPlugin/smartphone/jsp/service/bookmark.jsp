<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@ page import="com.jalios.jcmsplugin.bookmarks.*" %><% 
  SmartPhoneService service = new DefaultSmartPhoneService("jcmsplugin.smartphone.service.bookmark");
  if (!service.isEnabled(jcmsContext)) {
    sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
    return;
  }

  request.setAttribute("jcms.plugin.smartphone.topbar.title",glp("jcmsplugin.smartphone.service.bookmark")); 
  BookmarkManager bookmarkMgr = BookmarkManager.getInstance();
  BookmarkFolder folder = getDataParameter("bookmarkFolderId", BookmarkFolder.class);
  List<BookmarkItem> bookmarkList = bookmarkMgr.getBookmarkItemList(loggedMember, folder != null ? folder.getId() : "");
%>
<div id="service-bookmark" data-role="page" class="no-focus service-bookmark-page" data-dom-cache="true">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/common/doServiceTopbarMenu.jspf' %>
  <% boolean canReturnToParent = (folder != null); %>
  <div class="colored-banner">
    <smartphone:breadcrumb icon="jcmsplugin-smartphone-bookmarks" service="<%= service %>" />
  </div>
  
  <form class="ui-filterable">
    <div class="colored-banner input-in-header smartphone-bookmark-filter-input-wrapper">
      <input name="q" data-type="search" placeholder="<%= glp("jcmsplugin.bookmarks.topbar.search") %>" title="<%= glp("jcmsplugin.bookmarks.topbar.search") %>" class="bookmark-search-filter-input no-focus">
    </div>
    <% if (Util.notEmpty(folder)) { %>
      <input name="bookmarkFolderId" type="hidden" value="<%= folder.getId() %>" />
    <% } %>
  </form>
  

  <div class="service-bookmark-content" data-role="content">
    <ul class="ajax-autocomplete" data-jalios-autocomplete-minchar="0" data-jalios-autocomplete="plugins/BookmarksPlugin/smartphone/jsp/service/bookmark-result.jsp" data-role="listview" data-inset="false" data-filter="true" data-filter-placeholder="<%= glp("jcmsplugin.smartphone.action.filter") %>" data-input=".bookmark-search-filter-input" >
      <% 
        String href = ""; 
        boolean blankTarget = false;
        String title = "";
      %>
       <% if (canReturnToParent) { %>
		     <%-- Back --%>
		     <%
		       String backLinkParam = (folder.getTreeParent() != null) ? "?bookmarkFolderId=" + folder.getTreeParent().getId() : "";
		       String backLink = "plugins/BookmarksPlugin/smartphone/jsp/service/bookmark.jsp"+backLinkParam; 
		      %>
		      <jalios:listItem icon="jcmsplugin-smartphone-folder-back" template="jmobile" text="<%= folder.getName() %>" link="<%= backLink %>"/> 
		    <% } %>
      <% if (Util.isEmpty(bookmarkList)) { %>
        <li>
          <div class="alert alert-info">
            <%= glp("jcmsplugin.bookmarks.smartphone.lbl.bookmark.no-result") %>
          </div>
        </li>
      <% } else { %>        
      <jalios:foreach name="itBookmarkItem" type="BookmarkItem" collection="<%= bookmarkList %>">
        <%@ include file="/plugins/BookmarksPlugin/smartphone/jsp/service/doBookmarkItem.jspf" %>
      </jalios:foreach>
      <% } %>
    </ul>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>