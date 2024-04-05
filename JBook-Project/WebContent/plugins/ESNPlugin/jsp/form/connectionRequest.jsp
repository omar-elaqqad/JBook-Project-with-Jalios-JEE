<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
ESNManager esnMgr = ESNManager.getInstance();
Member target = getDataParameter("target", Member.class);%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditMemberConnectionRequestHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<% 
if (formHandler.validate()) { %>
<% request.setAttribute("modal.redirect", formHandler.getRedirect()); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<%
	String modalTitle = glp("jcmsplugin.esn.mcr.request.title", target.getFullName());
	String textAreaValue = glp("jcmsplugin.esn.mcr.request.msg", target.getFriendlyName(), loggedMember.getFullName());
	String buttonValue = glp("jcmsplugin.esn.mcr.request.lbl.send");
	String op = "opCreate";
%>
<jalios:modal op="<%= op %>" button="<%= buttonValue %>" title="<%= modalTitle %>" formHandler="<%= formHandler %>" url="plugins/ESNPlugin/jsp/form/connectionRequest.jsp">
  <div class="alert alert-info">
    <h4><%= glp("jcmsplugin.esn.mcr.request.info.title1") %></h4>
    <p class="br"><%= glp("jcmsplugin.esn.mcr.request.info.content1", target.getFriendlyName()) %></p>
    <h4><%= glp("jcmsplugin.esn.mcr.request.info.title2") %></h4>
    <p><%= glp("jcmsplugin.esn.mcr.request.info.content2", target.getFriendlyName()) %></p>
  </div>

	<jalios:field name="message" value="<%= textAreaValue %>" resource="field-inline">
    <%
    TextAreaSettings messageSettings = new TextAreaSettings();
    messageSettings.value(textAreaValue);
    messageSettings.name("message");
    messageSettings.rows(5);
    %>
	  <jalios:control settings='<%= messageSettings %>' />
	</jalios:field>
	
  <input type="hidden" name="member" value="<%= target.getId() %>" />      
  <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(formHandler.getRedirect()) %>" />
	
</jalios:modal>
