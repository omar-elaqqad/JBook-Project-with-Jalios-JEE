<%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'><%
%><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
%><jsp:setProperty name="formHandler" property="*" /><%
%><jsp:setProperty name="formHandler" property="opUnlock" value="true" /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}
%>