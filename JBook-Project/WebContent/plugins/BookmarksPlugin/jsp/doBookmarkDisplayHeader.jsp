<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkConstants"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@ include file="/jcore/doInitPage.jspf"%>

<% 
  if (!isLogged || !channel.isDataWriteEnabled()) { 
    return;
  }

  Publication pub = jcmsContext.getPublication();
  if(pub == null){
    pub = getPublicationParameter("pubId");
  }

  if (pub == null || !pub.isPersisted()) {
    return;
  }
  
  BookmarkManager bookmarkManager = BookmarkManager.getInstance();
 
  
  if (!bookmarkManager.canAddBookmark(loggedMember)) { 
  	return;
  } 
%>
  
<jsp:useBean id='bookmarkHandler' scope='page' class='com.jalios.jcmsplugin.bookmarks.BookmarkHandler'>
  <jsp:setProperty name='bookmarkHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='bookmarkHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='bookmarkHandler' property='*' />
  <jsp:setProperty name='bookmarkHandler' property='noRedirect' value='<%= true%>' />
</jsp:useBean>

<%
boolean result = bookmarkHandler.validate();
if(result){
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();  
}
Bookmark bookmark = bookmarkManager.getBookmarkFromDataId(loggedMember, pub.getId());
%>

<div class="ajax-refresh-div bookmark-publication" data-jalios-ajax-refresh-url="plugins/BookmarksPlugin/jsp/doBookmarkDisplayHeader.jsp">
<% if(bookmark != null) { %>
  <a class="pub-action-remove-bookmark list-group-item pub-action-optional" 
     data-jalios-action="ajax-refresh" 
     data-jalios-options='{ "params" : { "opBookmarkDelete" : true, "dataId":"<%= bookmark.getId() %>" , "pubId":"<%= pub.getId() %>" }}'
     href="#" 
     title="<%= glp("jcmsplugin.bookmarks.lbl.remove-bookmark") %>">
     <jalios:icon src="jcmsplugin-bookmarks-delete" />
   
     <span class="publication-action-label"><%= glp("jcmsplugin.bookmarks.lbl.remove-bookmark") %></span>
   </a>
<% } else { %>
  <% 
  String pubId = (pub == null)?"":pub.getId();
  String addUrl = "plugins/BookmarksPlugin/jsp/bookmarkModal.jsp?" + BookmarkConstants.PARAMETER_ONLY_DATA_ID_MODAL+"="+pubId;
  %>
  <a class="pub-action-add-bookmark list-group-item pub-action-optional" data-jalios-action="modal"
     href="<%= addUrl %>"
     title="<%= glp("jcmsplugin.bookmarks.lbl.add-bookmark") %>">
  <jalios:icon src="jcmsplugin-bookmarks-add" />
    <span class="publication-action-label"><%= glp("jcmsplugin.bookmarks.lbl.add-bookmark") %></span>
  </a>
  <% } %>
  <%@ include file='/jcore/doAjaxFooter.jspf'%>
</div>

