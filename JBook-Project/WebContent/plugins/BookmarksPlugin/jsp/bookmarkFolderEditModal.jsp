<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkFolder"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkItem"%>
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

if(bookmarkHandler.validate()){ 
  if(Util.isEmpty(workspaceId)){
    request.setAttribute("modal.redirect","plugins/BookmarksPlugin/jsp/manageBookmarksFullDisplay.jsp?"+BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID+"="+currentFolderId);
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

if(Util.isEmpty(bookmarkHandler.getBookmarkFolderIdTarget())){
  bookmarkHandler.setBookmarkFolderIdTarget(currentFolderId);
}
String dataId = getDataIdParameter(BookmarkConstants.PARAMETER_DATA_ID);

if(!bookmarkHandler.canWorkOnFolder(dataId)){
  sendForbidden(request, response);
}

BookmarkFolder bookmarkFolder = (BookmarkFolder) channel.getData(BookmarkFolder.class, dataId);
bookmarkHandler.setItemIds(new String[]{dataId});
BookmarkManager.BookmarkFolderSelectInfo bookmarkFolderSelectInfo = BookmarkManager.getInstance().buildBookmarkFolderSelect(loggedMember,dataId, workspaceId);


%>

<jalios:modal title="jcmsplugin.bookmarks.folder.lbl.edit" formHandler="<%= bookmarkHandler %>" op="opBookmarkFolderUpdate" button="ui.com.btn.update" url="plugins/BookmarksPlugin/jsp/bookmarkFolderEditModal.jsp">
  <input type="hidden" name="<%=BookmarkConstants.PARAMETER_DATA_ID %>" value="<%=dataId%>" />
  <input type='hidden' name='<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>' value='<%= workspaceId %>'/>
  
  <jalios:field name="folderName" label="jcmsplugin.bookmarks.folder.lbl.name1" value='<%= hasParameter("folderName")?bookmarkHandler.getFolderName():bookmarkFolder.getName() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>"/>
  </jalios:field>
  <%if(BookmarkManager.getInstance().getAllBookmarkFolder(loggedMember,workspaceId).size() > 0){ %>
    <jalios:field label='<%= glp("jcmsplugin.bookmarks.folder.lbl") %>'>
      <select name="bookmarkFolderIdTarget" class="form-control bookmark-select-folder">
          <option value="new-folder"><%=glp("jcmsplugin.bookmarks.folder.lbl.new") %></option>
          <option value="" disabled="disabled">-----</option>
          <%  for (int i = 0; i < bookmarkFolderSelectInfo.getKey().size(); i++) {  %>
            <option value="<%=bookmarkFolderSelectInfo.getValue().get(i) %>" 
              <% if(bookmarkHandler.getBookmarkFolderIdTarget().equals(bookmarkFolderSelectInfo.getValue().get(i))){ %> selected="selected" <% } %>>
                <%= bookmarkFolderSelectInfo.getKey().get(i) %>
            </option> 
          <% } %>
      </select>
    </jalios:field>
        
    <div class="form-group">
      <div class="col-md-3">
      </div>
      <div class="col-md-9 bookmark-new-folder" style='display:<%=(bookmarkHandler.getBookmarkFolderIdTarget().equals("new-folder")?"block":"none")%>' >
        <fieldset>
        <legend></legend>
        <jalios:field name="<%=BookmarkConstants.PARAMETER_BOOKMARK_NEW_FOLDER_NAME %>" label="jcmsplugin.bookmarks.folder.lbl.name" value="<%=bookmarkHandler.getNewFolderName() %>">
          <jalios:control type="<%= ControlType.TEXTFIELD %>"/>
        </jalios:field>
          
        <%if(bookmarkFolderSelectInfo.getKey().size() > 0){ %>
          <jalios:field name="<%= BookmarkConstants.PARAMETER_NEW_FOLDER_ID_TARGET %>" label='<%= glp("jcmsplugin.bookmarks.folder.lbl.name.parent1") %>' value='<%= bookmarkHandler.getNewBookmarkFolderIdTarget() %>'>
            <select name="<%= BookmarkConstants.PARAMETER_NEW_FOLDER_ID_TARGET %>" class="form-control bookmark-select-folder">
              <%  for (int i = 0; i < bookmarkFolderSelectInfo.getKey().size(); i++) {  %>            
              <option value="<%=bookmarkFolderSelectInfo.getValue().get(i) %>" 
                <% if(bookmarkHandler.getBookmarkFolderIdTarget().equals(bookmarkFolderSelectInfo.getValue().get(i))){ %> selected="selected" <% } %>>
                  <%= bookmarkFolderSelectInfo.getKey().get(i) %>
              </option> 
              <% } %>
            </select>
          </jalios:field>
        <% } %>
        </fieldset>
      </div>
    </div>
  <% } %>
</jalios:modal>