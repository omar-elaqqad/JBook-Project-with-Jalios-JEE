<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

boolean showAction = dataWriteEnabled && isAdmin;
if (!showAction) {
  return;
}
actionLabel = glp("ui.com.btn.edit-back");
String actionUrl = MessageFormat.format("{0}?{1}={2}{3}", 
    /* 0 */ "edit.jsp", 
    /* 1 */ "id", 
    /* 2 */ member.getId(),
    /* 3 */ redirectSuffix);
%>
<a class="esn-profile-action esn-profile-action-edit-profile esn-profile-action-edit-profile-full" href="<%= actionUrl %>"><%
  %><%= actionLabel %><%
%></a>
