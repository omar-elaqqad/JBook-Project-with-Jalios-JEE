<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
String title = getIncludeString("title", null);
String icon = getIncludeString("icon", null);
String url = getIncludeString("url", null);
String css = getIncludeString("css", "");
String name = getIncludeString("name", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
String titleHtmlAttributes = getIncludeString("titleHtmlAttributes", "");

boolean collapsable = (boolean) getIncludeObject("collapsable", false);
boolean collapsed = (boolean) getIncludeObject("collapsed", false);
css += collapsable ? " is-collapsable" : "";

String dataAttribute = getIncludeString("dataAttribute", null);
String uniqueTitleId = (String) request.getAttribute("sidebarSectionTitleId");
String uniqueId = (String) request.getAttribute("sidebarSectionId");
String ariaLabelledByAttribute = Util.notEmpty(title) ? "aria-labelledby=\"" + uniqueTitleId + "\"" : "";
%>
<div class="app-sidebar-section app-sidebar-section-<%= name %> <%= css %>" <%= htmlAttributes %> role="group" <%= ariaLabelledByAttribute %>>
  <jalios:buffer name="sectionTitleContent">
    <%= getIncludeString("APP_SIDEBAR_SECTION_TITLE_START", "") %><% if (Util.notEmpty(icon)) { %><jalios:icon src="<%= icon %>" /> <% } %><%= encodeForHTMLAttribute(glp(title)) %><%= getIncludeString("APP_SIDEBAR_SECTION_TITLE_END", "") %>
  </jalios:buffer>
  <% if (Util.isEmpty(title)) { %>
    <%= getIncludeBody() %>
  <% } else if (Util.notEmpty(url) || Util.notEmpty(dataAttribute)) { %>
    <div class="app-sidebar-section-title">
      <%= getIncludeString("APP_SIDEBAR_SECTION_TITLE_LINK_START", "") %>
      <a class="" id="<%= uniqueTitleId %>" <%= titleHtmlAttributes %> href="<%= url %>" <%= dataAttribute %>><h2><%= sectionTitleContent %></h2></a>
      <%= getIncludeString("APP_SIDEBAR_SECTION_TITLE_LINK_END", "") %>
    </div>
    <%= getIncludeBody() %>
  <% } else if (collapsable) { %>
    <div class="app-sidebar-section-title">
      <%= getIncludeString("APP_SIDEBAR_SECTION_TITLE_LINK_START", "") %>
      <a <%= titleHtmlAttributes %> id="<%= uniqueTitleId %>" data-toggle="collapse" data-target="#<%= uniqueId %>" aria-expanded="<%= collapsed ? "false" : "true" %>" aria-controls="<%= uniqueId %>" role="button" tabindex="0" class="<%= collapsed ? "collapsed" : "" %>"><h2><%= sectionTitleContent %> <jalios:icon src="caret"/></h2></a>
      <%= getIncludeString("APP_SIDEBAR_SECTION_TITLE_LINK_END", "") %>
    </div>
    <div id="<%= uniqueId %>" class="collapsable-content <%= collapsed ? "collapse" : "collapse in" %>">
      <%= getIncludeBody() %>
    </div>
  <% } else { %>
    <h2 class="app-sidebar-section-title" id="<%= uniqueTitleId %>" <%= titleHtmlAttributes %>><%= sectionTitleContent %></h2>
    <%= getIncludeBody() %>
  <% } %>
</div><%
request.removeAttribute("sidebarSectionId");
request.removeAttribute("sidebarSectionTitleId");
%>