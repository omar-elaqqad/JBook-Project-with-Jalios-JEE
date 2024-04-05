<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
/*
plugins/ESNPlugin/jsp/form/resetConnectionSuggestion.jsp
*/
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.MemberConnectionHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='opResetSuggestion' value='true'/>
<%--   <jsp:setProperty name='formHandler' property='redirect' value="<%= ServletUtil.getUrl(request) %>"/> --%>
</jsp:useBean>
<% if (formHandler.validate()) { %>
<%-- <% request.setAttribute("modal.redirect", formHandler.getRedirect()); %> --%>
<%-- <% request.setAttribute("modal.redirect", ServletUtil.getUrl(request)); %> --%>
<%-- <% request.setAttribute("modal.redirect.exit", Boolean.FALSE); %> --%>
<%-- <%@ include file="/jcore/modal/modalRedirect.jspf" %> --%>
<% } %>
