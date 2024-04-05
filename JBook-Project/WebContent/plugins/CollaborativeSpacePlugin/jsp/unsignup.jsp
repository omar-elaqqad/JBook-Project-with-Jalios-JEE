<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%
%><%
CSManager csMgr = CSManager.getInstance();
csMgr.unsignup(loggedMember, getDataParameter("ws", Workspace.class));
sendRedirect("index.jsp");
%>