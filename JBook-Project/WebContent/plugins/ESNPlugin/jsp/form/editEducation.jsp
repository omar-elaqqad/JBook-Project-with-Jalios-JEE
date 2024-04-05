<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditMemberEducationHandler'>
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
<jalios:modal op="<%= op %>" button="<%= button %>" title="jcmsplugin.esn.lbl.educations" url="plugins/ESNPlugin/jsp/form/editEducation.jsp" formHandler="<%= formHandler %>">

  <jalios:field name="title" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>      

  <jalios:field name="trainingCenter" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>      
	
  <jalios:field name="degree" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>         

  <jalios:field name="startDate" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>   
	
	<jalios:field name="endDate" formHandler="<%= formHandler %>">
		<jalios:control/>
	</jalios:field>	  
  
  <jalios:field name="description" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>      
	
  <jalios:field name="place" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>      
		
  <jalios:field name="site" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>      
			
  <input type="hidden" name="redirect" value="<%= modalRedirect %>" />  
  <input type="hidden" name="mid" value="<%= member.getId() %>" />  
	<% if (formHandler.getPublication() != null) { %>
  <input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
  <% } %>   
  
</jalios:modal>