<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
String css = getIncludeString("css", "");
String bodyCss = getIncludeString("bodyCss", "");
String headerTitle = getIncludeString("headerTitle", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
String dataAttribute = getIncludeString("dataAttribute", null);
String appHeaderBottom = getIncludeString("APP_HEADER_BOTTOM", "");
boolean collapsable = Util.toBoolean(request.getAttribute(AppConstants.COLLAPSABLE_SIDEBAR_REQUEST_ATTR), false);
request.setAttribute("isAppDisplayed", true);
%>
<section class="app-main <%= bodyCss %>">
  <% if(collapsable) { %>
    <%@ include file="/front/app/doAppSidebarToggler.jspf" %>
  <% } %>
  <%= getIncludeString("APP_MAIN_TOP", "") %>
  <% if (!jcmsContext.isPrintView()) { %>
    <header class="app-header">
      <%= getIncludeString("APP_HEADER_TOP", "") %>
      <% if (Util.notEmpty(headerTitle) && !workspace.isCollaborativeSpace()) { %>
        <h1><%= glp(headerTitle) %></h1>
      <% } %>
      <%= getIncludeString("APP_HEADER_BOTTOM", "") %>
    </header>
  <% } %>
  <div class="app-body <%= bodyCss %>">
    <% String customBodyContent = getIncludeString("APP_MAIN_CONTENT", ""); %>
    <% if (Util.isEmpty(customBodyContent)) { %>
      <div class="app-body-content">
        <%= getIncludeBody() %>
      </div>
    <% } else { %>
      <%= customBodyContent %>
    <% } %>
  </div>
  <%= getIncludeString("APP_MAIN_BOTTOM", "") %>
</section>