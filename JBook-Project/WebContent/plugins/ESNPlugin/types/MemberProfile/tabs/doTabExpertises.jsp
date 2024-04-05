<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (logger.isTraceEnabled()) { logger.trace("doTabExpertises.jsp: start render"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabExpertises.jsp: start render of resource 'esn.profile.full.expertise'"); }
%>
<jalios:include resource="esn.profile.full.expertise" />
<%
if (logger.isTraceEnabled()) { logger.trace("doTabExpertises.jsp: end render of resource 'esn.profile.full.expertise'"); }
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabExpertises.jsp: end render"); }
%>