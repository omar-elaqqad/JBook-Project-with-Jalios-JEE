<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean showAction = dataWriteEnabled && canEdit;
if (!showAction) {
  return;
}
actionLabel = esnProfileDisplayHandler.isMyProfile() ? glp("jcmsplugin.esn.lbl.edit.me") : glp("jcmsplugin.esn.lbl.edit.other2");
String actionUrl = esnProfileDisplayHandler.getEditProfileUrl();
%>
<a class="esn-profile-action esn-profile-action-edit-profile" href="<%= actionUrl %>"><%
  %><%= actionLabel %><%
%></a>
