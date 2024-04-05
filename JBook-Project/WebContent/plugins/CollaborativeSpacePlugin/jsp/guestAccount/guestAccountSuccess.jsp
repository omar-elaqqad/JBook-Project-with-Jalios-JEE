<%--
  @Summary: Guest Account Success Modal
  @since: csp-4.1
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
    This JSP is expected to be called only when Guest initialisation is processed.
      (ie. a Member create or update operation)
    In case of Guest initialisation request, the success message for submitter 
      is handled by Initialization Handler's modal.
--%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (!isLogged) {
  return;
}
Member createdGuest     = getMemberParameter("createdGuestId");
Member convertedGuest   = getMemberParameter("convertedGuestId");
boolean isCreation      = createdGuest != null;
boolean isConversion    = convertedGuest != null;
boolean accountSuccess  = isCreation || isConversion;

String message = "";

//---------------------------------------------------------------
//  Detect Workflow Set up
//---------------------------------------------------------------
String I18NPrefix = GuestAccountsConstants.PROPERTY_PREFIX;
String titleProp = I18NPrefix;
if (accountSuccess) {
  titleProp += ".request-modal.use-with-no-worflow.title";
} else {
  titleProp += ".request-modal.use-with-worflow.title";
}

//---------------------------------------------------------------
//  Contact Conversion
//---------------------------------------------------------------
if (isConversion) {
  String guestUrl = JcmsUtil.getDisplayUrl(convertedGuest, userLocale);
  message = JcmsUtil.glp(userLang, I18NPrefix + ".transformation-request-controller.account-transformation-success", guestUrl, convertedGuest.getFullName());
}
%>
<jalios:modal title="<%= titleProp %>" 
              url="plugins/CollaborativeSpacePlugin/jsp/guestAccount/guestAccountSuccess.jsp" 
              css="modal-lg"
              picture="plugins/CollaborativeSpacePlugin/images/checkmark.gif">

  <% if (Util.notEmpty(message)) { %>
    <p><%= message %></p>
  <% } %>

</jalios:modal>