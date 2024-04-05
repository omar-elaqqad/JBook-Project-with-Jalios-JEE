<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcmsplugin.bookmarks.*, com.jalios.jcms.handler.QueryHandler" %><%
%><% 
if (!isLogged) { 
  return;
}

jcmsContext.addJavaScript("plugins/BookmarksPlugin/js/bookmarks.js");
jcmsContext.addCSSHeader("plugins/BookmarksPlugin/css/bookmarks.css"); 
QueryHandler qh = (QueryHandler)request.getAttribute("query.queryHandler");
if (qh == null) {
  return;
}
String qs = ServletUtil.encodeURL(qh.getQueryString());
String title = qh.getText();
if (title == null) {
  title = qh.getDescription(userLang).replaceAll("\"", "");
}
title = glp("ui.work.query.txt.search") + " " + title;

%>
<li>
<a role="button" tabindex="0" data-jalios-action="modal" data-jalios-modal-url="plugins/BookmarksPlugin/jsp/bookmarkItemsActionModal.jsp?<%=BookmarkConstants.PARAMETER_BOOKMARK_TITLE%>=<%=ServletUtil.encodeURL(title)%>&amp;qs=<%=qs%>&amp;<%=BookmarkConstants.PARAMETER_BOOKMARK_ITEM_ACTION_MODAL%>=<%=BookmarkConstants.BOOKMARK_ITEM_ACTIONS.ADD_SEARCH%>" >
  <jalios:icon src="jcmsplugin-bookmarks-add"/> <%= glp("jcmsplugin.bookmarks.lbl.add-bookmark") %>
</a>