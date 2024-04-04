<%@page import="com.jalios.jcms.unifiedinsert.InsertionContext"%><%
request.setAttribute(InsertionContext.UNIFIED_INSERT_ATTR, Boolean.TRUE);
request.setAttribute("QueryChooser-Gallery", Boolean.TRUE);
%><%@ include file='/work/queryChooser.jsp' %>