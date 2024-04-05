<%@page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@page import="com.jalios.jcmsplugin.esn.ui.HTMLAttributes"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean hasReceivedMCR = esnProfileDisplayHandler.hasReceivedMCR();
boolean showAction = dataWriteEnabled && hasReceivedMCR;
if (!showAction) {
  return;
}
actionLabel = glp("jcmsplugin.esn.lbl.connections.requests.edit");
MemberConnectionRequest receivedMCR = esnMgr.getMemberConnectionRequest(member, loggedMember);
String actionUrl = MessageFormat.format("{0}?{1}={2}{3}", 
    /* 0 */ "plugins/ESNPlugin/jsp/form/validateConnectionRequest.jsp", 
    /* 1 */ "id", 
    /* 2 */ receivedMCR.getId(),
    /* 3 */ redirectSuffixNoEncode);
out.print(new Link()
  .css("esn-profile-action esn-profile-action-validate-connection modal")
  .href(actionUrl)
  .text(actionLabel)
  .html());
%>
