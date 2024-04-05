<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%@ page import="com.jalios.jcmsplugin.bookmarks.*"%>
<%

if (!isLogged) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}
request.setAttribute("BOOKMARK_USAGE", "box");
PortletBookmarks obj = (PortletBookmarks)portlet;
if(obj != null){
  request.setAttribute("BOOKMARK_PORTLET", obj);
}
%>
<jalios:include
  jsp="plugins/BookmarksPlugin/jsp/manageBookmarksListView.jsp" />
<%
request.removeAttribute("BOOKMARK_USAGE");
%>
