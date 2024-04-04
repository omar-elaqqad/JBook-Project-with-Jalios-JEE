<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
String name = getIncludeString("name", null);
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
String dataAttribute = getIncludeString("dataAttribute", "");

boolean collapsable = Util.toBoolean(request.getAttribute(AppConstants.COLLAPSABLE_SIDEBAR_REQUEST_ATTR), false);
boolean collapsed = Util.toBoolean(request.getAttribute(AppConstants.COLLAPSED_SIDEBAR_REQUEST_ATTR), false);

request.setAttribute("jcms.application.name", name);

if (collapsable) {
  css += " is-toggleable-app";
  if (collapsed) {
    css += " is-sidebar-folded";
  }
}
%>
<% if (!(displayPortal instanceof JPortal)) { %>
  <main role="main" class="app app-<%= name %> <%= css %>" <%= htmlAttributes %> <%= dataAttribute %>>
    <%= getIncludeBody() %>
  </main>
<% } else { %>
  <div class="app app-<%= name %> <%= css %>" <%= htmlAttributes %> <%= dataAttribute %>>
    <%= getIncludeBody() %>
  </div>
<% } %>