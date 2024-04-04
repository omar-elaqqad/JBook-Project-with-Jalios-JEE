<%@page import="com.jalios.jcms.unifiedinsert.InsertionContext"%><%
request.setAttribute(InsertionContext.UNIFIED_INSERT_ATTR, Boolean.TRUE);
%><%@include file="/work/pubChooser.jsp" %>