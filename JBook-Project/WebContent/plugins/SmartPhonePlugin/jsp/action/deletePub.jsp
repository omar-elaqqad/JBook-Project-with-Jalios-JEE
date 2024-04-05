<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneResourceHelper"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

if (!isLogged) {
  return;
}

Publication pub = getPublicationParameter("pubId");

if (pub == null) {
  return;
}

if (pub.checkAndPerformDelete(loggedMember).isOK()) {
  sendRedirect("plugins/SmartPhonePlugin/jsp/index.jsp");
} else {
  sendRedirect(SmartPhoneManager.getInstance().getDataUrl(pub));
} 

return;
%>