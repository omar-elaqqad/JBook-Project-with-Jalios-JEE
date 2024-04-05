<%--
  @Summary: Target to filter ESN member profile UI elements
  @since: csp-4.2
--%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

// ----------------------------------------------------------------------
//
// PLUGIN_ESN_PROFILE_TOP to filter esn profile 
//
// ----------------------------------------------------------------------

if (GuestAccountManager.getInstance().isGuestAccount(loggedMember)) {
  request.setAttribute("esn.showContactTab",false);                       // Hide TAB Contacts
  request.setAttribute("esn.showSideColumn.suggestions",false);           // Hide Right Column BOX "Suggestions"
  request.setAttribute("esn.showSideColumn.connections",false);           // Hide Right Column BOX "Others connections"
  request.setAttribute("esn.showSideColumn.common-connections",false);    // Hide Right Column BOX "Common connections"
}
%>