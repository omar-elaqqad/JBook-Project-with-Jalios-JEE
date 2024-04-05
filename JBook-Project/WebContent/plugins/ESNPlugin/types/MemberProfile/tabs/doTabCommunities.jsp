<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (logger.isTraceEnabled()) { logger.trace("doTabCommunities.jsp: start render"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabCommunities.jsp: start render of resource 'esn.profile.full.workspaces'"); }
%>
<jalios:include resource="esn.profile.full.workspaces" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabCommunities.jsp: end render of resource 'esn.profile.full.workspaces'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabCommunities.jsp: end render"); }
%>