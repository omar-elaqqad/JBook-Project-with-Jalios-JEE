<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkFolder"%>
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
  String currentFolderId = HttpUtil.getDataIdParameter(request, BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID);
  String workspaceId = HttpUtil.getDataIdParameter(request, BookmarkConstants.PARAMETER_WORKSPACE_ID);
%>
<% if(bookmarkHandler.validate()){ %>
<jalios:javascript>
  // Refresh Portlet
  jQuery('.bookmark-list-view').refresh({params:{"<%= BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>":"<%=currentFolderId%>",
    "<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>":"<%= workspaceId %>"}});
  // Close modal confirm
  JCMS.window.Modal.close(false);
 </jalios:javascript>
<% } %>
<%
if(Util.isEmpty(bookmarkHandler.getBookmarkFolderIdTarget())){
  bookmarkHandler.setBookmarkFolderIdTarget(currentFolderId);
}
  BookmarkManager.BookmarkFolderSelectInfo bookmarkFolderSelectInfo = BookmarkManager.getInstance().buildBookmarkFolderSelect(loggedMember, workspaceId);
%>



<jalios:modal title="jcmsplugin.bookmarks.folder.lbl.add" formHandler="<%= bookmarkHandler %>" op="opBookmarkFolderAdd" button="ui.com.btn.add" url="plugins/BookmarksPlugin/jsp/bookmarkFolderModal.jsp">
  <jalios:field name="folderName" label="jcmsplugin.bookmarks.folder.lbl.name" value="<%=bookmarkHandler.getFolderName() %>">
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>
  
  <input type='hidden' name='<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>' value='<%= workspaceId %>'/>
  
 <%if(BookmarkManager.getInstance().getAllBookmarkFolder(loggedMember, workspaceId).size() > 0){ %>
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
</jalios:modal>