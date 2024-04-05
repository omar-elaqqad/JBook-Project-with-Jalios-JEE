<%@ include file="/jcore/doInitPage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %>

<%
ESNManager esnMgr = ESNManager.getInstance();
Member target = getDataParameter("target", Member.class);

if (target.isContact() || !esnMgr.isConnectionRequestEnabled()) {
  esnMgr.connectMember(loggedMember, target);
}

sendRedirect(getUntrustedStringParameter("redirect", ""));
%>
