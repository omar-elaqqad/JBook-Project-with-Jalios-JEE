<%@page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean showAction = dataWriteEnabled && esnMgr.canAddNote(loggedMember, member);
if (!showAction) {
  return;
}
actionLabel = glp("jcmsplugin.esn.lbl.notes.add-link");
String actionUrl = MessageFormat.format("{0}?{1}={2}", 
    /* 0 */ "plugins/ESNPlugin/jsp/form/editNote.jsp", 
    /* 1 */ "mid", 
    /* 2 */ member.getId());
out.print(new Link()
  .css("esn-profile-action esn-profile-action-add-note modal")
  .href(actionUrl)
  .text(actionLabel)
  .html());
%>
