<%--
  @Summary: Guest Account
  @since: csp-4.1
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%

//---------------------------------------------------------------
//
//	EMPTY_HEADER_START TARGET for Guest Accounts feature.
//
//---------------------------------------------------------------

GuestAccountManager manager = GuestAccountManager.getInstance();
boolean isGuestAccount = manager.isGuestAccount(loggedMember);

if (inFO) {
  
  //---------------------------------------------------------------
  //  Custom CSS for Guest Accounts Feature
  //---------------------------------------------------------------
  jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-guest.css");

  //---------------------------------------------------------------
  //  LoggedMember = GUEST ?
  //---------------------------------------------------------------
  if (isGuestAccount) {
    //  Mark <body> as Guest
    String bodyClass = Util.getString(jcmsContext.getBodyAttributes().get("class"), "");
    bodyClass += " guest-account";
    
    Member deletegateMember = channel.getCurrentDelegateMember();
    if (deletegateMember!= null && deletegateMember.isAdmin() && getBooleanParameter("debug", false)) {
      bodyClass += " admin-delegation";
    }
    jcmsContext.addBodyAttributes("class", bodyClass);
  }
}

if (isLogged) {
  //---------------------------------------------------------------
  //  Show success message modal ?
  //---------------------------------------------------------------
  jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-guest.css");
  
  boolean isCreation      = Util.toBoolean(loggedMember.getExtraInfo(GuestAccountsConstants.NEW_CREATION_GUEST_FLAG), false);
  boolean isConversion    = Util.toBoolean(loggedMember.getExtraInfo(GuestAccountsConstants.NEW_TRANSFORMED_GUEST_FLAG), false);
  boolean accountSuccess  = isCreation || isConversion;

  if (accountSuccess) {
    String guestId = "";
    if (isCreation) {
      guestId = (String) loggedMember.getExtraInfo(GuestAccountsConstants.CREATED_GUEST_ID_FLAG);
    } else if (isConversion) {
      guestId = (String) loggedMember.getExtraInfo(GuestAccountsConstants.CONVERTED_CONTACT_ID_FLAG);
    }
    // Prevent duplicate success modal in Back Office Form / workflow page (IFRAME)
    loggedMember.removeExtraInfo(GuestAccountsConstants.NEW_CREATION_GUEST_FLAG);
    loggedMember.removeExtraInfo(GuestAccountsConstants.NEW_TRANSFORMED_GUEST_FLAG);
    if (Util.notEmpty(guestId) && isConversion) {
      String successJsp = "plugins/CollaborativeSpacePlugin/jsp/guestAccount/guestAccountSuccess.jsp";
      %><jalios:javascript>JCMS.window.Modal.showJSP("<%= successJsp %>?<%= isCreation ? "createdGuestId" : "convertedGuestId" %>=<%= guestId %>");</jalios:javascript><%
    }
  }
}
%>