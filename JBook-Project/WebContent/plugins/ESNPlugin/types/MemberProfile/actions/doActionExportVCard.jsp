<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean showAction = !isMyProfile && isLogged;
if (!showAction) {
  return;
}
actionLabel = glp("jcmsplugin.esn.lbl.vcard");
String actionUrl = MessageFormat.format("{0}?{1}={2}", 
    /* 0 */ "plugins/ESNPlugin/jsp/vcard.jsp", 
    /* 1 */ "mid", 
    /* 2 */ member.getId());
%>
<a class="esn-profile-action esn-profile-action-vcard" href="<%= actionUrl %>"><%
  %><%= actionLabel %><%
%></a>