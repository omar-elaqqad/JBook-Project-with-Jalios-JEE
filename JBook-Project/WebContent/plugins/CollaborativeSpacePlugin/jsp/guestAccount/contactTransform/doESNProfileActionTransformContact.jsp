<%--
  @Summary: Guest Account from Contact transform target
  @since: csp-7.2
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

// ----------------------------------------------------------------------
//
// ESN Profile action menu TARGET for Guest Accounts feature.
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
boolean dataWriteEnabled = channel.isDataWriteEnabled();
boolean showAction = dataWriteEnabled && manager.canSubmitContactConversion(loggedMember, null);
if (!showAction) { 
  return;
}

String link = manager.getTransformContactModalUrl(workspace, contact);
if (Util.isEmpty(link)) {
  // No contact means no link.
  return;
}
String actionLabel = glp(GuestAccountsConstants.PROPERTY_PREFIX + ".contact-transformation.member-profile-target.label");
%>
<a class="esn-profile-action esn-profile-action-convert-contact-to-guest modal" href='<%= link %>' onclick='return false;'><%
  %><%= actionLabel %><%
%></a>