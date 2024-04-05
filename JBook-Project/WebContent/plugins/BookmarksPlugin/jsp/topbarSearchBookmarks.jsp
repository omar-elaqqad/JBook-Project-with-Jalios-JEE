<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkItem"%>
<%@page import="com.jalios.jcms.uicomponent.autocomplete.TopbarSearchAutocompleteHandler"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
TopbarSearchAutocompleteHandler formHander = (TopbarSearchAutocompleteHandler) request.getAttribute("jcms.topbar.search.formHandler");

String query = formHander.getAutocomplete();
if(Util.isEmpty(query)){
  return;
}
if(query.length() < channel.getIntegerProperty("js.autocomplete-min-chars", 2)){
  return;
}

List<BookmarkItem> bookmarkItemList = BookmarkManager.getInstance().getBookmarkListFromQuery(formHander.getLoggedMember(), query);
if(Util.isEmpty(bookmarkItemList)){
 return; 
}
request.setAttribute("jcms.topbar.search.publication.is-empty", false);
BookmarkManager bookMarkMgr = BookmarkManager.getInstance();
%>
<ul class="list-unstyled" aria-labelledby="topbar-search-results-title-publication"><%
for(BookmarkItem bookmarkItem : bookmarkItemList){
  if(bookmarkItem.isTreeNode()){
    continue;
  }
  Bookmark bookmark = (Bookmark) bookmarkItem;
  Publication bookmarkPub = channel.getPublication(bookmark.getDataId());
  boolean isExternalLink = bookMarkMgr.isExternalLinks(bookmark.getLink());
  boolean isInNewWindows = bookMarkMgr.getExternalLinksInNewWindow(null,isExternalLink);
  String title = bookMarkMgr.getLinkTitle(bookmark.getLabel(),userLang,isExternalLink);%>
  <li><a <% if(isInNewWindows){ %>target="_blank"<% } %> <% if(isExternalLink){ %>rel="noopener noreferrer"<% } %> class="typeahead-link js-ripple topbar-search-result-item topbar-search-result-publication" href='<%= encodeForHTMLAttribute(bookmark.getLink(),true) %>' title="<%= title%>">
  
    <jalios:icon src="jcmsplugin-bookmarks-star" alt="jcmsplugin.bookmarks.lbl.bookmarks" />
    <jalios:dataicon css="jalios-icon-sm" alt="<%= bookmark.getDataName(userLang) %>" data="<%= bookmarkPub %>"/>
    <% 
  
    if (bookmark.isData()) { %>
      <%= bookmark.getData().getDataName(userLang) %>
    <%}else{%>
      <%= bookmark.getName() %>
    <%}%>

  </a></li>
<% } %>
</ul>