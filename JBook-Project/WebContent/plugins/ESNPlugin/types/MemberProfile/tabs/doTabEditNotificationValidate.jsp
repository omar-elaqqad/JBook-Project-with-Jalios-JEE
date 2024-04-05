<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%

// Only for JStore accounts
boolean validate = isAccount && !isDBAccount && channel.isNotificationEnabled();
if (!validate) {
  uiTab.disable(request);
}
%>