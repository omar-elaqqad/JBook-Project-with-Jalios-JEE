<%@page import="com.jalios.jcms.uicomponent.topbar.TopbarMenuInfoFilter"%><%
%><%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%><%
%><%@page import="com.jalios.jcms.taglib.menu.MenuInfoFilter"%><%
%><%@page import="com.jalios.jcms.portlet.navigate.CategoryMenuInfo"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ include file='/types/PortletNavigate/doInitPortletNavigate.jspf' %><%

boolean display = rootCategory != null && rootCategory.isNode(loggedMember);
PortalInterface appPortal = PortalManager.getAppPortal();
boolean isAppPortal = appPortal != null && appPortal == portal;

boolean isNavigationOpened = getBooleanParameter("isExpanded", !workspace.isCollaborativeSpace() && !isAppPortal);
boolean isRefreshAfterResize = getBooleanParameter("isRefreshAfterResize", false);

if (!display && box.getHideWhenNoResults()) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}
jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-navigation-menu.css");
if (isNavigationOpened) {
  jcmsContext.addAvoidanceLink("a11y-global-navigation", glp("a11y.avoidance-link.navigation"));
}
int dropDownCounter = Util.toInt(Util.getString(request.getAttribute("dropDownCounter"), ""), 0);
request.setAttribute("dropDownCounter", "" + (dropDownCounter + 1));

int maxDepthLevel = box.getLevels() - 1;
%>
<div class="topbar-navigation-menu-wrapper<%= isNavigationOpened ? " is-expanded" : "" %>" id="a11y-global-navigation">
  <jalios:include target="TOPBAR_NAVIGATE_BEFORE" />
  <nav class="topbar-navigation-menu" aria-label="<%= encodeForHTMLAttribute(glp("ui.topbar.navigation-portlet.main-navigation")) %>" tabindex="-1" role="navigation" >
    <jalios:menu menuResource="topbar" name='<%= "dropdown-" + dropDownCounter %>' maxDepthLevel="<%= maxDepthLevel %>">
      <jalios:include target="TOPBAR_NAVIGATE_START" targetContext="li" />
      <%
      MenuInfoFilter menuInfoFilter = new TopbarMenuInfoFilter(loggedMember, jcmsContext);
      MenuInfo menuInfo = new CategoryMenuInfo(rootCategory, ctxCategories, box.getNavigatePortlet(), maxDepthLevel, -1, null, menuInfoFilter, userLang, loggedMember, request);
      request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
      for (MenuInfo child : menuInfo.getChildren()) {
        if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
          request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
          %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
          request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
        } else {
          %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
        }
      }
      %>
      <jalios:include target="TOPBAR_NAVIGATE_END" targetContext="li" />
    </jalios:menu>
  </nav>
  <jalios:include target="TOPBAR_NAVIGATE_AFTER" />
  <% if (!isNavigationOpened || isRefreshAfterResize) { %>
    <a role="button" tabindex="0" class="topbar-pull-wrapper" title="<%= glp("ui.topbar.navigation-portlet.open-navigation") %>" aria-expanded="false">
      <span class="sr-only"><%= glp("ui.topbar.navigation-portlet.open-navigation") %></span>
      <svg class="topbar-pull" aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 56 23">
        <path class="topbar-pull-shape" d="M48.63,4.38A9.85,9.85,0,0,1,56,0H0A9.85,9.85,0,0,1,7.37,4.38C10.58,9.2,13.11,18,28,18S45.42,9.2,48.63,4.38Z"/>
        <rect class="topbar-pull-handle" width="6px" height="2px" x="29" y="8" rx="1" ry="1" transform="translate(41 -23) rotate(90)"/>
        <rect class="topbar-pull-handle" width="6px" height="2px" x="25" y="8" rx="1" ry="1" transform="translate(37 -19) rotate(90)"/>
        <rect class="topbar-pull-handle" width="6px" height="2px" x="21" y="8" rx="1" ry="1" transform="translate(33 -15) rotate(90)"/>
      </svg>
    </a>
  <% } %>
</div>