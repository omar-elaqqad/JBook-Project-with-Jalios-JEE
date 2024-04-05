<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkItem"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkConstants"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkFolder"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@ include file="/jcore/doInitPage.jspf"%>

<%
if (!isLogged) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}
%>

<jsp:useBean id="bookmarkHandler" scope="page" class="com.jalios.jcmsplugin.bookmarks.BookmarkHandler">
  <jsp:setProperty name="bookmarkHandler" property="request" value="<%= request %>" />
  <jsp:setProperty name="bookmarkHandler" property="response" value="<%= response %>" />
  <jsp:setProperty name="bookmarkHandler" property="*" />
  <jsp:setProperty name="bookmarkHandler" property="noRedirect" value="<%= true%>" />
</jsp:useBean>

<%
PortletBookmarks portlet = (PortletBookmarks) request.getAttribute("BOOKMARK_PORTLET");
BookmarkManager bookMarkMgr = BookmarkManager.getInstance();
String currentParentId = getDataIdParameter(BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID);

// Current folder
BookmarkFolder currentFolder = bookMarkMgr.getBookmarkFolder(currentParentId);
if(currentFolder != null && !JcmsUtil.isSameId(currentFolder.getAuthor(), loggedMember)){
  sendForbidden(request, response);
}
String currentFolderId = (currentFolder!=null)?currentFolder.getId():"";

// Parent folder
BookmarkFolder parentFolder = (currentFolder != null)?currentFolder.getParentFolder():null;
String parentFolderId = (parentFolder != null)?parentFolder.getId():"";

String bookmarkSearchText = Util.isEmpty(bookmarkHandler.getBookmarkSearchText())?"":bookmarkHandler.getBookmarkSearchText();

// Validate OP

if(bookmarkHandler.validate()){
%>

<% } %>
<%
List<BookmarkItem> bookmarkItemList = new ArrayList<BookmarkItem>();

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

//Can edit or delete bookmark
boolean canEdit = channel.isDataWriteEnabled();

String usage = (String) request.getAttribute("BOOKMARK_USAGE");
boolean isPortlet = "box".equals(usage);

//Portlet Bookmark
Bookmark bookmarkPortlet = null;
Publication pub = jcmsContext.getPublication();
String currentPublicationId = "";

if (pub != null) {
 bookmarkPortlet = bookMarkMgr.getBookmarkFromDataId(loggedMember, pub.getId()); 
 currentPublicationId = pub.getId();
}
if(pub instanceof Portlet){
  currentPublicationId = "";
}
%>

