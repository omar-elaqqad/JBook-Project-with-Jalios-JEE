<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: start render"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: start render of resource 'esn.profile.full.contact-notes'"); }
%>
<jalios:include resource="esn.profile.full.contact-notes" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: end render of resource 'esn.profile.full.contact-notes'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: start render of resource 'esn.profile.full.contact-referrers'"); }
%>
<jalios:include resource="esn.profile.full.contact-referrers" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: end render of resource 'esn.profile.full.contact-referrers'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: start render of resource 'esn.profile.full.presentation'"); }
%>
<jalios:include resource="esn.profile.full.presentation" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: end render of resource 'esn.profile.full.presentation'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: start render of resource 'esn.profile.full.links'"); }
%>
<jalios:include resource="esn.profile.full.links" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: end render of resource 'esn.profile.full.links'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabInformations.jsp: end render"); }
%>