<%@page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean showAction = dataWriteEnabled && esnMgr.canUpdatePhoto(loggedMember, member, workspace);
if (!showAction) {
  return;
}
actionLabel = isMyProfile 
  ? glp("jcmsplugin.esn.profile.action.change-photo.me")
  : glp("jcmsplugin.esn.profile.action.change-photo");
String actionUrl = MessageFormat.format("{0}?{1}={2}", 
    /* 0 */ "front/memberPhoto/editPhoto.jsp", 
    /* 1 */ "mbrId", 
    /* 2 */ member.getId(),
    /* 3 */ "modalRedirect", 
    /* 4 */ encodeForURL(loggedMember.getDisplayUrl(userLocale)));
out.print(new Link()
  .css("esn-profile-action esn-profile-action-change-photo modal")
  .href(actionUrl)
  .text(actionLabel)
  .html());
%>
