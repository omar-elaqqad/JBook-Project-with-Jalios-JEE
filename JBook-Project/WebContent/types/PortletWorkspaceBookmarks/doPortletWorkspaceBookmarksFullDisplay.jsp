<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%@ page import="com.jalios.jcmsplugin.bookmarks.*"%>

<jsp:useBean id='bookmarkHandler' scope='page' class='com.jalios.jcmsplugin.bookmarks.BookmarkHandler'>
<jsp:setProperty name='bookmarkHandler' property='request' value='<%= request %>' />
<jsp:setProperty name='bookmarkHandler' property='response' value='<%= response %>' />
<jsp:setProperty name='bookmarkHandler' property='*' />
<jsp:setProperty name='bookmarkHandler' property='noRedirect' value='<%= true%>' />
</jsp:useBean>
<%

if (!isLogged) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}

jcmsContext.addJavaScript("plugins/BookmarksPlugin/js/bookmarks.js");
jcmsContext.addCSSHeader("plugins/BookmarksPlugin/css/bookmarks.css");


BookmarkManager bookMarkMgr = BookmarkManager.getInstance();
String currentParentId = getDataIdParameter(BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID);

// Current folder
BookmarkFolder currentFolder = bookMarkMgr.getBookmarkFolder(currentParentId);
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
  bookmarkItemList = bookmarkHandler.getBookmarkListFromQuery(loggedMember, bookmarkHandler.getBookmarkSearchText(), workspace.getId());
  currentFolderId = null;
}else{
  // Retrieve all the bookmarks 
  bookmarkItemList = bookmarkHandler.getBookmarkItemList(loggedMember, currentParentId, workspace.getId());
}

//Breadcrumb
String breadcrumb = bookMarkMgr.displayBreadcrumb(currentFolder, false);

//Can edit or delete bookmark
boolean canEdit = channel.isDataWriteEnabled();
canEdit = loggedMember.isAdmin() || loggedMember.isAdmin(workspace);
String usage = (String) request.getAttribute("BOOKMARK_USAGE");
String refreshUrl = "/types/WorkspaceBookmarks/doWorkspaceBookmarksFullDisplay.jsp";
boolean isPortlet = "box".equals(usage);

//Portlet Bookmark
Bookmark bookmarkPortlet = null;
Publication pub = jcmsContext.getPublication();
String currentPublicationId = "";

if (pub != null && !(pub instanceof Portlet)) {
 bookmarkPortlet = bookMarkMgr.getBookmarkFromDataId(loggedMember, pub.getId()); 
 currentPublicationId = pub.getId();
}

String tplUsage = Util.getString(jcmsContext.getTemplateUsage(), "box");
if(bookmarkHandler.isEditionRemoved()){
  jcmsContext.removeAjaxRequestAttribute("editionMode");
}
%>
<div class="bookmarks-full-display">
  <% if(bookmarkHandler.isEdition() ||jcmsContext.getAjaxRequestAttribute("editionMode") != null){ 
    jcmsContext.setAjaxRequestAttribute("editionMode", "true");
  %>
    <%@ include file="/plugins/BookmarksPlugin/jsp/workspace/doBookmarksWorkspaceEdition.jspf" %>
  <% }else{ %>
    <%@ include file="/plugins/BookmarksPlugin/jsp/workspace/doBookmarksWorkspace.jspf" %>
  <% } %>
<%@ include file='/jcore/doAjaxFooter.jspf'%>
</div>

