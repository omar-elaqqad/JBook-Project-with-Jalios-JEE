<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkItem"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkFolder"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkConstants"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>

<jsp:useBean id='bookmarkHandler' scope='page' class='com.jalios.jcmsplugin.bookmarks.BookmarkHandler'>
<jsp:setProperty name='bookmarkHandler' property='request' value='<%= request %>'/>
<jsp:setProperty name='bookmarkHandler' property='response' value='<%= response %>'/>
<jsp:setProperty name='bookmarkHandler' property='*' />
<jsp:setProperty name='bookmarkHandler' property='noRedirect' value='true' />
</jsp:useBean>
<%
String currentFolderId = HttpUtil.getDataIdParameter(request, BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID);
String workspaceId = HttpUtil.getDataIdParameter(request, BookmarkConstants.PARAMETER_WORKSPACE_ID);

BookmarkManager.BookmarkFolderSelectInfo bookmarkFolderSelectInfo;
if(bookmarkHandler.validate()){ %>  
  <%
  boolean actionIsAdd_search = bookmarkHandler.getBookmarkItemsActionModal().equals(BookmarkConstants.BOOKMARK_ITEM_ACTIONS.ADD_SEARCH.toString());
  if(actionIsAdd_search){ %>
    <jalios:javascript>
      jQuery('.bookmark-menu').refresh();
      // Close modal confirm
      JCMS.window.Modal.close(false);
    </jalios:javascript>
  <% }else if(Util.notEmpty(workspaceId)){%>    
    <jalios:javascript>
      // Refresh Portlet
      jQuery('.bookmark-list-view').refresh({params:{"<%= BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>":"<%=currentFolderId%>",
        "<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>":"<%= workspaceId %>"}});
      JCMS.window.Modal.close(true);
    </jalios:javascript>

  <% }else if(Util.isEmpty(workspaceId)){
    request.setAttribute("modal.redirect","plugins/BookmarksPlugin/jsp/manageBookmarksFullDisplay.jsp?"+BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID+"="+currentFolderId);
  %>
    <%@ include file="/jcore/modal/modalRedirect.jspf" %>
  <% } %>

<% } %>

<%
  if(Util.isEmpty(bookmarkHandler.getBookmarkFolderIdTarget())){
    bookmarkHandler.setBookmarkFolderIdTarget(currentFolderId);
  }
  
  bookmarkFolderSelectInfo = bookmarkHandler.getBookmarkFolderSelectInfo(bookmarkHandler.getBookmarkFolderId(), workspaceId);
  String modalTitle = bookmarkHandler.getActionModalTitle();
  String buttonLabel = bookmarkHandler.getActionModalButtonLabel();
  String operation = bookmarkHandler.getActionModalOperation(currentFolderId, workspaceId);
%>


<jalios:modal title="<%=bookmarkHandler.getActionModalTitle()%>" formHandler="<%=bookmarkHandler%>" op="<%=operation%>" button="<%=buttonLabel%>" url="plugins/BookmarksPlugin/jsp/bookmarkItemsActionModal.jsp">
  <input type='hidden' name='<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>' value='<%= workspaceId %>'/>
  
  <% if(bookmarkHandler.getBookmarkItemsActionModal().equals(BookmarkConstants.BOOKMARK_ITEM_ACTIONS.ADD_SEARCH.toString())){ %>
    <jalios:field name='<%=BookmarkConstants.PARAMETER_BOOKMARK_TITLE %>' label='<%=glp("jcmsplugin.bookmarks.lbl.title") %>' value='<%= bookmarkHandler.getTitle() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    <jalios:field name="<%= BookmarkConstants.PARAMETER_FOLDER_ID_TARGET %>" label='<%= glp("jcmsplugin.bookmarks.folder.lbl") %>' value='<%= bookmarkHandler.getBookmarkFolderIdTarget() %>'>
      <select name="<%= BookmarkConstants.PARAMETER_FOLDER_ID_TARGET %>" class="form-control bookmark-select-folder">
        <%  for (int i = 0; i < bookmarkFolderSelectInfo.getKey().size(); i++) {  %>          
        <option value="<%=bookmarkFolderSelectInfo.getValue().get(i) %>" 
          <% if(bookmarkHandler.getBookmarkFolderIdTarget().equals(bookmarkFolderSelectInfo.getValue().get(i))){ %> selected="selected" <% } %>>
            <%= bookmarkFolderSelectInfo.getKey().get(i) %>
        </option> 
        <% } %>
      </select>
    </jalios:field>
    <input type="hidden" name="qs" value="<%= encodeForHTMLAttribute(bookmarkHandler.getQs()) %>"/>
  <% } %>  
  
  <% if(bookmarkHandler.getBookmarkItemsActionModal().equals(BookmarkConstants.BOOKMARK_ITEM_ACTIONS.MOVE.toString())){ %>
    <%if(bookmarkFolderSelectInfo.getKey().size() == 0){ %>
      <%=glp("jcmsplugin.bookmarks.folder.action.move.empty") %>
    <% }else{ %>
      <jalios:field name="<%= BookmarkConstants.PARAMETER_FOLDER_ID_TARGET %>" label='<%= glp("jcmsplugin.bookmarks.folder.lbl") %>' value='<%= bookmarkHandler.getBookmarkFolderIdTarget() %>'>
        <select name="<%= BookmarkConstants.PARAMETER_FOLDER_ID_TARGET %>" class="form-control bookmark-select-folder">
          <%  for (int i = 0; i < bookmarkFolderSelectInfo.getKey().size(); i++) {  %>            
          <option value="<%=bookmarkFolderSelectInfo.getValue().get(i) %>" 
            <% if(bookmarkHandler.getBookmarkFolderIdTarget().equals(bookmarkFolderSelectInfo.getValue().get(i))){ %> selected="selected" <% } %>>
              <%= bookmarkFolderSelectInfo.getKey().get(i) %>
          </option> 
          <% } %>
        </select>
      </jalios:field>
    <% } %>
  <% } %>
  
  <% if(bookmarkHandler.getBookmarkItemsActionModal().equals(BookmarkConstants.BOOKMARK_ITEM_ACTIONS.DELETE.toString())){ %>
    <%= bookmarkHandler.getDeleteActionMessage() %>
  <% } %>
</jalios:modal>