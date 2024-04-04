<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<%
String id = getIncludeString("id", null);
String name = getIncludeString("name", null);
String css = getIncludeString("css", null);
String menuResource = getIncludeString("menuResource", null);
int maxDepthLevel = (int) getIncludeObject("maxDepthLevel", -1);
MenuInfo menuInfo = (MenuInfo) getIncludeObject("menuInfo", null);
boolean displayMenuInfoRoot = (boolean) getIncludeObject("displayMenuInfoRoot", false);
String resource = getIncludeString("resource", null);
%>
<jalios:menu id="<%= id %>" name="<%= name %>" css="<%= css %>" maxDepthLevel="<%= maxDepthLevel %>" menuResource="<%= menuResource %>" resource="<%= resource %>">
  <%
  request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
  if(displayMenuInfoRoot) {
    %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
  } else {
    Collection<MenuInfo> children = menuInfo.getChildren();
    if (children != null) {
      for (MenuInfo child : children) {
        if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
          request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
          %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
          request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
        } else {
          %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" depthLevel="<%= child.getDepthLevel() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
        }
      }
    }
  }
  request.removeAttribute(MenuInfo.MENU_INFO_ATTR);
  %>
</jalios:menu>