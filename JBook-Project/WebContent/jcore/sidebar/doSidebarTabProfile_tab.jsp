<%@page import="com.jalios.jcms.uicomponent.sidebar.MemberSidebarTab"%><%
%><%@page import="com.jalios.jcms.uicomponent.sidebar.SidebarHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

SidebarHandler handler = (SidebarHandler) request.getAttribute("jcms.sidebar.formHandler");
MemberSidebarTab tab = (MemberSidebarTab) request.getAttribute("jcms.sidebar.tab");
if (handler == null || tab == null) {
  return;
}

if (!isLogged) {
  return;
}
jcmsContext.addCSSHeader("css/jalios/core/components/sidebar/jalios-sidebar-profile.css");
%>
<%@ include file='/jcore/sidebar/doSidebarTab.jspf' %>