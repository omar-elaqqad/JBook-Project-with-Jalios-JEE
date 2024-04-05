<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>

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
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portalEditor.SmartphonePortalDuplicateHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%

if (formHandler.validate()) { %>
  <% request.setAttribute("modal.redirect", "plugins/SmartPhonePlugin/jsp/portalEditor/mobilePortalEditor.jsp?smartphonePortalId=" + formHandler.getDuplicatePortal().getId()); %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal button='<%= glp("jportal.edition.topbar.duplicate.label") %>' op="opDuplicatePortal" url="plugins/SmartPhonePlugin/jsp/portalEditor/doSmartphonePortalDuplicateModal.jsp" 
							title='<%= glp("jcmsplugin.smartphone.portal.lbl.duplicate.modal.title") %>' formHandler="<%= formHandler %>">
  <input type="hidden" name="id" value="<%= formHandler.getId() %>" />
  <%
	  ServletUtil.backupAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
		request.setAttribute("TRIGGER_WS_CHANGE_REFRESH", true);
		%>
		<%@ include file='/jcore/doWorkspaceField.jspf' %>
		<%
		ServletUtil.restoreAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
		%>
    <jalios:field name="title" formHandler="<%= formHandler %>">
      <jalios:control/>
    </jalios:field>
    <jalios:field name="description" formHandler="<%= formHandler %>">
      <jalios:control/>
    </jalios:field>
</jalios:modal>