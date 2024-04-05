<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%><% 
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%
SmartPhonePortalManager manager = SmartPhonePortalManager.getInstance();
Set<SmartPhonePortal> portals = (Set<SmartPhonePortal>) request.getAttribute("smartphone.member-menu.navigate.portals");
List<Workspace> favWorkspaces = (List<Workspace>) request.getAttribute("smartphone.member-menu.navigate.favWorkspaces");

if (Util.getSize(portals) <= 1 && Util.getSize(favWorkspaces) <= 1) {
  return;
}
%>
<jalios:list resource="jmobile-list" css="topbar-menu-navigate">
  <% for (SmartPhonePortal portal : portals) { %>
    <jalios:dataListItem icon="smartphone-topbar-home" css="js-close-mbr-menu" link="<%= SmartPhoneManager.getInstance().getDataUrl(portal) %>" data="<%= portal %>" template="jmobile" />
  <% } %>
  <% for (Workspace itWorkspace : favWorkspaces) { %>
    <jalios:dataListItem css="js-close-mbr-menu" data="<%= itWorkspace %>" template="jmobile" />
  <% } %>
</jalios:list>
<a class="ui-btn margin-content" href="plugins/SmartPhonePlugin/jsp/service/workspace/workspace.jsp"><%= glp("jcmsplugin.smartphone.lbl.access-all-spaces") %></a>