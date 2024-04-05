<%--
  @Summary: Guest Account Edit Member Form hook
  @since: csp-4.1
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@page import="com.jalios.jcms.handler.EditMemberHandler"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.controller.GuestAccountMemberController"%><%

//---------------------------------------------------------------
//
//	EDIT_MBR_MAINTAB_FOOTER TARGET for Guest Accounts feature.
//
//---------------------------------------------------------------

EditMemberHandler formHandler = (EditMemberHandler) request.getAttribute("formHandler");
if (formHandler == null || (!GuestAccountManager.getInstance().isGuestAccount(formHandler.getMember()))) {
  return;
}
%>
<span class='guestRemovalHook hide'>
  <input type="checkbox" name="<%= GuestAccountMemberController.FORCE_GUEST_REMOVAL_PARAM_NAME %>" value="true" />
  <span class='label'><%= glp("jcmsplugin.collaborativespace.guestaccounts.member-controller.guest-group-removal.lbl") %></span>
</span>

<fieldset>
  <legend>
    <jalios:icon src="jcmsplugin-collaborativespace-guest32" /> <%= glp("jcmsplugin.collaborativespace.guestaccounts.guest.label") %>
  </legend>

  <jalios:field name="<%= GuestAccountMemberController.FORCE_GUEST_REMOVAL_PARAM_NAME %>" 
        label="jcmsplugin.collaborativespace.guestaccounts.member-controller.guest-group-removal.lbl"
        css='guestRemovalHook'>
    <jalios:control settings='<%= new EnumerateSettings().checkbox().enumValues("true").enumLabels("jcmsplugin.collaborativespace.guestaccounts.member-controller.guest-group-removal.lbl.h") %>' />
  </jalios:field>
</fieldset>
