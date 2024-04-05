<%@page import="com.jalios.jcms.taglib.list.ListItemTag.LinkTarget"%>
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
String currentFolderId = (currentFolder!=null)?currentFolder.getId():"";

// Parent folder
BookmarkFolder parentFolder = (currentFolder != null)?currentFolder.getParentFolder():null;
String parentFolderId = (parentFolder != null)?parentFolder.getId():"";

String bookmarkSearchText = Util.isEmpty(bookmarkHandler.getBookmarkSearchText())?"":bookmarkHandler.getBookmarkSearchText();

// BookmarkPLugin
Plugin bookmarkPlugin = PluginManager.getPluginManager().getPlugin(BookmarkConstants.PLUGIN_NAME);

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
String breadcrumb = bookMarkMgr.displayBreadcrumb(currentFolder, false);

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
          <% if(bookmarkPlugin.isActive()){ %>
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
                  <% if(bookmarkPortlet != null && channel.isDataWriteEnabled() && bookmarkPlugin.isActive()){  %>
                  <li><a class="ajax-refresh remove-bookmark"
                     href="plugins/BookmarksPlugin/jsp/bookmarkMenu.jsp?opBookmarkDelete=true&amp;<%=BookmarkConstants.PARAMETER_DATA_ID %>=<%= bookmarkPortlet.getId() %>&amp;csrftoken=<%= encodeForURL(getCSRFToken()) %>">
                       <%= glp("jcmsplugin.bookmarks.lbl.remove-bookmark") %></a>
                  </li>
                  <% }else if(channel.isDataWriteEnabled() && bookmarkPlugin.isActive()){ %>
                       <li><a class="modal addBookmark"
                         href="plugins/BookmarksPlugin/jsp/bookmarkModal.jsp?<%=BookmarkConstants.PARAMETER_ONLY_DATA_ID_MODAL%>=<%=(pub==null)?"":currentPublicationId %>"
                         onclick="return false;"> <%= glp("jcmsplugin.bookmarks.lbl.add-bookmark") %></a>
                       </li>
                  <% }  %>
                <% } %>
  
              </ul></li>
          </ul>
          <% } %>
  
          <form name="bookmarkForm"
            action="plugins/BookmarksPlugin/jsp/manageBookmarksListView.jsp"
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
  <%-- BOOKMARK ITEM LIST --%>
  <div class="container-fluid" style="text-align: center;">
    <% if (Util.getSize(bookmarkItemList) == 0) { %>
    <%@ include file='/front/app/doAppNoResult.jspf' %>
    <% } %>
  </div>
  <jalios:list> 
    <jalios:foreach collection="<%= bookmarkItemList %>" type="BookmarkItem" name="item"> 
     
      <% 
      String url = "";
      String customCss = "";
      String title;
      
      if(item instanceof BookmarkFolder){ 
        url = "plugins/BookmarksPlugin/jsp/manageBookmarksFullDisplay.jsp?"+BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID+"="+item.getId();
        customCss = "ajax-refresh";
      %>
       <jalios:listItem text="<%= item.getName() %>" link="<%= url %>" linkCss="ajax-refresh" icon="<%= item.getDataIcon() %>"/>

      <%-- BOOKMARK ITEM --%>
      <%
      }else if(item instanceof Bookmark){
        Bookmark bookmark = (Bookmark) item;
        if(bookmark.isFileDocument() || bookmark.isData()){
          customCss = "ctxTooltipCard ID_"+bookmark.getData().getId();
          url = encodeForHTMLAttribute(bookmark.getData().getDisplayUrl(userLocale));
          %>
          <jalios:listItem text="<%= bookmark.getData().getDataName(userLang) %>" linkCss="<%= customCss %>" icon="<%= bookmark.getDataIcon() %>" link="<%= url %>" />
          <%
        }else if(bookmark.isQuery()){
          url = encodeForHTMLAttribute(bookmark.getQueryUrl(),true);
          title = encodeForHTMLAttribute(bookmark.getTitle(),true);
          %>
          <jalios:listItem text="<%= title %>" icon="<%= item.getDataIcon() %>" link="<%= url %>"/>
          <%
        }else{
          boolean isExternalLink = bookmarkHandler.isExternalLinks(bookmark.getAnyUrl());
          boolean isInNewWindows = bookmarkHandler.getExternalLinksInNewWindow(portlet,isExternalLink);
          title = Util.getString(bookmark.getTitle(), bookmark.getAnyUrl());
          url = encodeForHTMLAttribute(bookmark.getAnyUrl(),true);
          customCss+= "\" target='blank'";
          %>
          <jalios:listItem  
            linkCss="<%= isInNewWindows?customCss:null %>"
            text="<%= title %>" 
            icon="<%= item.getDataIcon() %>" 
            link="<%= url %>" />
          <%
        }
      }
    %>
    </jalios:foreach> 
  </jalios:list>
  </div>
</div>