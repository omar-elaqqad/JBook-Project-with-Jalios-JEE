<%@page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean hasReceivedMCR = esnProfileDisplayHandler.hasReceivedMCR();
boolean hasSentMCR = isLogged && esnProfileDisplayHandler.hasSentMCR();
boolean showValidateConnectionRequestReceived = dataWriteEnabled && hasReceivedMCR;
boolean isConnectionRequestEnabled = esnMgr.isConnectionRequestEnabled();
boolean showAction = dataWriteEnabled
    && isLogged
    && !isMyProfile
    && isConnectionRequestEnabled
    && !isConnected
    && isAccount
    && !showValidateConnectionRequestReceived
    && !hasSentMCR;
if (!showAction) {
  return;
}
actionLabel = glp("jcmsplugin.esn.lbl.connections.add.member2");
String actionUrl = MessageFormat.format("{0}?{1}={2}{3}", 
    /* 0 */ "plugins/ESNPlugin/jsp/form/connectionRequest.jsp", 
    /* 1 */ "target", 
    /* 2 */ member.getId(),
    /* 3 */ redirectSuffixNoEncode);
out.print(new Link()
  .css("esn-profile-action esn-profile-action-request-connection modal")
  .href(actionUrl)
  .text(actionLabel)
  .html());
%>
