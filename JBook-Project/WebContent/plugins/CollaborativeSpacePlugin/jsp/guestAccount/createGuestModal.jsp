<%--
  @Summary: Guest Account Creation
  @since: csp-4.1
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcmsplugin.collaborativespace.EnrollMembersHandler"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.handler.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

//---------------------------------------------------------------
//
//  Guest Account Contact creation modal
//
//---------------------------------------------------------------

GuestAccountManager manager = GuestAccountManager.getInstance();
boolean canCreate = manager.canCreateGuest(loggedMember, workspace);
boolean canRequest = manager.canRequestGuestCreation(loggedMember, workspace);
if (channel.isDataWriteEnabled() && !(canCreate || canRequest)) {
  sendForbidden(request, response);
  return;
}

//---------------------------------------------------------------
// Parse xml to retrieve the formAuthor
//---------------------------------------------------------------
TypeEntry requestTypeEntry = channel.getTypeEntry(GuestCrea.class);
String formAuthorId = Util.getString(XmlUtil.searchValue(requestTypeEntry.getXmlElement(), "type", "formAuthor"), channel.getDefaultAdmin().getId());
String[] formTitles = JcmsUtil.getLanguageArray(channel.getTypeEntry(GuestCrea.class).getLabelMap());
Workspace hostWorkspace = manager.getRequestHostingWorkspace();

%><jsp:useBean id='enrollHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.EnrollMembersHandler'><%
  %><jsp:setProperty name='enrollHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='enrollHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='enrollHandler' property='noRedirect' value='<%= true %>'/><%
%></jsp:useBean><%

%><jsp:useBean id='guestConvHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.guest.handler.GuestConvHandler'><%
  %><jsp:setProperty name='guestConvHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='guestConvHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='guestConvHandler' property='noRedirect' value='<%= true %>'/><%
  %><jsp:setProperty name='guestConvHandler' property='workspace' value='<%= manager.getRequestHostingWorkspace() %>'/><%
%></jsp:useBean><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.collaborativespace.guest.handler.GuestCreaHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name='formHandler' property='author' value='<%= formAuthorId %>'/><%
  %><jsp:setProperty name='formHandler' property="noRedirect" value="true" /><%
  %><jsp:setProperty name='formHandler' property='title' value='<%= formTitles %>'/><%
  %><jsp:setProperty name='formHandler' property='workspace' value='<%= hostWorkspace %>'/><%
  %><jsp:setProperty name='formHandler' property='enrollHandler' value='<%= enrollHandler %>'/><%
  %><jsp:setProperty name='formHandler' property='guestConvHandler' value='<%= guestConvHandler %>'/><%
%></jsp:useBean><%

boolean canConvertContact = GuestAccountManager.getInstance().canConvertContact(loggedMember, workspace);
boolean canRequestContactConversion = GuestAccountManager.getInstance().canRequestContactConversion(loggedMember, workspace);

//---------------------------------------------------------------
// Detect Workflow Set up
//---------------------------------------------------------------
String titleProp = GuestAccountsConstants.PROPERTY_PREFIX;
if (canCreate) {
  titleProp += ".request-modal.use-with-no-worflow.title";
} else {
  titleProp += ".request-modal.use-with-worflow.title";
}
Member proposedMember = formHandler.getAvailableProposedMember();
if (proposedMember != null) {
  if (proposedMember.isAccount()) {
    // Enroll member
    titleProp = "jcmsplugin.collaborativespace.members.lbl.enroll-members";
  } else {
    // Convert contact
    if (canConvertContact) {
      titleProp = GuestAccountsConstants.PROPERTY_PREFIX + ".request-modal.use-with-no-worflow.title";
    } else if (canRequestContactConversion) {
      titleProp = GuestAccountsConstants.PROPERTY_PREFIX + ".request-modal.use-with-worflow.title";
    }
  }
}


//----------------------------------------------------------------------
// Set optional workspace source to the handler
//---------------------------------------------------------------------- 
Workspace srcWs = getWorkspaceParameter(AbstractGuestHandler.SRC_WORKSPACE_ID_PARAM);
if (srcWs != null) {
  formHandler.setWsSrcId(srcWs.getId());
}

if (formHandler.validate()) {
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><% 
}

int step = formHandler.getFormStep();
int stepCount = formHandler.getFormStepCount();
boolean finish = step == stepCount;
String stepPrefixProp = formHandler.getFormStepPrefixProp();

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-create-guest.css");
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-workspace-group-list.css");
jcmsContext.addJavaScript("plugins/CollaborativeSpacePlugin/js/cs-create-guest-modal.js");
request.setAttribute("formHandler", formHandler);

boolean canSubmitContactConversion =  
  (
    GuestAccountManager.getInstance().canSubmitContactConversion(loggedMember, null)
    || 
    GuestAccountManager.getInstance().canConvertContact(loggedMember, null)
  );

String modalHtmlAttributes = "";
if (canSubmitContactConversion) {
  String transformContactToGuestUrl = "plugins/CollaborativeSpacePlugin/jsp/guestAccount/contactTransform/transformContactModal.jsp";
  modalHtmlAttributes += " data-jalios-csp-transform-contact-to-guest-url=\'" + encodeForHTMLAttribute(transformContactToGuestUrl) + "\'";
}
%>

<jalios:modal title="<%= titleProp %>" 
              url="plugins/CollaborativeSpacePlugin/jsp/guestAccount/createGuestModal.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg guest-account-creation esn"
              picture=""
              htmlAttributes='<%= modalHtmlAttributes %>'
              >
  <%-- Util --%>
  <%@ include file='doWorkspaceGroupList.jspf' %>
  <%-- Step 1 --%>
  <%@ include file='createGuest_check.jspf' %>
  <%-- Step 2 --%>
  <%@ include file='createGuest_propositions.jspf' %>
  <%-- Step 3 --%>
  <%@ include file='createGuest_infos.jspf' %>
  <%-- Step 4 --%>
  <%@ include file='createGuest_workspaces.jspf' %>

  <%-- STEP 5 - request submission success --%>
  <% if (finish) { %>
    <% if (formHandler.isContactConversion() && formHandler.getGuestConv() != null) { %>
      <%
      // If it is a contact conversion, and handler did not redirect to the converted contact
      // it means that a conversion request has been submitted
      %>
      <% loggedMember.removeExtraInfo(GuestAccountsConstants.NEW_TRANSFORM_REQUEST_FLAG); %>
      <jalios:message level='<%= MessageLevel.INFO %>' 
                msg='<%= glp("jcmsplugin.collaborativespace.guestaccounts.transformation-request-controller.create.finish") %>' 
                title='' 
                dismissable='false' />
      
    <% } else { %>
      <jalios:message level='<%= MessageLevel.INFO %>' 
                msg='<%= glp("jcmsplugin.collaborativespace.guestaccounts.creation-request-controller.create.finish") %>' 
                title='' 
                dismissable='false' />
    <% } %>
    <jalios:buffer name='MODAL_BUTTONS'>
      <button type="submit" class="btn btn-primary" name="opClose" data-dismiss="modal" value="true"><%= glp("ui.com.btn.close") %></button>
    </jalios:buffer>
  <% } %>
</jalios:modal>