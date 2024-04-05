<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

%><jsp:useBean id='formHandler' scope='page' class="com.jalios.jcmsplugin.collaborativespace.CSHubHandler"><%
  %><jsp:setProperty name='formHandler' property='request' value='<%=request%>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%=response%>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='opReorderFavorites' value='true'/><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true'/><%
%></jsp:useBean><%

formHandler.validate();
%>
