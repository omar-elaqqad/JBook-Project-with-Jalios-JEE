<%
request.setAttribute("ContentType", "application/json; charset=UTF-8");
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.application.SmartPhoneLauncherActionsHandler'><%
%><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
%><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

%><%= formHandler.getJsonResponse() %>