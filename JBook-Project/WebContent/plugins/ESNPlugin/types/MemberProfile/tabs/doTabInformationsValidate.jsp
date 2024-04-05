<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%

// Display only for contacts
boolean show = isContact;
if (!show) {
  uiTab.disable(request);
  return;
}
%>
