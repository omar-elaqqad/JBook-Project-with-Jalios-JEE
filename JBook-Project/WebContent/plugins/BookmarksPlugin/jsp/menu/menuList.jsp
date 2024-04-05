<%@ include file='/jcore/doInitPage.jspf' %>
<%@page import="com.jalios.jcmsplugin.bookmarks.*"%>
<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%>
<%@page import="com.jalios.util.JProperties"%>

<jsp:useBean id='bookmarkHandler' scope='page' class='com.jalios.jcmsplugin.bookmarks.BookmarkHandler'>
  <jsp:setProperty name='bookmarkHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='bookmarkHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='bookmarkHandler' property='*' />
  <jsp:setProperty name='bookmarkHandler' property='noRedirect' value='<%= true%>' />
</jsp:useBean>

<%
bookmarkHandler.validate();
%>

<% if (isLogged) { %>
  <% 
  
  BookmarkManager bookmarkManager = BookmarkManager.getInstance();
  BookmarkItemMenuInfo itemRoot;
  
  String menuQuery = getUntrustedStringParameter("slideMenuQuery", "");
  
  if(Util.notEmpty(menuQuery)){
    itemRoot = bookmarkManager.getBookmarkItemInfoRootFromQuery(loggedMember, menuQuery);
  }else{
    itemRoot = bookmarkManager.getBookmarkItemInfoRoot(loggedMember); 
  }
  Collection<MenuInfo> menuInfoList = itemRoot.getChildren();

  Map<Integer, StringBuilder> childrenDepthMap = new HashMap<Integer, StringBuilder>();

  boolean isBookmarked = false;
  Bookmark bookmark = null;
  
  Publication pub = jcmsContext.getPublication();

  if (pub != null) {
    bookmark = bookmarkManager.getBookmarkFromDataId(loggedMember, pub.getId());
  }
  %>
  <% if (Util.notEmpty(menuInfoList)) { %>
    <div class="main-menu list-group is-active" data-bound="bookmark-menu-root">
      <% request.setAttribute("menuInfoList", menuInfoList); %>
      <% request.setAttribute("childrenDepthMap", childrenDepthMap); %>
      <jalios:include jsp="plugins/BookmarksPlugin/jsp/menu/slideMenu.jsp" />
    </div>
    <% for (Map.Entry<Integer, StringBuilder> entry : childrenDepthMap.entrySet()){ %>
      <%= entry.getValue().toString() %>
    <% } %>  
  <% } else { %>
    <div class="topbar-ctxmenu-no-result">
      <jalios:icon src="jcmsplugin-bookmarks-topbar"/>
      <% if (Util.notEmpty(menuQuery)) { %>
        <p><%= glp("jcmsplugin.bookmarks.msg.no-result") %></p>
      <% } else { %>
        <p><%= glp("jcmsplugin.bookmarks.msg.no-result") %></p>
      <% } %>
    </div>
  <% } %>
<% } %>