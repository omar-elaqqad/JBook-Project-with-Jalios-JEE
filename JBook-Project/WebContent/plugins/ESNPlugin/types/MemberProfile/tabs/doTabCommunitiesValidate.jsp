<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%

boolean showTab = true;
if (!isAccount) {
  showTab = false;
} else {
  Map<String, Set<Workspace>> wsMap = esnProfileDisplayHandler.getWorkspaceMap();
  if (Util.isEmpty(wsMap)) {
    showTab = false;
  }
}

if (!showTab) {
  uiTab.disable(request);
  return;
}
%>