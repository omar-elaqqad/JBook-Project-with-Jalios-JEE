<%@ include file='/jcore/doInitPage.jspf' %>
<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkFolder"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkConstants"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkItem"%>
<jsp:useBean id="bookmarkHandler" scope="page" class="com.jalios.jcmsplugin.bookmarks.BookmarkHandler">
<jsp:setProperty name="bookmarkHandler" property="request" value="<%= request %>" />
<jsp:setProperty name="bookmarkHandler" property="response" value="<%= response %>" />
<jsp:setProperty name="bookmarkHandler" property="*" />
<jsp:setProperty name="bookmarkHandler" property="noRedirect" value="<%= true%>" />
</jsp:useBean>
<%
BookmarkManager bookMarkMgr = BookmarkManager.getInstance();
String bookmarkSearchText = Util.isEmpty(bookmarkHandler.getBookmarkSearchText())?"":bookmarkHandler.getBookmarkSearchText();
List<BookmarkItem> bookmarkItemList = new ArrayList<BookmarkItem>();
String currentParentId = getDataIdParameter(BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID);

//Current folder
BookmarkFolder currentFolder = bookMarkMgr.getBookmarkFolder(currentParentId);
String currentFolderId = (currentFolder!=null)?currentFolder.getId():"";

//Parent folder
BookmarkFolder parentFolder = (currentFolder != null)?currentFolder.getParentFolder():null;
String parentFolderId = (parentFolder != null)?parentFolder.getId():"";

//Bookmark Search
if(Util.notEmpty(bookmarkHandler.getBookmarkSearchText())){
  bookmarkItemList = bookmarkHandler.getBookmarkListFromQuery(loggedMember, bookmarkHandler.getBookmarkSearchText(),"");
  currentFolderId = null;
}else{
  // Retrieve all the bookmarks  
  bookmarkItemList = bookmarkHandler.getBookmarkItemList(loggedMember, currentParentId,"");
}
//Breadcrumb
String breadcrumb = bookMarkMgr.displayBreadcrumb(currentFolder, true);
%>
<div class="bookmarks-autocomplete-results js-autocomplete-field-result">
  <% if(Util.notEmpty(breadcrumb)) { %>
    <nav class="bookmark-breadcrumb" role="navigation" aria-label="<%= glp("jcmsplugin.bookmarks.folder.breadcrumb.label", currentFolder.getName()) %>">
      <%= breadcrumb %>
    </nav>
  <% } %>
      
  <div class="list-group list-group-bordered">
    <jalios:foreach collection="<%= bookmarkItemList %>" type="BookmarkItem" name="bookmarkItem">
        <%-- BOOKMARK FOLDER ITEM --%>
        <% if(bookmarkItem instanceof BookmarkFolder){ %>
      <a role="button" tabindex="0" class="list-group-item" data-jalios-action="ajax-refresh" data-jalios-options='{"params": {"<%= BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>": "<%= bookmarkItem.getId() %>" }}'>
            <jalios:icon src="<%=bookmarkItem.getDataIcon()%>" title="jcmsplugin.bookmarks.folder.lbl" alt="jcmsplugin.bookmarks.folder.lbl" />
            <%=bookmarkItem.getName()%>
          </a>
        <% } %>
        
        <%-- BOOKMARK ITEM --%>
        <% if(bookmarkItem instanceof Bookmark){ 
             Bookmark bookmark = (Bookmark) bookmarkItem;              
             if(bookmark.isData()){
               String publicationId = bookmark.getData().getId();
             }
        %>
      <%
          if(bookmark.isFileDocument() || bookmark.isData()){%> 
          <%
          String altIconImage = bookmark.getData().getDataIconAlt(userLang);
          altIconImage = Util.isEmpty(altIconImage) ? bookmark.getData().getDataIconTitle(userLang) : altIconImage;
          %>
            <jalios:link css="list-group-item" data='<%=bookmark.getData()%>'><jalios:dataicon data="<%=bookmark%>"
              css="jalios-icon-sm" alt="<%= altIconImage %>"></jalios:dataicon> <%= bookmark.getData().getDataName(userLang) %> </jalios:link>
             <%
          } else if(bookmark.isQuery()){
          %><a class="list-group-item" href="<%=encodeForHTMLAttribute(bookmark.getQueryUrl(),true)%>" title="<%= encodeForHTMLAttribute(bookmark.getTitle(),true)%>"><jalios:dataicon data="<%=bookmark%>"
              css="jalios-icon-sm" alt="<%= bookmark.getTitle() %>"></jalios:dataicon> <%= bookmark.getTitle()%> 
            </a>
          <% }else{
            boolean isExternalLink = bookmarkHandler.isExternalLinks(bookmark.getAnyUrl());
            boolean isInNewWindows = bookmarkHandler.getExternalLinksInNewWindow(null,isExternalLink);
            String title = bookmarkHandler.getLinkTitle(bookmark,isExternalLink);
          %><a class="list-group-item" <% if(isInNewWindows){ %>target="_blank"<% } %> <% if(isExternalLink){ %>rel="noopener noreferrer"<% } %> href="<%=encodeForHTMLAttribute(bookmark.getAnyUrl(),true)%>" title="<%=title%>">
              <jalios:dataicon data="<%=bookmark%>" css="jalios-icon-sm" alt='<%= title %>'></jalios:dataicon> <%= Util.getString(bookmark.getTitle(), bookmark.getAnyUrl())%></a>
          <% } %>
        <% } %>
    </jalios:foreach>
  </div>
</div>