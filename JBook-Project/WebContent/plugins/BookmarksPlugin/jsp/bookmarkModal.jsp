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
String currentFolderId = getDataIdParameter(BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID);
String workspaceId = HttpUtil.getDataIdParameter(request, BookmarkConstants.PARAMETER_WORKSPACE_ID);
if(bookmarkHandler.validate()) { 
%>
<jalios:javascript>
  // Refresh Portlet
  jQuery('.bookmark-list-view').refresh({params:{"<%= BookmarkConstants.PARAMETER_CURRENT_FOLDER_ID%>":"<%=currentFolderId%>",
    "<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>":"<%= workspaceId %>"}});
  jQuery('.bookmark-menu').refresh();
  jQuery('.bookmark-publication').refresh(
  {
  	'params'       : {
          'pubId' : "<%= bookmarkHandler.getDataId() %>"    
          }
  }
  );
  // Close modal confirm
  JCMS.window.Modal.close(false);
 </jalios:javascript>
<% } %>
<%
if(Util.isEmpty(bookmarkHandler.getBookmarkFolderIdTarget())){
  bookmarkHandler.setBookmarkFolderIdTarget(currentFolderId);
}

String dataOnlyId = getDataIdParameter(BookmarkConstants.PARAMETER_ONLY_DATA_ID_MODAL);

Data data = channel.getData(bookmarkHandler.getDataId());
if(Util.notEmpty(dataOnlyId)){
  data = channel.getData(dataOnlyId);
  bookmarkHandler.setTabOpen("openTabData");
}

boolean isOpenTabUrl = bookmarkHandler.isOpenTabUrl();

BookmarkManager.BookmarkFolderSelectInfo bookmarkFolderSelectInfo = BookmarkManager.getInstance().buildBookmarkFolderSelect(loggedMember, workspaceId);

jcmsContext.addJavaScript("plugins/BookmarksPlugin/js/bookmarkMenu.js");
%>


<jalios:modal title="jcmsplugin.bookmarks.lbl.add" formHandler="<%= bookmarkHandler %>" op="opBookmarkAdd" button="ui.com.btn.add" url="plugins/BookmarksPlugin/jsp/bookmarkModal.jsp">    
  <ul class="nav nav-tabs">    
    <li <%if(isOpenTabUrl){%>class="active"<% } %>><a href="?changeTab=tabUrl"  data-jalios-action="ajax-refresh" data-jalios-ajax-refresh="isform"><%= glp("jcmsplugin.bookmarks.lbl.link") %></a></li>
    <li <%if(!isOpenTabUrl){%>class="active"<% } %>><a href="?changeTab=tabData" data-jalios-action="ajax-refresh" data-jalios-ajax-refresh="isform"><%= glp("jcmsplugin.bookmarks.lbl.pub") %></a></li>
  </ul>
  
  <div class='tab-content'>
    <input type='hidden' name='<%= BookmarkConstants.PARAMETER_WORKSPACE_ID %>' value='<%= workspaceId %>'/>
    <input type="hidden" name="<%=BookmarkConstants.PARAMETER_ONLY_DATA_ID_MODAL %>" value="<%=dataOnlyId%>" />
    <input type="hidden" name="tabOpen" value="<%= bookmarkHandler.getTabOpen() %>" />
    
    <div id="bookmarkUrl" class="tab-pane <%= isOpenTabUrl?"active in":"" %>">
      <jalios:field name="url" label="jcmsplugin.bookmarks.lbl.url" value="<%=bookmarkHandler.getUrl()%>">
        <jalios:control type="<%= ControlType.URL %>" />
      </jalios:field>
      <jalios:field name="title" label="jcmsplugin.bookmarks.lbl.title" value="<%=bookmarkHandler.getTitle() %>">
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
    </div>

    <div id="bookmarkData" class="tab-pane <%= isOpenTabUrl?"":"active in" %>">
        <jalios:field label="ui.com.lbl.publication" name='<%= BookmarkConstants.PARAMETER_DATA_ID %>' value="<%= data %>">
          <jalios:control settings='<%= new PublicationSettings().superType(Publication.class) %>' />
        </jalios:field>
      </div>
      
<%--       <%if(BookmarkManager.getInstance().getAllBookmarkFolder(loggedMember,workspaceId).size() > 0){ %> --%>
        <%@ include file='/plugins/BookmarksPlugin/jsp/doBookmarkFolderSelect.jspf' %>
<%--       <% } %> --%>
  </div>
</jalios:modal>