<div class="bookmarks-full-display" >
  <div class="bookmark-list-view"
    data-jalios-bookmark-folder="<%=(Util.isEmpty(bookmarkSearchText))?currentFolderId:"search-bookmark"%>">

      <div class="navbar navbar-default">
        <div class="container-fluid ">
          <% if(!isPortlet){ %>
            <div class="navbar-form navbar-left">
              <%-- ADD BOOKMARK FOLDER --%>
              <a class="btn btn-default modal btn-addFolder"
                href="plugins/BookmarksPlugin/jsp/bookmarkFolderModal.jsp?<%=BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>=<%=currentFolderId%>">
                <%=glp("jcmsplugin.bookmarks.folder.btn.lbl.add")%>
              </a>
              <%-- ADD BOOKMARK --%>
              <a class="btn btn-default modal addBookmark"
                href="plugins/BookmarksPlugin/jsp/bookmarkModal.jsp?<%=BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>=<%=currentFolderId%>"
                onclick="return false;"> <%= encodeForHTML(glp("jcmsplugin.bookmarks.lbl.add")) %>
              </a>
            </div>
          <% } %>
          <ul class="nav navbar-nav">
  
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <jalios:icon src="actions" />
                <%= glp("jcmsplugin.bookmarks.lbl.action") %> <span class="jalios-icon caret caret"></span></a>
  
              <ul class="dropdown-menu" role="menu">
                <% if(!isPortlet){ %>
                  <%-- MOVE SELECTED BOOKMARK ITEMS --%>
                  <li class="disabled shiftBookmark"><a class="bookmark-item-action bookmark-action-disabled"
                    href="plugins/BookmarksPlugin/jsp/bookmarkItemsActionModal.jsp?<%=BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>=<%=currentFolderId%>&amp;<%=BookmarkConstants.PARAMETER_BOOKMARK_ITEM_ACTION_MODAL%>=<%=BookmarkConstants.BOOKMARK_ITEM_ACTIONS.MOVE%>&amp;<%=BookmarkConstants.PARAMETER_BOOKMARK_QUERY %>=<%=encodeForURL(bookmarkSearchText) %>"
                    onclick="return false;"> <%=glp("jcmsplugin.bookmarks.items.lbl.shift")%>
                  </a></li>
                  <%-- DELETE SELECTED BOOKMARK ITEMS --%>
                  <li class="disabled deleteBookmark"><a class="bookmark-item-action bookmark-action-disabled"
                    href="plugins/BookmarksPlugin/jsp/bookmarkItemsActionModal.jsp?<%=BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>=<%=currentFolderId%>&amp;<%=BookmarkConstants.PARAMETER_BOOKMARK_ITEM_ACTION_MODAL%>=<%=BookmarkConstants.BOOKMARK_ITEM_ACTIONS.DELETE%>"
                    onclick="return false;"> <%=glp("jcmsplugin.bookmarks.items.lbl.delete")%>
                  </a></li>
                <% } %>
                
                <% if(isPortlet){ %>
                  <li><a class="manage-bookmark" href="plugins/BookmarksPlugin/jsp/manageBookmarksFullDisplay.jsp">
                      <%= glp("jcmsplugin.bookmarks.lbl.manage-bookmark") %>
                  </a></li>  
                  <% if(bookmarkPortlet != null){  %>
                  <li><a class="ajax-refresh remove-bookmark"
                     href="plugins/BookmarksPlugin/jsp/bookmarkMenu.jsp?opBookmarkDelete=true&amp;<%=BookmarkConstants.PARAMETER_DATA_ID %>=<%= bookmarkPortlet.getId() %>&amp;csrftoken=<%= encodeForURL(getCSRFToken()) %>">
                       <%= glp("jcmsplugin.bookmarks.lbl.remove-bookmark") %></a>
                  </li>
                  <% }else{ %>
                       <li><a class="modal addBookmark"
                         href="plugins/BookmarksPlugin/jsp/bookmarkModal.jsp?<%=BookmarkConstants.PARAMETER_ONLY_DATA_ID_MODAL%>=<%=(pub==null)?"":currentPublicationId %>"
                         onclick="return false;"> <%= glp("jcmsplugin.bookmarks.lbl.add-bookmark") %></a>
                       </li>
                  <% }  %>
                <% } %>
  
              </ul></li>
          </ul>
  
          <form name="bookmarkForm"
            action="plugins/BookmarksPlugin/jsp/manageBookmarksAppListView.jsp"
            class="navbar-form navbar-right">
            <div class="form-group">
              <jalios:field name="bookmarkSearchText"
                value="<%= bookmarkSearchText %>" resource="field-light">
                <jalios:control
                  settings='<%= bookmarkHandler.getSearchFieldSettings() %>' />
                <span class="input-group-btn">
                  <button class="btn btn-default ajax-refresh"
                    name="opSearch" type="submit">
                    <jalios:icon src="search" />
                  </button>
                  <% if(bookmarkHandler.hasBookmarkSearch()) { %>
                    <a href="?bookmarkSearchText=" class="ajax-refresh btn btn-default add-on" title='<%= glp("ui.com.btn.reset") %>'><jalios:icon src="cross" alt="ui.com.btn.reset" /></a>
                  <% } %>
                </span>
              </jalios:field>
            </div>
          </form>
  
        </div>
      </div>
    
    
    <% if(Util.notEmpty(breadcrumb)) { %>

    <div class="bookmark-breadcrumb">
      <%= breadcrumb %>
    </div>
    <% } %>

    <table
      class="table table-bookmarks <%= (Util.notEmpty(bookmarkHandler.getBookmarkSearchText()))?"":"table-bookmarks-sortable" %>">
      <thead>
        <% if(!isPortlet&&bookmarkItemList.size()!=0){ %>
        <tr>
          <th class="fit text-center"><label
            class="bookmarks-items-checkbox"><input
              type="checkbox" class="bookmarks-checkbox-all"
              name="check-all" /></label></th>
          <th><%=glp("jcmsplugin.bookmarks.lbl.bookmarks")%></th>
          <th></th>
          <th></th>
        </tr>
        <% } %>
      </thead>
      <div class="container-fluid" style="text-align: center;">
        <% if (Util.getSize(bookmarkItemList) == 0) { %>
        <%@ include file='/front/app/doAppNoResult.jspf' %>
        <% } %>
      </div>
      <tbody class="sortable">
        <%-- BOOKMARK ITEM LIST --%>
        <% 
          int pageCount = BookmarkConstants.PORTLET_BOOKMARK_PAGER_MAX; 
          int itemIndex = 0;
        %>
        <%-- BOOKMARK ITEM LIST --%>
        <jalios:pager
          name="bookmarksPagerHandler"
          declare="true"
          action="init"
          pageSize='<%= pageCount %>'
          size="<%= bookmarkItemList.size() %>"
        />
        <%
          int skipIndex = bookmarksPagerHandler.getStart();
          int maxIndex = isPortlet?bookmarksPagerHandler.getPageSize():-1;
        %>
        <jalios:foreach collection="<%= bookmarkItemList %>" name="bookmarkItem" type="BookmarkItem" skip="<%= skipIndex %>" max="<%= maxIndex %>">
        
        <%   
            String bookmarkItemClass = "";
            if(Util.isEmpty(bookmarkHandler.getBookmarkSearchText())){
              bookmarkItemClass += "bookmark-draggable-item";
              if(bookmarkItem instanceof BookmarkFolder){
                bookmarkItemClass += " bookmark-droppable";
              }
            }else{
              bookmarkItemClass = "bookmark-search-result-item";
            }
          %>
        <tr class="bookmark-droppable bookmark-separator"
          data-jalios-item-index="<%=itemIndex%>">
          <td colspan="4"><div class="bookmark-separator-line">&nbsp;</div></td>
        </tr>
        <% itemIndex++; %>
        <tr class="<%=bookmarkItemClass%>"
          data-jalios-bookmark-id="<%=bookmarkItem.getId()%>"
          data-jalios-bookmark-folder_id="<%=currentFolderId%>">
          <% if(!isPortlet){ %>
          <td class="fit text-center"><label
            class="bookmarks-items-checkbox"><input
              type="checkbox" class="bookmarks-checkbox" name="itemIds"
              value="<%=bookmarkItem.getId()%>" /></label></td>
          <% } %>
          <%-- BOOKMARK FOLDER ITEM --%>
          <% if(bookmarkItem instanceof BookmarkFolder){ %>
          <td class="expand bookmark-folder">
            <div>
              <a onclick="return false;" class="ajax-refresh"
                href="plugins/BookmarksPlugin/jsp/manageBookmarksFullDisplay.jsp?<%=BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>=<%=bookmarkItem.getId()%>">
                <jalios:icon src="<%=bookmarkItem.getDataIcon()%>" />
                <%= bookmarkItem.getName()%>
              </a>
            </div>
          </td>
          <% if(!isPortlet){ %>
          <%--  EDIT BOOKMARK FOLDER --%>
          <td class="fit text-center"><a
            class="modal bookmark-actions"
            href="plugins/BookmarksPlugin/jsp/bookmarkFolderEditModal.jsp?<%=BookmarkConstants.PARAMETER_DATA_ID%>=<%=bookmarkItem.getId()%>&amp;<%=BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>=<%=currentFolderId %>"
            onclick="return false;"> <jalios:icon src="edit-small" /></a>
          </td>
          <%--  DELETE BOOKMARK FOLDER --%>
          <td class="fit text-center"><a class="ajax-refresh confirm bookmark-actions" data-jalios-ajax-refresh="nohistory noscroll"
            data-jalios-text="<%= glp("jcmsplugin.bookmarks.folder.action.delete.warn-msg") %>"
            href="plugins/BookmarksPlugin/jsp/manageBookmarksAppListView.jsp?opBookmarkFolderDelete=true&amp;<%=BookmarkConstants.PARAMETER_DATA_ID%>=<%=bookmarkItem.getId()%>&amp;<%=BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>=<%=currentFolderId%>">
              <jalios:icon src="remove-small" />
          </a></td>
          <% } %>
          <% } %>
          <% if(bookmarkItem instanceof Bookmark){ 
              Bookmark bookmark = (Bookmark) bookmarkItem;
              boolean showEditUrl = canEdit;
              String bookmarkFolderId = Util.isEmpty(bookmarkItem.getParentFolderId())?"":bookmarkItem.getParentFolderId();
              String editLink = BookmarkConstants.PARAMETER_DATA_ID+"="+bookmark.getId()+"&"+BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID+"="+bookmarkFolderId;
              editLink += "&bookmarkSearchText="+encodeForURL(bookmarkSearchText);
              
              if(bookmark.isData()){
                String publicationId = bookmark.getData().getId();
                editLink += "&"+BookmarkConstants.PARAMETER_ONLY_DATA_ID_MODAL+"="+publicationId;
              }
            %>
          <td class="expand bookmark-item"> <%
            if(bookmark.isFileDocument() || bookmark.isData()){%> 
                <jalios:link data='<%=bookmark.getData()%>'><jalios:dataicon data="<%=bookmark%>"
                  css="jalios-icon-sm"></jalios:dataicon> <%= bookmark.getData().getDataName(userLang) %></jalios:link>
                 <%
            } else if(bookmark.isQuery()){
            %> <a href="<%=encodeForHTMLAttribute(bookmark.getQueryUrl(),true)%>" title="<%= encodeForHTMLAttribute(bookmark.getTitle(),true)%>"><jalios:dataicon data="<%=bookmark%>"
                  css="jalios-icon-sm"></jalios:dataicon> <%= bookmark.getTitle()%></a>
            <% }else{
              boolean isExternalLink = bookmarkHandler.isExternalLinks(bookmark.getAnyUrl());
              boolean isInNewWindows = bookmarkHandler.getExternalLinksInNewWindow(portlet,isExternalLink);
              String title = bookmarkHandler.getLinkTitle(bookmark,isExternalLink);
            %> <a <% if(isInNewWindows){ %>target="_blank"<% } %> <% if(isExternalLink){ %>rel="noopener noreferrer"<% } %> href="<%=encodeForHTMLAttribute(bookmark.getAnyUrl(),true)%>" title="<%=encodeForHTMLAttribute(title,true)%>">
                 <jalios:dataicon data="<%=bookmark%>" css="jalios-icon-sm"></jalios:dataicon> <%= Util.getString(bookmark.getTitle(), bookmark.getAnyUrl())%></a>
            <% } %>
          </td>
          <% if(!isPortlet){ %>
          <td class="fit text-center">
            <%-- EDIT --%> 
            <% if (showEditUrl) { %> 
              <a class="modal bookmark-actions"
              href="plugins/BookmarksPlugin/jsp/bookmarkEditModal.jsp?<%=editLink %>"
              onclick="return false;"> <jalios:icon src="edit-small" /></a>
            <% } %>
          </td>
          <td class="fit text-center">
            <%-- DELETE --%> 
            <% if (canEdit) { %> 
              <a class="ajax-refresh confirm bookmark-actions"
                data-jalios-ajax-refresh="nohistory noscroll"
                href="plugins/BookmarksPlugin/jsp/manageBookmarksAppListView.jsp?opBookmarkDelete=true&amp;<%=BookmarkConstants.PARAMETER_DATA_ID%>=<%=bookmark.getId()%>&amp;<%=BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>=<%=currentFolderId%>&amp;<%= BookmarkConstants.PARAMETER_BOOKMARK_QUERY%>=<%=encodeForURL(bookmarkSearchText) %>">
                  <jalios:icon src="remove-small" />
              </a> <% } %>
          </td>
          <% } %>
          <% } %>
        </tr>
        </jalios:foreach>
        <tr class="bookmark-droppable bookmark-separator"
          data-jalios-item-index="<%=itemIndex%>">
          <td colspan="4"><div class="bookmark-separator-line">&nbsp;</div></td>
        </tr>
      </tbody>
    </table>
    <% if(isPortlet){ %>
    <jalios:pager name='bookmarksPagerHandler' />
    <% } %>
  </div>
</div>


<%-- <%@ include file='/jcore/doAjaxFooter.jspf'%> --%>
