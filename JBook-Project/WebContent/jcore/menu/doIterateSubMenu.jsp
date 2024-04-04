<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

MenuInfo menuInfo = (MenuInfo) request.getAttribute(MenuInfo.MENU_INFO_ATTR); %>
<jalios:submenu id="<%= menuInfo.getId() %>" label="<%= menuInfo.getLabel() %>" link="<%= menuInfo.getLink() %>" icon="<%= menuInfo.getIcon() %>" depthLevel="<%= menuInfo.getDepthLevel() %>" maxDepthLevel="<%= menuInfo.getMaxDepthLevel() %>" active="<%= menuInfo.isActive() %>" parentId="<%= menuInfo.getParent() != null ? menuInfo.getParent().getId() : null %>" htmlAttributes="<%= menuInfo.getHtmlAttributes() %>">
  <%
  Collection<MenuInfo> children = menuInfo.getChildren();
  if (children != null) {
    for (MenuInfo child : children) {
      if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
        %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
      } else {
        %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" icon="<%= child.getIcon() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
      }
    }
  }
%></jalios:submenu>