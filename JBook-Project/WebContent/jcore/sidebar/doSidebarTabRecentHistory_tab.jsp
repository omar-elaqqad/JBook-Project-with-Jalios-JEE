<%@page import="com.jalios.jcms.recenthistory.RecentHistoryManager"%>
<%@page import="com.jalios.jcms.uicomponent.sidebar.MemberSidebarTab"%>
<%@page import="com.jalios.jcms.uicomponent.sidebar.SidebarHandler"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
SidebarHandler handler = (SidebarHandler) request.getAttribute("jcms.sidebar.formHandler");
MemberSidebarTab tab = (MemberSidebarTab) request.getAttribute("jcms.sidebar.tab");
if (handler == null || tab == null) {
  return;
}

if (!isLogged) {
  return;
}

if (!RecentHistoryManager.getInstance().isRecentHistoryEnabled()) {
  return;
}
%>
<%@ include file='/jcore/sidebar/doSidebarTab.jspf' %>