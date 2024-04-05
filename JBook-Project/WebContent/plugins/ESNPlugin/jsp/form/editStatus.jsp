<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%
	if (!isLogged) {
	  sendForbidden(request, response);
	  return;
	}
	ESNManager esnMgr = ESNManager.getInstance();
	MicroBloggingManager mbMgr = MicroBloggingManager.getInstance();
	
	String statusAddress = com.jalios.jcms.mail.MailManager.getIncomingAddress(ESNConstants.STATUS_MAIL_PREFIX,loggedMember,null);
	MicroBlogging mb = (MicroBlogging) getDataParameter("mbId");
  
  Workspace microBloggingWorkspace = mb != null ? mb.getWorkspace() : mbMgr.getPublishingMicroBloggingWorkspace(true, workspace, loggedMember);
  
  if (microBloggingWorkspace == null) {
    sendForbidden(request, response);
    return;
  }
%>
 <jsp:useBean id='microBlogHandler' scope='page' class='generated.EditMicroBloggingHandler'>
  <jsp:setProperty name='microBlogHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='microBlogHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='microBlogHandler' property='noRedirect' value='<%= true%>' />
  <jsp:setProperty name='microBlogHandler' property='*' />
  <jsp:setProperty name='microBlogHandler' property='ws' value='<%= microBloggingWorkspace.getId() %>'/>  
  <jsp:setProperty name='microBlogHandler' property='id' value='<%= mb != null ? mb.getId() : ""  %>'/>  
</jsp:useBean>
<% if (microBlogHandler.validate()) { %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %><%  
	String modalTitle = mb != null ? "jcmsplugin.esn.status.title" : "jcmsplugin.esn.microblogging.title.create-message";
%><jalios:modal title="<%= modalTitle %>" picture="jcmsplugin-esn-status32" url="plugins/ESNPlugin/jsp/form/editStatus.jsp" formHandler="<%= microBlogHandler %>">
  <div class="alert alert-info"><p><%= glp("jcmsplugin.esn.status.intro") %></p></div>
  
	<jalios:field name="text" resource="field-light" formHandler="<%= microBlogHandler %>">
		<jalios:control/>
	</jalios:field>	

	<% if (channel.getBooleanProperty("mail.incoming.enabled",false)) { %>
	<p><jalios:icon src='jcmsplugin-esn-tip' /> <%= glp("jcmsplugin.esn.status.mail") %> <a href="mailto:<%= statusAddress %>"><%= statusAddress %></a></p>
	<% } %>
	
	<input type="hidden" name="opMicroBlog" value="true"/>
	<% if(mb != null) { %><input type="hidden" name="mbId" value="<%= mb.getId()  %>" /><% } %>
	<input type="hidden" name="title" value="<%= encodeForHTMLAttribute(JcmsUtil.unescapeHtml(loggedMember.getFriendlyName()) +" - "+ new Date())  %>" />
</jalios:modal>