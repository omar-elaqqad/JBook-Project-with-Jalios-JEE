<%@page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@page import="com.jalios.jcmsplugin.esn.ui.HTMLAttributes"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean showAction = dataWriteEnabled && !isMyProfile && isConnected;
if (!showAction) {
  return;
}
actionLabel = glp("jcmsplugin.esn.lbl.disconnect.contact2");
String actionUrl = MessageFormat.format("{0}?{1}={2}&target={3}", 
    /* 0 */ "plugins/ESNPlugin/jsp/form/disconnect.jsp", 
    /* 1 */ "member", 
    /* 2 */ loggedMember.getId(),
    /* 3 */ member.getId());
out.print(new Link()
  .css("esn-profile-action esn-profile-action-disconnect modal")
  .href(actionUrl)
  .text(actionLabel)
  .html());
%>
