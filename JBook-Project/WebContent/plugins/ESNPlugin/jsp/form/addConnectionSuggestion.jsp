<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.MemberConnectionHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='opAddSuggestion' value='true'/>
</jsp:useBean>
<% if (formHandler.validate()) { %>
<% request.setAttribute("modal.redirect", formHandler.getRedirect()); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
