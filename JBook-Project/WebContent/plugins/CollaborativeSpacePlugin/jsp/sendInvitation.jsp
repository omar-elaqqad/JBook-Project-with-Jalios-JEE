<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

if ( ! CSManager.getInstance().canManageCSMembers(loggedMember, workspace) ) {
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.SendInvitationHandler'><%
%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%>  <jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%>
<% if (formHandler.validate()) { %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>


<jalios:modal title="jcmsplugin.collaborativespace.invitations.send.title"
              url="plugins/CollaborativeSpacePlugin/jsp/sendInvitation.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg add-group"
              picture="jcmsplugin-collaborativespace-invitation32"
              op="opSend"
              button="jcmsplugin.collaborativespace.invitations.send.btn.send">

  <jalios:message msg="jcmsplugin.collaborativespace.invitations.send.info" dismissable="true" />
  
  <jalios:field name="members" label="ui.com.lbl.members" value="<%= formHandler.getAvailableMemberSet() %>" mv="1" css="accountOnly nodnd" keyword="true">
    <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>' />
  </jalios:field>
  
  <jalios:field name="groups" label="ui.com.lbl.groups" value="<%= formHandler.getAvailableGroupSet() %>"  mv="1" keyword="true">
    <jalios:control type="<%= ControlType.GROUP %>" />
  </jalios:field>

  <jalios:field name="message" label="jcmsplugin.collaborativespace.invitations.send.lbl.message" value="<%= formHandler.getAvailableMessage() %>">
    <jalios:control settings='<%= new WikiAreaSettings().rows(2) %>' />
  </jalios:field>

  <jalios:field name="targetGroup" 
        label="jcmsplugin.collaborativespace.invitations.lbl.target-group" 
        value="<%= formHandler.getAvailableTargetGroup() %>">
    <jalios:control settings='<%= new GroupSettings().select().enumValues(workspace.getGroupSet()) %>' />
  </jalios:field>
  
</jalios:modal>