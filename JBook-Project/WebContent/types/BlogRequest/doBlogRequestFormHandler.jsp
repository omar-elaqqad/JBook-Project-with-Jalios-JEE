<%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditBlogRequestHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% request.setAttribute("BlogRequest.formHandler", formHandler); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Kl1T/WbC/CN48swQczgm+A== --%>