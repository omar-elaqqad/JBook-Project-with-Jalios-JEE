<%@page import="com.jalios.jcms.handler.QueryHandler"%>
<%@ include file="/jcore/doInitPage.jspf"%>
<%@ page import="com.jalios.jcmsplugin.bookmarks.*"%>

<jsp:useBean id='bookmarkHandler' scope='page' class='com.jalios.jcmsplugin.bookmarks.BookmarkHandler'>
  <jsp:setProperty name='bookmarkHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='bookmarkHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='bookmarkHandler' property='*' />
  <jsp:setProperty name='bookmarkHandler' property='noRedirect' value='<%= true%>' />
</jsp:useBean>

<%
if (!isLogged) {
  return;
}

bookmarkHandler.validate();
%>
<jalios:javascript>
  jQuery('.bookmark-menu.slide-wrapper').refresh();
</jalios:javascript>