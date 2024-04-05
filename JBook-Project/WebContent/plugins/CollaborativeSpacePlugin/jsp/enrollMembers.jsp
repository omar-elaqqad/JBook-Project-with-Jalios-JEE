<%--
  @Summary: CollaborativeSpace members enrollment modal
            This process relies on a target Group that must not be null.
            It is either the specified collaborativeSpace's Group, or by default, the collaborativeSpace's workspace's default Group. 
  @Category: Custom
  @Author: Sylvain DEVAUX 
  @Customizable: True
  @Requestable: False 
--%>
<%@page import="com.jalios.jcms.taglib.settings.impl.MemberSettings.MemberFilter"%><%
%><%@page import="com.jalios.jcms.handler.AllMemberQueryHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

if (!CSManager.getInstance().canManageCSMembers(loggedMember, workspace) ) {
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.EnrollMembersHandler'><%
%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%>  <jsp:setProperty name='formHandler' property='*' /><%
%>  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>'/><%
%></jsp:useBean>

<% if (formHandler.validate()) { %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal title="jcmsplugin.collaborativespace.members.lbl.enroll-members" 
              url="plugins/CollaborativeSpacePlugin/jsp/enrollMembers.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg edit-member"
              picture=""
              op="opEnroll"
              button="ui.com.btn.add">

  <jalios:message title="" dismissable="false">
    <%= glp("jcmsplugin.collaborativespace.members.enroll-modal.intro") %>
  </jalios:message>

  <%
  Group[] targetGroups = formHandler.getAvailableTargetGroup();
  Group targetGroup = Util.notEmpty(targetGroups) ? Util.getFirst(targetGroups) : null;
  %>
  <jalios:field name="targetGroup" label="jcmsplugin.collaborativespace.members.enroll-modal.target-group" value="<%= targetGroup %>" required="true">
    <jalios:control settings='<%= new GroupSettings().select().enumValues(formHandler.getAvailableTargetGroups()) %>' />
  </jalios:field>

  <jalios:field name="members" label="jcmsplugin.collaborativespace.create.attendees.members" mv="1" css="accountOnly nodnd" keyword="true" value='<%= formHandler.getAvailableMemberSet() %>'>
    <%-- Limit members to only enabled accounts --%>
    <jalios:control settings='<%= new MemberSettings().filter(MemberFilter.ACCOUNT, MemberFilter.ENABLED) %>' />
  </jalios:field>

  <jalios:field name="groups" label="jcmsplugin.collaborativespace.create.attendees.groups"  mv="1" keyword="true" description="jcmsplugin.collaborativespace.members.enroll-modal.groups.description"
   value='<%= formHandler.getAvailableGroupSet() %>'>
    <jalios:control type="<%= ControlType.GROUP %>" />
  </jalios:field>
  
  <%
  String[] notificationValues = {"true","false"};
  String[] notificationLabels = {"jcmsplugin.collaborativespace.create.attendees.notification.mail", "jcmsplugin.collaborativespace.create.attendees.notification.no"};
  EnumerateSettings notificationSettings = new EnumerateSettings().enumValues(notificationValues).enumLabels(notificationLabels);
  %>
  <jalios:field name="notification" label="jcmsplugin.collaborativespace.create.attendees.notification" value="<%= true %>">
    <jalios:control settings='<%= notificationSettings %>' />
  </jalios:field>

  <input type="hidden" name="groupWorkspace" value="<%= workspace.getId() %>" />
</jalios:modal>
