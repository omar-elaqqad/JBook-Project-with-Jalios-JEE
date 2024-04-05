<%@ page contentType="text/html; charset=UTF-8" %><% 
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (Util.notEmpty(request.getAttribute("csDisplayHandler"))) {
  return;
}

%><jsp:useBean id='csHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.portal.CSDisplayHandler'><%--
--%><jsp:setProperty name='csHandler' property='request' value='<%= request %>'/><%--
--%><jsp:setProperty name='csHandler' property='response' value='<%= response %>'/><%--
--%><jsp:setProperty name='csHandler' property='*' /><%--
--%><% if (!hasParameter("collaborativeSpaceId")) { %><%--
  TODO : to handle ajax request, this should be rewritten differently
--%><jsp:setProperty name='csHandler' property='collaborativeSpace' value="<%= (PortalElement)   request.getAttribute(PortalManager.PORTAL_PORTALELEMENT) %>" /><%--
--%><% } %>
</jsp:useBean><%--
--%><%
request.setAttribute("csDisplayHandler", csHandler);
%>