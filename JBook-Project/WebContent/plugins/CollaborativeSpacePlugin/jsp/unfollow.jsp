<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

CSManager csMgr = CSManager.getInstance();
Workspace csWS = getDataParameter("ws", Workspace.class);
CollaborativeSpace cs = csMgr.getCollaborativeSpace(csWS);
if (csMgr.canUnfollow(cs, loggedMember)) {
  csMgr.unfollow(cs, loggedMember);
}
sendRedirect(cs);
%>