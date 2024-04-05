<%@ include file="/jcore/doInitPage.jspf"%>
<%@ include file="/front/app/doAppCommon.jspf" %>
<%@ include file="/jcore/doHeader.jspf"%>
<%
jcmsContext.addJavaScript("plugins/BookmarksPlugin/js/bookmarks.js");
jcmsContext.addCSSHeader("plugins/BookmarksPlugin/css/bookmarks.css");
jcmsContext.addJavaScript("plugins/BookmarksPlugin/js/jquery.ui.touch-punch.js");
request.setAttribute("BOOKMARK_USAGE", "full");
%>
<div class="app app-bookmark has-no-sidebar">
  <div class="app-main">
    <div class="app-header app-header-default">
      <h1><%= glp("jcmsplugin.bookmarks.topbar.title") %></h1>
    </div>
    <div class="app-body app-bookmark-body ajax-refresh-div" data-jalios-ajax-refresh-url="/plugins/BookmarksPlugin/jsp/manageBookmarksAppListView.jsp">
      <jalios:include jsp="plugins/BookmarksPlugin/jsp/manageBookmarksAppListView.jsp" />
    </div>
  </div>
</div>
<%
request.removeAttribute("BOOKMARK_USAGE");
%>

<%@ include file="/jcore/doFooter.jspf"%>