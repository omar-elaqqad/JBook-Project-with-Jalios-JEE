<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.bookmarks.*" %>
<%@ page import="com.jalios.jcmsplugin.smartphone.*" %>
<%
  BookmarkManager bookmarkMgr = BookmarkManager.getInstance();
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

  List<BookmarkItem> bookmarkList;
  String query = getUntrustedStringParameter("q","");
  if (Util.isEmpty(query)) {
    bookmarkList = bookmarkMgr.getBookmarkItemList(loggedMember, getDataIdParameter("bookmarkFolderId"));
  } else {
    bookmarkList = bookmarkMgr.getBookmarkListFromQuery(loggedMember, query);
  }
  
  String href = ""; 
  boolean blankTarget = false;
  String title = "";
%>
<% if(Util.isEmpty(bookmarkList)) { %>
  <li class="message-list-item"><jalios:message msg='<%= glp("jcmsplugin.smartphone.lbl.no-result") %>' title="" dismissable="false"/></li>
<% } %>
<jalios:foreach collection="<%= bookmarkList %>" name="itBookmarkItem" type="BookmarkItem">
  <%@ include file="/plugins/BookmarksPlugin/smartphone/jsp/service/doBookmarkItem.jspf" %>
</jalios:foreach>