<%@page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler"%><%--
--%><%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%
String id =  getDataIdParameter("docId");
sendRedirect("front/publicLink/editPublicLink.jsp?docIds=" + id);
%>