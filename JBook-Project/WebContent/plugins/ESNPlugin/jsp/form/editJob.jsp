<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditMemberJobHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
  <jsp:setProperty name='formHandler' property='workspaceComplianceWarning' value='false'/>
</jsp:useBean>
<%
ESNManager esnMgr = ESNManager.getInstance();
Member member = getDataParameter("mid", Member.class);
if (member == null && formHandler.getPublication() != null) {
  member = formHandler.getPublication().getAuthor();
}
if (member == null) {
  sendRedirect(loggedMember);
  return;
}
formHandler.setAuthorForced(true, member);
MemberProfile profile = esnMgr.getMemberProfile(member);
String modalRedirect = getUntrustedStringParameter("redirect", profile.getDisplayUrl(userLocale) + "?esnProfileTab=resume");
if (formHandler.validate()) {
  request.setAttribute("modal.redirect", modalRedirect);
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}
Class clazz = formHandler.getPublicationClass(); 
String op = Util.notEmpty(formHandler.getId()) ? "opUpdate" : "opCreate" ;
String button = Util.notEmpty(formHandler.getId()) ? glp("ui.com.btn.update") : glp("ui.com.btn.create") ;
%>
<jalios:modal op="<%= op %>" button="<%= button %>" title="jcmsplugin.esn.lbl.jobs" url="plugins/ESNPlugin/jsp/form/editJob.jsp" formHandler="<%= formHandler %>">

	<jalios:field required="true" label="<%= channel.getTypeEntry(clazz).getTitleLabel(userLang)  %>" name="title" value="<%= formHandler.getAvailableTitle() %>">
		<jalios:control type="<%= ControlType.TEXTFIELD %>"/>
	</jalios:field>
	
	<% String label = channel.getTypeFieldEntry(clazz, "organization", true).getLabel(userLang); %>
	<jalios:field required="true" label="<%= label %>" name="organization" value="<%= formHandler.getAvailableOrganization() %>">
		<jalios:control type="<%= ControlType.TEXTFIELD %>"/>
	</jalios:field>
	
	<% label = channel.getTypeFieldEntry(clazz, "startDate", true).getLabel(userLang); %>
	<jalios:field label="<%= label %>" required="true" name="startDate" value="<%= formHandler.getAvailableStartDate() %>">
		<jalios:control type="<%= ControlType.DATE %>"/>
	</jalios:field>	
	
	<% label = channel.getTypeFieldEntry(clazz, "endDate", true).getLabel(userLang); %>
	<jalios:field label="<%= label %>" name="endDate" value="<%= formHandler.getAvailableEndDate() %>">
		<jalios:control type="<%= ControlType.DATE %>"/>
	</jalios:field>	
	
	<% label = channel.getTypeFieldEntry(clazz, "description", true).getLabel(userLang); %>
	<jalios:field label="<%= label %>" name="description" value="<%= formHandler.getAvailableDescription() %>">
		<jalios:control type="<%= ControlType.WIKIAREA %>"/>
	</jalios:field>	
	
	<% label = channel.getTypeFieldEntry(clazz, "place", true).getLabel(userLang); %>
	<jalios:field label="<%= label  %>" name="place" value="<%= formHandler.getAvailablePlace() %>">
		<jalios:control type="<%= ControlType.TEXTFIELD %>"/>
	</jalios:field>	
		
	<% label = channel.getTypeFieldEntry(clazz, "site", true).getLabel(userLang); %>
	<jalios:field label="<%= label %>" name="site" value="<%= formHandler.getAvailableSite() %>">
		<jalios:control type="<%= ControlType.URL %>"/>
	</jalios:field>			
	
  <input type="hidden" name="redirect" value="<%= modalRedirect %>" />  
  <input type="hidden" name="mid" value="<%= member.getId() %>" />  
  <% if (formHandler.getPublication() != null) { %>
	  <input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
  <% } %>
	
</jalios:modal>