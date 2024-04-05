<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

CollaborativeSpace cs = CSManager.getInstance().getCollaborativeSpace(workspace);
if (cs == null || !isLogged || !CSManager.getInstance().canFollow(cs, loggedMember)) {
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.FollowSpaceHandler'><%
%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%>  <jsp:setProperty name='formHandler' property='*' /><%
%>  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>'/><%
%></jsp:useBean><%

if (formHandler.validate()) { 
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}
%>

<%
Group followerGroup = cs.getFollowersGroup();
Notification notification = followerGroup.getNotification();
String notificationPeriodLabel = null;
if (notification != null) {
  NotificationCriteria notifCrit = Util.getFirst(notification.getCriteria());
  if (notifCrit != null) {
    int notificationPeriod = notifCrit.getPeriodType();
    notificationPeriodLabel = glp(NotificationManager.getPeriodLabel(notificationPeriod)).toLowerCase(userLocale);
  }
}
%>
<jalios:modal title="jcmsplugin.collaborativespace.lbl.follow.title"
              url="plugins/CollaborativeSpacePlugin/jsp/follow.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg process-follow"
              op="opFollow"
              button="jcmsplugin.collaborativespace.lbl.follow.action">
  <jalios:message dismissable="false" title="">
    <%= glp("jcmsplugin.collaborativespace.lbl.follow.description") %>
    <% if (Util.notEmpty(notificationPeriodLabel)) { %>
     (<%= notificationPeriodLabel %>)
    <% } %>
  </jalios:message>
</jalios:modal>