<%@page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler"%><%
%><%@page import="com.jalios.jcms.uicomponent.sidebar.MemberSidebarTab"%><%
%><%@page import="com.jalios.jcms.uicomponent.sidebar.SidebarHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

SidebarHandler handler = (SidebarHandler) request.getAttribute("jcms.sidebar.formHandler");
MemberSidebarTab tab = (MemberSidebarTab) request.getAttribute("jcms.sidebar.tab");
if (handler == null || tab == null) {
  return;
}

final Set<Member> delegationHolderSet = DelegationAuthenticationHandler.getInstance().getDelegationHolderSet(loggedMember);
if (Util.isEmpty(delegationHolderSet)) {
  return;
}

%>
<%@ include file='/jcore/sidebar/doSidebarTab.jspf' %>