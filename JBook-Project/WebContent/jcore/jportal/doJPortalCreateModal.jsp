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
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalCreateHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%

if (formHandler.validate()) { %>
  <% request.setAttribute("modal.redirect", "jcore/jportal/edition/jportalEdition.jsp?jPortal=" + formHandler.getPublication().getId()); %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %><%
int step = formHandler.getFormStep();
%>
<jalios:modal url="jcore/jportal/doJPortalCreateModal.jsp" title="jportal.create-modal.title" formHandler="<%= formHandler %>">
  <% if (step == JPortalCreateHandler.STEP_INFORMATION) { %>
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
<%--     <jalios:field name="cids" formHandler="<%= formHandler %>" label="ui.com.lbl.categories">
      <jalios:control settings='<%= new CategorySettings().tree().root(formHandler.getAvailableWorkspace().getCatSet()) %>'/>
    </jalios:field> --%>
    
  <% } else if (step == JPortalCreateHandler.STEP_LAYOUT) { %>
    <jalios:field name="layout" resource="field-vertical" label="jportal.create-modal.layout">
      <jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="card-count-3 jportal-choices">
        <% for (JPortalTemplate itTemplate : formHandler.getTemplateList()) { %>
          <% String cardCss = "jportal-choice-card jportal-choice-card-" + itTemplate.getName(); %>
	        <jalios:card css="<%= cardCss %>">
	          <label>
	            <input type="radio" data-jalios-action="remove:card-selected sync:card-selected" data-jalios-target=".jportal-choice-card|.jportal-choice-card-<%=itTemplate.getName() %>" name="template" value="<%= itTemplate.getName() %>" class="hide"/>	          
	             <jalios:cardImage src="<%= itTemplate.getImage() %>" alt="" />
	             <jalios:cardBlock css="jalios-card-body">
	               <div class="card-title"><%= itTemplate.getLabel(userLang) %></div>
	             </jalios:cardBlock>
	          </label>
	        </jalios:card>
        <% } %>
      </jalios:cards>    
    </jalios:field> 
  <% } %>
</jalios:modal>