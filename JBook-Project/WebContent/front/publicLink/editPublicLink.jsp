<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.publiclink.EditPublicLinkHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
%><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
%><jsp:setProperty name='formHandler' property='*' /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean>

<% if(formHandler.validate()) { %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<% if (formHandler.showEditor()) { %>
<%@ include file="/front/publicLink/editPublicLink_editor.jspf" %>
<% } else { %>
<%@ include file="/front/publicLink/editPublicLink_info.jspf" %>
<% } %>





