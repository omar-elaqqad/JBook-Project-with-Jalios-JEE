<%@page import="com.jalios.jcmsplugin.esn.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabActivity.jsp: start render of resource 'esn.profile.full.last-pubs'"); }
%>
<jalios:include resource="esn.profile.full.last-pubs" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabActivity.jsp: end render of resource 'esn.profile.full.last-pubs'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabActivity.jsp: start render of resource 'esn.profile.full.activity'"); }
%>
<jalios:include resource="esn.profile.full.activity" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabActivity.jsp: end render of resource 'esn.profile.full.activity'"); }
%>