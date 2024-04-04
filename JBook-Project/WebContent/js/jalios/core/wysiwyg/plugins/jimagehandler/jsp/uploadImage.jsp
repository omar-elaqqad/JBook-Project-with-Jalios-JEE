<%
request.setAttribute("ContentType", "application/json; charset=UTF-8");
%><%@ include file="/jcore/doInitPage.jspf" %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.wysiwyg.image.ImageUploadHandler"><%
  %><jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

formHandler.validate(); 
%><%= formHandler.getJSON() %>