<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<% 
BookmarkManager bookmarkManager = BookmarkManager.getInstance();
Publication pub = (Publication)request.getAttribute("jcms.plugin.smartphone.fulldisplay.pub"); 
if (bookmarkManager.canAddBookmark(loggedMember) && pub != null) {
	Bookmark bookmark = bookmarkManager.getBookmarkFromDataId(loggedMember, pub.getId());
	boolean isBookmarked = (bookmark == null)?false:true;
	%>
	<li>
		<a href="#" class='bookmarks-ctx-menu js-bookmarks-action <%= isBookmarked?"is-bookmarked":""%>'
		   data-jalios-pubId="<%= pub.getId() %>"
		   data-jalios-action-url="plugins/BookmarksPlugin/smartphone/jsp/bookmarkMenuActions.jsp"
		   data-jalios-action-bookmark-add-message='<%= glp("jcmsplugin.bookmarks.smartphone.menu.bookmark.added.lbl")%>'
		   data-jalios-action-bookmark-delete-message='<%= glp("jcmsplugin.bookmarks.smartphone.menu.bookmark.removed.lbl")%>'
		   >

		  <span class="publication-action-label bookmark-remove" >
		    <jalios:icon src="jcmsplugin-bookmarks-delete" />
		    <%= glp("jcmsplugin.bookmarks.lbl.remove-bookmark") %>
		  </span>

		  <span class="publication-action-label bookmark-add " >
		    <jalios:icon src="jcmsplugin-bookmarks-add" />
		    <%= glp("jcmsplugin.bookmarks.lbl.add-bookmark") %>
		  </span>
		</a>
	</li>
<% } %>
