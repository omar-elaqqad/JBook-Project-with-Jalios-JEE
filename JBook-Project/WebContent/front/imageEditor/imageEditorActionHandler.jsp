<%
request.setAttribute("ContentType", "application/json; charset=UTF-8");
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.uicomponent.image.editor.ImageEditorActionHandler'><%
%><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
%><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
formHandler.validate(); %><%
%><%= formHandler.getJsonResponse() %>