<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkConstants"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>

<jsp:useBean id='bookmarkHandler' scope='page' class='com.jalios.jcmsplugin.bookmarks.BookmarkHandler'>
<jsp:setProperty name='bookmarkHandler' property='request' value='<%= request %>'/>
<jsp:setProperty name='bookmarkHandler' property='response' value='<%= response %>'/>
<jsp:setProperty name='bookmarkHandler' property='*' />
<jsp:setProperty name='bookmarkHandler' property='noRedirect' value='<%= true%>' />
</jsp:useBean>

<%
jcmsContext.addJavaScript("plugins/BookmarksPlugin/js/bookmarkMenu.js");
String currentFolderId = getDataIdParameter(BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID);
String workspaceId = HttpUtil.getDataIdParameter(request, BookmarkConstants.PARAMETER_WORKSPACE_ID);

boolean validate = bookmarkHandler.validate();
if(validate){ 
  String bookmarkSearchText = (Util.isEmpty(bookmarkHandler.getBookmarkSearchText()))?"":bookmarkHandler.getBookmarkSearchText();
  if(Util.isEmpty(workspaceId)){
    request.setAttribute("modal.redirect","plugins/BookmarksPlugin/jsp/manageBookmarksFullDisplay.jsp?"+BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID+"="+currentFolderId+"&bookmarkSearchText="+encodeForURL(bookmarkSearchText));
    %>
    <%@ include file="/jcore/modal/modalRedirect.jspf" %>

    <%
  }else{
    %>
    <jalios:javascript>
	  // Refresh Portlet
	  jQuery('.bookmark-list-view').refresh({params:{"<%= BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>":"<%=currentFolderId%>",
	    "<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>":"<%= workspaceId %>"}});
	  // Close modal confirm
	  JCMS.window.Modal.close(false);
	 </jalios:javascript>
<%
  }
}

String bookmarkId = getDataIdParameter(BookmarkConstants.PARAMETER_BOOKMARK_ID).length()!=0? getDataIdParameter(BookmarkConstants.PARAMETER_BOOKMARK_ID):getDataIdParameter(BookmarkConstants.PARAMETER_DATA_ID);
String dataOnlyId = getDataIdParameter(BookmarkConstants.PARAMETER_ONLY_DATA_ID_MODAL);

if(Util.isEmpty(bookmarkHandler.getBookmarkFolderIdTarget())){
  bookmarkHandler.setBookmarkFolderIdTarget(currentFolderId);
}

Bookmark bookmark = BookmarkManager.getInstance().getBookmarkFromDataId(loggedMember, bookmarkId);
if (bookmark == null) {
  bookmark = (Bookmark) channel.getData(Bookmark.class, bookmarkId);
}
if(!bookmarkHandler.canWorkOnBookmarkItem(bookmark.getId())){
  sendForbidden(request, response);
}

Data data = null;
if(Util.notEmpty(dataOnlyId)){
  data = channel.getData(dataOnlyId);
  bookmarkHandler.setTabOpen("openTabData");
}

boolean isOpenTabUrl = bookmarkHandler.isOpenTabUrl();
BookmarkManager.BookmarkFolderSelectInfo bookmarkFolderSelectInfo = BookmarkManager.getInstance().buildBookmarkFolderSelect(loggedMember, workspaceId);
%>

<jalios:modal title="jcmsplugin.bookmarks.lbl.edit" formHandler="<%= bookmarkHandler %>" op="opBookmarkUpdate" button="ui.com.btn.update" url="plugins/BookmarksPlugin/jsp/bookmarkEditModal.jsp">  
  <% Plugin bookmarkPlugin = PluginManager.getPluginManager().getPlugin(BookmarkConstants.PLUGIN_NAME);
  if(!validate && bookmarkPlugin.isActive()){ %>
  <div class='tab-content'>
    <input type="hidden" name="<%= BookmarkConstants.PARAMETER_BOOKMARK_ID %>" value="<%=bookmark.getId() %>" />           
    <input type='hidden' name='<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>' value='<%= workspaceId %>'/>
   
    <div id="bookmarkUrl" class="tab-pane <%= isOpenTabUrl?"active in":"" %>">
      <% if(!bookmark.isQuery()) { %>
        <jalios:field name="url" label="jcmsplugin.bookmarks.lbl.url" value='<%= hasParameter("url")?bookmarkHandler.getUrl():bookmark.getAnyUrl() %>'>
          <jalios:control type="<%= ControlType.URL %>" />
        </jalios:field>
      <% } %>
      <% if(bookmark.isQuery()) { %>
        <input type="hidden" name="url" value='<%= encodeForHTMLAttribute(bookmark.getAnyUrl()) %>' />
      <% } %>
      <jalios:field name="title" label="jcmsplugin.bookmarks.lbl.title" value='<%= hasParameter("title")?bookmarkHandler.getTitle():bookmark.getTitle() %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
    </div>
    <div id="bookmarkData" class="tab-pane <%= isOpenTabUrl?"":"active in" %>">
      <jalios:field label="ui.com.lbl.publication" name='<%=BookmarkConstants.PARAMETER_DATA_ID%>' value="<%=data%>">
        <jalios:control settings='<%= new PublicationSettings().superType(Publication.class) %>' />
      </jalios:field>
    </div>
    <%if(BookmarkManager.getInstance().getAllBookmarkFolder(loggedMember,workspaceId).size() > 0){ %>
       <%@ include file='/plugins/BookmarksPlugin/jsp/doBookmarkFolderSelect.jspf' %>
    <% } %>
  </div>
  <% } %>
</jalios:modal>

