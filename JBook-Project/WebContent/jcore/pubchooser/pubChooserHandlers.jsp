<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='workspaceQueryHandler' scope='page' class='com.jalios.jcms.workspace.WorkspaceQueryHandler'>
  <jsp:setProperty name='workspaceQueryHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='workspaceQueryHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='workspaceQueryHandler' property='*' />
</jsp:useBean>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.PubChooserHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="workspaceQueryHandler" value="<%= workspaceQueryHandler %>" /><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
request.setAttribute("workspaceQueryHandler", workspaceQueryHandler);
request.setAttribute("pubChooserHandler", formHandler);
%>