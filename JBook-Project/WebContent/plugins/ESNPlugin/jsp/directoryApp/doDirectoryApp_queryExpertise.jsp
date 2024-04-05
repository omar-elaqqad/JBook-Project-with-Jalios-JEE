<%--
This JSP must no produced any space, as it is used by export CSV page.
--%><%
%><%@page import="com.jalios.jcmsplugin.esn.directory.CompetenceQueryHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%

%><jsp:useBean id='formHandler' scope='page' class="com.jalios.jcmsplugin.esn.directory.CompetenceQueryHandler"><%
  %><jsp:setProperty name='formHandler' property='request' value='<%=request%>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%=response%>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

String directoryNav = getStringParameter("directoryApp_nav", "", "competencies");
if (!"competencies".equals(directoryNav)) {
  return;
}
if (formHandler.validate()) {
  return;
}

if (jcmsContext.isAjaxRequest()) {
  jcmsContext.setAjaxRequestAttribute(CompetenceQueryHandler.HANDLER_REQUEST_ATTR, formHandler);
} else {
  request.setAttribute(CompetenceQueryHandler.HANDLER_REQUEST_ATTR, formHandler);
}

PageResult<Member> pageResult = formHandler.getResults();

// Pass results to the DirectoryAppHandler
request.setAttribute("jcmsplugin.directory.app.results", pageResult);
%>