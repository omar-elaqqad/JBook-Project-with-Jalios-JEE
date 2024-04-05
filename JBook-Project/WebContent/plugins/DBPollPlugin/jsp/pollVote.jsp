<%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.dbpoll.PollVoteHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
formHandler.validate();
sendRedirect(formHandler.getRedirect());
%>