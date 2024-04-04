<%
request.setAttribute("ContentType", "application/json; charset=UTF-8");
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.PubChooserUploadHandler'><%
%><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
%><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
if (formHandler.validate()) { %><%
%><%= formHandler.getJsonResponse() %><% } %>