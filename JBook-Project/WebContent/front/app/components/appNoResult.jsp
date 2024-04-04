<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
String text = getIncludeString("text", "ui.com.lbl.sorry-no-result");
String icon = getIncludeString("icon", "app.no-result");
%>
<div class="app-no-results">
  <%= getIncludeString("APP_BODY_NORESULT_CONTENT_TOP", "") %>
  <jalios:icon css="app-no-result-icon" src="<%= icon %>" />
  <p><%= glp(text) %></p>
  <%= getIncludeString("APP_BODY_NORESULT_CONTENT_BOTTOM", "") %>
</div>