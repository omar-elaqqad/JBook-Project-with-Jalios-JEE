<%@ include file="/jcore/doInitPage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %>
<%
ESNManager esnMgr = ESNManager.getInstance();
Member target = getDataParameter("target", Member.class);
boolean follow = getBooleanParameter("follow", true);

if (follow) {
  esnMgr.followMember(loggedMember, target);
} else {
  esnMgr.unfollowMember(loggedMember, target);
}
String redirect = getValidHttpUrl("redirect");
if (Util.notEmpty(redirect)) {
  sendRedirect(redirect);
}
%>
