<%--
  @Summary: Guest Account from Contact transform target
  @since: csp-4.1
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

// ----------------------------------------------------------------------
//
// PLUGIN_ESN_PROFILE_ACTION TARGET for Guest Accounts feature.
//
// ----------------------------------------------------------------------

Member contact = (Member) request.getAttribute("jcmsplugin.esn.member");
if (contact == null) {
  return;
}

// ----------------------------------------------------------------------
// Checks rights / conditions
// ----------------------------------------------------------------------
GuestAccountManager manager = GuestAccountManager.getInstance();
// Do not pass any contextual workspace, to allow conversion from a non collaborative Space workspace.
boolean printTarget = manager.canSubmitContactConversion(loggedMember, null);
if ( ! printTarget) { 
  return;
}

String link = manager.getTransformContactModalUrl(workspace, contact);
if (Util.isEmpty(link)) {
  // No contact means no link.
  return;
}
String label = glp(GuestAccountsConstants.PROPERTY_PREFIX + ".contact-transformation.member-profile-target.label");
%>
<li><a class="modal" href='<%= link %>' onclick='return false;'><%= label %></a></li>