<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhoneCreatePortalHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

if (!loggedMember.canPublish(SmartPhonePortal.class)) {
  sendForbidden(request, response);
  return;
}

%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhoneCreatePortalHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%

if (formHandler.validate()) { %>
  <% request.setAttribute("modal.redirect", "plugins/SmartPhonePlugin/jsp/portalEditor/mobilePortalEditor.jsp?smartphonePortalId=" + formHandler.getPublication().getId()); %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal url="plugins/SmartPhonePlugin/jsp/portalApp/createMobilePortalModal.jsp" title="jcmsplugin.smartphone.portal.creation-modal.title" formHandler="<%= formHandler %>">

	<jalios:field name="title" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>  
  
  <jalios:field name="cids" formHandler="<%= formHandler %>" label="jportal.publish-modal.navigation-category.label">
    <jalios:control settings='<%= formHandler.getCategorySettings() %>'/>
  </jalios:field> 
  
  <jalios:field name="description" formHandler="<%= formHandler %>">
    <jalios:control/>
  </jalios:field>  
  
  

</jalios:modal>