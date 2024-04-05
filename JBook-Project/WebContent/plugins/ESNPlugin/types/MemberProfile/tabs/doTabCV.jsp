<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: start render"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: start render of resource 'esn.profile.full.presentation'"); }
%>
<jalios:include resource="esn.profile.full.presentation" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: end render of resource 'esn.profile.full.presentation'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: start render of resource 'esn.profile.full.jobs'"); }
%>
<jalios:include resource="esn.profile.full.jobs" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: end render of resource 'esn.profile.full.jobs'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: start render of resource 'esn.profile.full.educations'"); }
%>
<jalios:include resource="esn.profile.full.educations" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: end render of resource 'esn.profile.full.educations'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: start render of resource 'esn.profile.full.links'"); }
%>
<jalios:include resource="esn.profile.full.links" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: end render of resource 'esn.profile.full.links'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabCV.jsp: end render"); }
%>