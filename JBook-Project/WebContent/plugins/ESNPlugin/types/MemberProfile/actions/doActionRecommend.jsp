<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

boolean canBeRecommendedBy = dataWriteEnabled && esnProfileDisplayHandler.canBeRecommendedBy();
if (!canBeRecommendedBy) {
  return;
}
%>
<jalios:recommendation css="esn-profile-action esn-profile-action-recommend" data="<%= member %>"><%
  %><%= glp("jcmsplugin.esn.lbl.connections.recommendation2") %><%
%></jalios:recommendation>
