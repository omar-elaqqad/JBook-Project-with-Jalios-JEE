<%@page import="com.jalios.jcmsplugin.esn.activity.MemberActivityMode"%>
<%@ include file='/jcore/doInitPage.jspf' %><%

boolean hasValidated = Util.toBoolean(request.getAttribute("jcmsplugin.esn.activity.has-validated"), false);
if (hasValidated) {
  return;
}

PortletMemberActivity box = (PortletMemberActivity) request.getAttribute("jcmsplugin.esn.activity.box");

boolean isPollMode = Util.toBoolean(getUntrustedStringParameter("microbloggingMode", "").equals("poll"), false);
boolean isWorkspaceMode = "currentWS".equals(box.getActivityMode());
boolean canPublishPollForm = isWorkspaceMode ? loggedMember.canPublish(Poll.class, workspace) : loggedMember.canPublishSome(Poll.class);

if (!canPublishPollForm) {
  request.setAttribute("jcmsplugin.esn.activity.can-publish.poll", false);
  return;
}

%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditPollHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true' /><%
%></jsp:useBean>
<% 
request.setAttribute("pollHandler", formHandler);
request.setAttribute("jcmsplugin.esn.activity.can-publish.poll", canPublishPollForm);

if (isPollMode && formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();   
  request.setAttribute("jcmsplugin.esn.activity.has-validated", true);
}
%>