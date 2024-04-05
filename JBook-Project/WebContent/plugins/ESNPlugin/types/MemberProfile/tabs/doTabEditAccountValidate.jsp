<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%

// Only for accounts
if (isContact) {
  uiTab.disable(request);
}
%>