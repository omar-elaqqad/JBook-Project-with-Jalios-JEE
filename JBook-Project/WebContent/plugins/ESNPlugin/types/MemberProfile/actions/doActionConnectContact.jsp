<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean hasReceivedMCR = esnProfileDisplayHandler.hasReceivedMCR();
boolean showValidateConnectionRequestReceived = dataWriteEnabled && hasReceivedMCR;
boolean isConnectionRequestEnabled = esnMgr.isConnectionRequestEnabled();
boolean showAction = dataWriteEnabled
    && !isMyProfile 
    && isLogged
    && !showValidateConnectionRequestReceived
    && (!isConnected && (isContact || !isConnectionRequestEnabled));

if (!showAction) {
  return;
}
actionLabel = glp("jcmsplugin.esn.lbl.connections.add.contact2");
// String actionUrl = "plugins/ESNPlugin/jsp/form/connectionContact.jsp?target=" + member.getId() + redirectSuffix;
String actionUrl = MessageFormat.format("{0}?{1}={2}{3}", 
    /* 0 */ "plugins/ESNPlugin/jsp/form/connectionContact.jsp", 
    /* 1 */ "target", 
    /* 2 */ member.getId(),
    /* 3 */ redirectSuffixNoEncode);
out.print(new Link()
  .css("esn-profile-action esn-profile-action-connection-contact")
  .href(actionUrl)
  .text(actionLabel)
  .html());
%>
