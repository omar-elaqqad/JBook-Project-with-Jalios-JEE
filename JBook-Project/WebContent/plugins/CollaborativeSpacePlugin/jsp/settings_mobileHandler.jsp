<%@page import="com.jalios.jcmsplugin.collaborativespace.portal.CSDisplayHandler"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
%><jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/doCSDisplayHandler.jsp" /><%
%><%

if (Util.notEmpty(request.getAttribute("csDisplayMobileSettingsHandler"))) {
  return;
}

CSDisplayHandler csHandler = (CSDisplayHandler) request.getAttribute("csDisplayHandler");
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.EditCSJMobileSettingsHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
  %><jsp:setProperty name='formHandler' property='id' value='<%= csHandler.getCollaborativeSpace().getId() %>' /><%
%></jsp:useBean><%
  request.setAttribute("csDisplayMobileSettingsHandler", formHandler);
%>