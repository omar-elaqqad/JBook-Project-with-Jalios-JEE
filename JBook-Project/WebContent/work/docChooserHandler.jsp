<%@ include file="/jcore/doInitPage.jspf" %>
<jsp:useBean id="formhandler" scope="page" class="com.jalios.jcms.upload.DocUploadHandler"><%
  %><jsp:setProperty name="formhandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formhandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formhandler" property="*" /><%
  %><jsp:setProperty name="formhandler" property="modal" value="<%= true %>" /><%
%></jsp:useBean><%
formhandler.internalInit();
formhandler.checkMemberClassWorkspaceCompliance();
formhandler.checkWorkspaceChange();
request.setAttribute("docChooserHandler", formhandler); 
%>