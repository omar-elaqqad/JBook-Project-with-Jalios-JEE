<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %>
<%
	if (!isLogged) {
		sendForbidden(request,response);
    return;
	}
	
	MemberConnectionRequest mcr = getDataParameter("mcrId", MemberConnectionRequest.class); 
	String token = getUntrustedStringParameter("token","");
	
	if (mcr == null || !JcmsUtil.isSameId(loggedMember,mcr.getMember()) || !token.equals(mcr.getSecurityToken())) {
    sendRedirect("plugins/ESNPlugin/jsp/form/validateConnectionRequestMissing.jsp");
    return;
	}
	
	int requestStatus = getIntParameter("requestStatus",-1);
	
	if (requestStatus != 1 && requestStatus != 2) {
    sendRedirect(channel.getUrl());
		return;
	}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditMemberConnectionRequestHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='opUpdate' value="true" />
  <jsp:setProperty name='formHandler' property='requestStatus' value="<%= requestStatus %>" />
  <jsp:setProperty name='formHandler' property='id' value="<%= mcr.getId() %>" />
</jsp:useBean>
<% if (formHandler.validate()) {
    sendRedirect(mcr.getAuthor());
    return;
} %>


