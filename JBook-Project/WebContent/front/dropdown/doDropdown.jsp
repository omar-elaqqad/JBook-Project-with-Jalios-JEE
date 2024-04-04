<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%><%
%><%@page import="com.jalios.jcms.uicomponent.linkitems.UILinkItem"%><%
%><%@page import="com.jalios.jcms.uicomponent.linkitems.UILinkItemsUtils"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
String triggerLabel = glp(getIncludeString("triggerLabel", ""), "");
String triggerIcon = getIncludeString("triggerIcon", "");
String triggerIconAlt = getIncludeString("triggerIconAlt", "");
String triggerCss = getIncludeString("triggerCss", "");
String triggerTitle = glp(getIncludeString("triggerTitle", ""), "");

String wrapperCss = getIncludeString("wrapperCss", "");
String wrapperTag = getIncludeString("wrapperTag", "");
String wrapperHtmlAttributes = getIncludeString("wrapperHtmlAttributes", "");
String triggerTag = getIncludeString("triggerTag", "");

String menuCss = getIncludeString("menuCss", "");

String triggerHtmlAttributes = getIncludeString("triggerHtmlAttributes", "");
DataAttribute triggerDataAttribute = (DataAttribute) getIncludeObject("triggerDataAttribute", null);
DataAttribute menuDataAttribute = (DataAttribute) getIncludeObject("triggerDataAttribute", null);

// Properties iteration
String itemsPropPrefix = getIncludeString("itemsPropPrefix", "");
Class dataClass = (Class) getIncludeObject("dataClass", null);
Class stopSuperClass = (Class) getIncludeObject("stopSuperClass", null);

//Properties iteration context
Data data = (Data) getIncludeObject("data", null);
Workspace itemsWorkspace = (Workspace) getIncludeObject("itemsWorkspace", workspace);

Set<UILinkItem> items = new HashSet<UILinkItem>();
if (Util.notEmpty(itemsPropPrefix)) {
  if (dataClass != null) {
    items = UILinkItemsUtils.getLinkItems(dataClass, stopSuperClass, itemsPropPrefix, workspace, loggedMember, jcmsContext, data);
  } else {
    items = UILinkItemsUtils.getLinkItems(itemsPropPrefix, workspace, loggedMember, jcmsContext, data);
  }
}
String dropdownMenuUniqueId = getIncludeString("dropdownId", ServletUtil.generateUniqueDOMId(request, "dropdown"));
%><% 
%><jalios:buffer name="dropdownActions" trim="true">
  <% request.setAttribute("buttonType", ButtonType.A); %>
  <% if (Util.notEmpty(getIncludeString("DROPDOWN_MENU_TOP", null))) { %><%
    %><%= getIncludeString("DROPDOWN_MENU_TOP", null) %><% 
  %><% } %><%
  %><% if (Util.notEmpty(items)) { %>
    <% for (UILinkItem action : items) { %>
      <% if (action.hasDividerBefore()) { %><li class="divider"></li><% } %>
      <% if (Util.notEmpty(action.getHtml())) { %>
        <%= action.getHtml() %>
      <% } else { %>
        <li class="<%= action.getWrapperCss() %>">
          <jalios:button button="<%= action.getButton() %>"/>
        </li>
      <% } %>
      <% if (action.hasDividerAfter()) { %><li class="divider"></li><% } %>
    <% } %>
  <% } %><%
  %><%= getIncludeBody() %>
  <% request.removeAttribute("buttonType"); %>
</jalios:buffer><%
%><% if (Util.isEmpty(dropdownActions)) {
  return;
} %>
<<%= wrapperTag %> class="dropdown <%= wrapperCss %>" <%= wrapperHtmlAttributes %>>
  <<%= triggerTag %> 
    <% if (Util.notEmpty(triggerTitle)) { %>aria-label="<%= triggerTitle %>" title="<%= triggerTitle %>"<% } %>
     <% if (triggerTag.equals("button")) { %>type="button" tabindex="0" <% } else if (triggerTag.equals("a")) { %> role="button" <% } %>
     <%= triggerHtmlAttributes %>
     <%= triggerDataAttribute != null ? triggerDataAttribute : "" %>
     class="<%= triggerCss %> dropdown-toggle" 
     id="<%= dropdownMenuUniqueId %>" 
     data-toggle="dropdown">
    <% if (Util.notEmpty(triggerIcon)) { %><jalios:icon src="<%= triggerIcon %>" alt="<%= triggerIconAlt %>" /><% } %> <%= triggerLabel %>
  </<%= triggerTag %>>
  <ul class="dropdown-menu" <%= menuDataAttribute != null ? menuDataAttribute : "" %> aria-labelledby="<%= dropdownMenuUniqueId %>">
    <%= dropdownActions %>
  </ul>
</<%= wrapperTag %>>