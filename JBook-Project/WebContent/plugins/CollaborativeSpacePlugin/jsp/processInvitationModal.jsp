<%--
  @Summary: CS Invitation Modal processing
  @Category: Plugin
  @Author: Sylvain Devaux
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: False
  @Deprecated: False
  @Since: csp-5.1
--%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

CSManager csMgr               = CSManager.getInstance();
String acceptParam            = "opAccept";
String declineParam           = "opDecline";

// Retrieve the invitation
CSInvitation invitation       = Util.getFirst(csMgr.getInvitationList(workspace, CSInvitation.PENDING, loggedMember));
  
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.ProcessInvitationHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%>  <jsp:setProperty name='formHandler' property='noSendRedirect' value='true' /><%--
--%>  <jsp:setProperty name='formHandler' property='invitation' value='<%= invitation.getId() %>' /><%--
--%></jsp:useBean><%

String prefixURL    = "plugins/CollaborativeSpacePlugin/jsp/processInvitation.jsp?invitation=" + invitation.getId() + "&amp;";
String acceptURL    = prefixURL + "status=" + CSInvitation.ACCEPTED;
String declineURL   = prefixURL + "status=" + CSInvitation.DECLINED;

boolean opAccept    = HttpUtil.hasParameter(request, acceptParam);
boolean opDecline   = HttpUtil.hasParameter(request, declineParam);
boolean op          = opAccept || opDecline;
if (opAccept) {
  formHandler.setStatus(CSInvitation.ACCEPTED);
} else if (opDecline) {
  formHandler.setStatus(CSInvitation.DECLINED);
}
if (op) {
  //----------------------------------------------------------------------
  //Processing
  //----------------------------------------------------------------------
  if (formHandler.validate()) {
    %><%@ include file='/jcore/modal/modalRedirect.jspf' %><%
  }
}

//----------------------------------------------------------------------
// Modal Form
//----------------------------------------------------------------------
Member invitationAuthor = invitation.getAuthor();
Workspace invitedWorkspace = invitation.getWorkspace();
%>

<jalios:modal title="jcmsplugin.collaborativespace.invitations.process-modal.title"
              url="plugins/CollaborativeSpacePlugin/jsp/processInvitationModal.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg"
              op="<%= acceptParam %>"
              picture="jcmsplugin-collaborativespace-invitation32"
              button="jcmsplugin.collaborativespace.invitations.process-modal.btn.accept">

  <jalios:message msg='<%= glp("jcmsplugin.collaborativespace.invitations.process-modal.info", invitationAuthor.getDisplayLink(userLocale), invitedWorkspace.getDisplayLink(userLocale)) %>' />
  
  <jalios:buffer name="MODAL_BUTTON">
    <input type="submit" value="<%= glp("jcmsplugin.collaborativespace.invitations.process-modal.btn.decline") %>" name="<%= declineParam %>" class="btn btn-danger ajax-refresh confirm" />
  </jalios:buffer>
  
</jalios:modal>