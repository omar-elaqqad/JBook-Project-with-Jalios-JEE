<%@page import="com.jalios.jcmsplugin.esn.profile.ProfileDisplayHandler"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (logger.isTraceEnabled()) { logger.trace("doProfileHandler.jsp: start render"); }
%><jsp:useBean id='contactChannelsHandler' scope='page' class='com.jalios.jcmsplugin.esn.profile.ui.UIMemberContactChannelsHandler'><%
  %><jsp:setProperty name='contactChannelsHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='contactChannelsHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='contactChannelsHandler' property='*' /><%
%></jsp:useBean><%

// Note: initialized in handler:
// - JS + CSS files
// - display context (request attributes, jcmsContext ajax attr)
// request and ajax request attributes
%><jsp:useBean id='esnProfileDisplayHandler' scope='page' class='com.jalios.jcmsplugin.esn.profile.ProfileDisplayHandler'><%
  %><jsp:setProperty name='esnProfileDisplayHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='esnProfileDisplayHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='esnProfileDisplayHandler' property='*' /><%
  %><jsp:setProperty name='esnProfileDisplayHandler' property='contactChannelsHandler' value='<%= contactChannelsHandler %>'/><%
%></jsp:useBean><%
esnProfileDisplayHandler.validate();
contactChannelsHandler.setMember(esnProfileDisplayHandler.getMember());
%>
<%
if (logger.isTraceEnabled()) { logger.trace("doProfileHandler.jsp: end render"); }
%>