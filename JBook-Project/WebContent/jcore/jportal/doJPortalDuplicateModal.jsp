<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcms.jportal.JPortalTemplate"%>
<%@page import="com.jalios.jcms.jportal.JPortalCreateHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

if (!loggedMember.canPublish(JPortal.class)) {
  sendForbidden(request, response);
  return;
}

jcmsContext.addCSSHeader("css/jalios/core/jportal/jportal-modal.css");

%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalDuplicateHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%

if (formHandler.validate()) { %>
  <% request.setAttribute("modal.redirect", "jcore/jportal/edition/jportalEdition.jsp?jPortal=" + formHandler.getDuplicateJPortal().getId()); %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal button="Duplicate" op="opDuplicateJPortal" url="jcore/jportal/doJPortalDuplicateModal.jsp" title="Duplicate Jportal" formHandler="<%= formHandler %>">
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