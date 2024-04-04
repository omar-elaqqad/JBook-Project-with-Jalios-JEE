<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
String icon = getIncludeString("icon", null);
String iconTitleProp = getIncludeString("iconTitleProp", null);
String appUrl = getIncludeString("appUrl", null);
String formAction = getIncludeString("formAction", null);
String formCss = getIncludeString("formCss", "");
String css = getIncludeString("css", "");

if (jcmsContext.isPrintView()) {
  return;
}
%>
<%-- SIDEBAR --%>
<div role="region" class="app-sidebar <%= css %>" aria-label="<%= glp("ui.app.main-navigation.aria-label") %>">
  <% if (Util.notEmpty(formAction)) { %>
    <form class="<%= formCss %>" action="<%= formAction %>">
  <% } %>
  <% if (!inFO || !workspace.isCollaborativeSpace()) { %>
    <div class="app-sidebar-icon">
      <% if (appUrl != null) { %>
      <a href="<%= appUrl %>" title="<%= encodeForHTMLAttribute(glp(iconTitleProp)) %>">
      <% } %>
        <jalios:icon src="<%= icon %>" alt="<%= iconTitleProp %>" />
      <% if (appUrl != null) { %>
      </a>
      <% } %>
    </div>
  <% } %>
  <%= getIncludeBody() %>
  <% if (Util.notEmpty(formAction)) { %>
    </form>
  <% } %>
</div>