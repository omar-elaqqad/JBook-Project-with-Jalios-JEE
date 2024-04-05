<% request.setAttribute("ContentType", "application/json; charset=UTF-8");%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.portal.CSActionHandler'><%
%><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
%><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% formHandler.validate(); %><%
%><%= formHandler.getJsonResponse() %>