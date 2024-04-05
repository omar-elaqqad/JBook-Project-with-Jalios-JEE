<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.jalios.jcmsplugin.blog.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><jalios:include jsp="plugins/BlogPlugin/types/Blog/doBlogFullDisplay_initHandler.jsp" /><%
BlogPostQueryHandler formHandler = (BlogPostQueryHandler) request.getAttribute("blogFormHandler");
if (formHandler == null) {
  return;
}
Blog blog = formHandler.getAvailableBlog();
if (blog == null) {
  return;
}
// Prevent ajax refresh on filter when not being on Blog full display
// Only use ajax on Blog full display for refreshed area availability
BasicSettings textSettings = (BasicSettings) formHandler.getBlogTextSettings();
BasicSettings categoriesSettings = (BasicSettings) formHandler.getBlogCategoriesSettings();
BasicSettings authorSettings = (BasicSettings) formHandler.getBlogAuthorSettings();
BasicSettings startDateSettings = (BasicSettings) formHandler.getBlogStartDateSettings();
BasicSettings endDateSettings = (BasicSettings) formHandler.getBlogEndDateSettings();
BasicSettings pstatusSettings = (BasicSettings) formHandler.getBlogPstatusSettings();
BasicSettings sortSettings = (BasicSettings) formHandler.getBlogSortSettings();
boolean useSidebarAjax = Util.toBoolean(request.getAttribute("blog-use-sidebar-ajax"), true);
if (!useSidebarAjax) {
  for (BasicSettings settings : new BasicSettings[]{
      textSettings,
      categoriesSettings, 
      authorSettings, 
      startDateSettings, 
      endDateSettings, 
      sortSettings,
      pstatusSettings
     }) {
    settings.dataAttribute("jalios-event", "");
    settings.dataAttribute("jalios-action", "");
  }
}
boolean isMemberBlog = blog.isInBlogosphere();
%><jalios:appSidebarSection name="filters" title="ui.app.sidebar-section.filters"><%
  %><% /* FILTER BY TEXT */ %>
  <jalios:field resource="field-light" css="app-sidebar-field">
    <jalios:control settings='<%= textSettings %>' />
    <span class="input-group-btn">
      <button class="btn btn-primary" name="opSearchBlogPost" type="submit" title='<%= encodeForHTMLAttribute(glp("ui.com.btn.search")) %>'><jalios:icon src="app-search"/></button>
      <% if (Util.notEmpty(formHandler.getAvailableBlogText())) { %>
        <button type="button" class="btn btn-default add-on app-search-cancel" data-jalios-action="widget:clear" title='<%= encodeForHTMLAttribute(glp("ui.com.btn.reset")) %>'><jalios:icon src="remove" /></button>
      <% } %>
    </span>
  </jalios:field>

  <% /* FILTER BY CATEGORY */ %>
  <% if (formHandler.displayCategoryFilter()) { %>
  <jalios:field resource="field-vertical" css="app-sidebar-field no-add-field nodnd" value="<%= formHandler.getAvailableBlogCategories() %>">
    <jalios:control settings='<%= categoriesSettings %>' />
  </jalios:field>
  <% } %>

  <% /* FILTER BY AUTHOR */ %>
  <% if (!isMemberBlog) { %>
  <jalios:field resource="field-vertical" css="app-sidebar-field">
    <jalios:control settings='<%= authorSettings%>' />
  </jalios:field>
  <% } %>

  <% /* FILTER BY START/END DATE */ %>
  <jalios:field resource="field-vertical" css="app-sidebar-field">
    <jalios:control settings='<%= startDateSettings %>' />
  </jalios:field>
  <jalios:field resource="field-vertical" css="app-sidebar-field">
    <jalios:control settings='<%= endDateSettings %>' />
  </jalios:field>

  <% /* FILTER BY PSTATUS */ %>
  <% if (formHandler.allowPStatusFilter()) {
    %><jalios:field resource="field-vertical" css="app-sidebar-field pstatus-filter" value="<%= formHandler.getAvailablePStatus() %>" mv="-1"><%
      %><jalios:control settings="<%= pstatusSettings %>" /><%
    %></jalios:field><%
  } %>

  <% /* SORT OPTION  */ %>
  <div class="app-sidebar-section-title"><%= glp("ui.sort-by") %></div>
  <jalios:field resource="field-vertical" css="app-sidebar-field">
    <jalios:control settings='<%= sortSettings %>' />
  </jalios:field>
  <%
%></jalios:appSidebarSection><%
%>