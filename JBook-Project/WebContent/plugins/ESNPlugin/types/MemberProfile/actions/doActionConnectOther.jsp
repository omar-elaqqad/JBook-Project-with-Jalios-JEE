<%@page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean showAction = dataWriteEnabled && isConnected && isContact;
if (!showAction) {
  return;
}
actionLabel = glp("jcmsplugin.esn.lbl.connections.connect-contact2");
String actionUrl = MessageFormat.format("{0}?{1}={2}", 
    /* 0 */ "plugins/ESNPlugin/jsp/form/connectWithOtherContacts.jsp", 
    /* 1 */ "id", 
    /* 2 */ member.getId());
out.print(new Link()
  .css("esn-profile-action esn-profile-action-connect-with-other-contact modal")
  .href(actionUrl)
  .text(actionLabel)
  .html());
%>
