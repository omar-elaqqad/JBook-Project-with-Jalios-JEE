<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
String buttonName = getIncludeString("buttonName", "opSearch");
String placeholder = getIncludeString("placeholder", "ui.com.placeholder.search");
String inputCss = getIncludeString("inputCss", "");
boolean ajaxRefresh = (boolean) getIncludeObject("ajaxRefresh", true);
String label = getIncludeString("label", "ui.com.btn.search");
String value = getIncludeString("value", "");
String fieldCss = getIncludeString("fieldCss", "");
String inputName = getIncludeString("inputName", "text");

inputCss = inputCss + " no-focus app-search-field";
fieldCss = fieldCss + "app-sidebar-field";

// AppSidebarSection values 
String title = getIncludeString("title", null);
String icon = getIncludeString("icon", null);
String url = getIncludeString("url", null);
String css = getIncludeString("css", "");
css += " app-sidebar-section-search";

String htmlAttributes = getIncludeString("htmlAttributes", "");
String titleHtmlAttributes = getIncludeString("titleHtmlAttributes", "");
boolean collapsable = (boolean) getIncludeObject("collapsable", false);
boolean collapsed = (boolean) getIncludeObject("collapsed", false);
DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);

String controlLabel = glp(label);
%>
<jalios:appSidebarSection name="search" collapsable="<%= collapsable %>" collapsed="<%= collapsed %>" css="<%= css %>" dataAttribute="<%= dataAttribute %>" htmlAttributes="<%= htmlAttributes %>" icon="<%= icon %>" title="<%= title %>" titleHtmlAttributes="<%= titleHtmlAttributes %>" url="<%= url %>">
  <jalios:field name='<%= inputName %>' value="<%= value %>" resource="field-app" css="<%= css %>">
    <jalios:control settings='<%= new TextFieldSettings().title(placeholder).placeholder(placeholder).css(inputCss).htmlAttributes(htmlAttributes).aria("label", glp(placeholder)) %>' />
    <span class="input-group-btn">
      <button aria-label="<%= glp("ui.com.btn.search") %>" value="true" class="btn btn-primary app-search-submit" name="<%= buttonName %>" type="submit" <%= ajaxRefresh ? "data-jalios-action=\"ajax-refresh\"" : "" %>><jalios:icon src="app-search"/></button>
      <% if (Util.notEmpty(value)) { %>
        <button type="button" class="btn btn-default add-on js-search-cancel" title='<%= glp("ui.com.btn.reset") %>'><jalios:icon src="remove" /></button>
      <% } %>
    </span>
  </jalios:field>
</jalios:appSidebarSection>