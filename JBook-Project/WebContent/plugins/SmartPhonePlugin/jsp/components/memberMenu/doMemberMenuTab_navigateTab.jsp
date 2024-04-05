<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneMemberMenuDisplayHandler"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneMemberMenuManager.MemberMenuItem"%><%
%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><% 
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
SmartPhonePortalManager manager = SmartPhonePortalManager.getInstance();
Set<SmartPhonePortal> portals = manager.getMainNavigationPortals(loggedMember);
SmartPhoneMemberMenuDisplayHandler memberMenuHandler = (SmartPhoneMemberMenuDisplayHandler) request.getAttribute("smartphone.membermenu.handler");
List<Workspace> favWorkspaces = FavoriteWorkspaceManager.getInstance().get(loggedMember);

if (Util.getSize(portals) <= 1 && Util.getSize(favWorkspaces) <= 1) {
  return;
}
request.setAttribute("smartphone.member-menu.navigate.portals", portals);
request.setAttribute("smartphone.member-menu.navigate.favWorkspaces", favWorkspaces);
%>
<% MemberMenuItem item = (MemberMenuItem) request.getAttribute("smartphone.mbrmenuitem.item"); %>
<li role="presentation" class="<%= memberMenuHandler.isActiveTab(item) ? "active" : "" %>">
  <a href="#<%= item.getName() %>" aria-controls="<%= item.getName() %>" role="tab" data-toggle="tab">
    <jalios:icon src="<%= item.getIcon() %>" />
    <span><%= item.getLabel(userLang) %></span>
  </a>
</li>