<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: start render"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: start render of resource 'esn.profile.full.mcr-received'"); }
%>
<jalios:include resource="esn.profile.full.mcr-received" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: end render of resource 'esn.profile.full.mcr-received'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: start render of resource 'esn.profile.full.mcr-sent'"); }
%>
<jalios:include resource="esn.profile.full.mcr-sent" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: end render of resource 'esn.profile.full.mcr-sent'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: start render of resource 'esn.profile.full.conn-suggestion'"); }
%>
<jalios:include resource="esn.profile.full.conn-suggestion" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: end render of resource 'esn.profile.full.conn-suggestion'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: start render of resource 'esn.profile.full.common-connections'"); }
%>
<jalios:include resource="esn.profile.full.common-connections" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: end render of resource 'esn.profile.full.common-connections'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: start render of resource 'esn.profile.full.contacts'"); }
%>
<jalios:include resource="esn.profile.full.contacts" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: end render of resource 'esn.profile.full.contacts'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: start render of resource 'esn.profile.full.other-connections'"); }
%>
<jalios:include resource="esn.profile.full.other-connections" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: end render of resource 'esn.profile.full.other-connections'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabConnections.jsp: end render"); }
%>