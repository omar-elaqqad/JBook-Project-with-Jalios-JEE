<%@ include file="/jcore/doInitPage.jspf" %><%
List<BreadcrumbItem> items = (List<BreadcrumbItem>) getIncludeObject("items", null);
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);

if (Util.isEmpty(items)) {
  return;
}

jcmsContext.addCSSHeader("css/jalios/core/components/breadcrumb/jalios-breadcrumb.css");
%>
<nav class="breadcrumb-nav <%= css %>" <%= dataAttribute != null ? dataAttribute : "" %> <%= htmlAttributes %>>
  <%= getIncludeString("BREADCRUMB_START", "") %>
  <% for (BreadcrumbItem item : items) { %>
    <a href="<%= item.getUrl() %>" <%= item.getHtmlAttributes() %> <%= item.getAttributes() != null ? item.getAttributes() : "" %> class="breadcrumb-item <%= item.getCss() %>" <%= item.isActive() ? "aria-current=\"page\"" : "" %>><%= item.getPrepend() %><span class="breadcrumb-item-label <%= item.getLabelCss() %>"><%= glp(item.getLabel()) %></span><%= item.getAppend() %></a>
  <% } %>
  <%= getIncludeString("BREADCRUMB_END", "") %>
</nav>