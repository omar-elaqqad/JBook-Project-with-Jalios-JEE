<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.AddApplicationServiceHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean>

<jalios:buffer name="editPortletTemplateAndHandler">
  <% if(Util.notEmpty(formHandler.getApplicationClassSimpleName())){ %>
	  <jalios:include jsp='<%= formHandler.getPortletEditFormHandlerPath() %>' />
	  <%
	  EditPortalElementHandler genericFormHandler = (EditPortalElementHandler) request.getAttribute(formHandler.getApplicationClassSimpleName() + ".formHandler");
	  // Do not display warning message if type is not activated in the ws as we will activate it
	  genericFormHandler.setWorkspaceComplianceWarning(false);
	  genericFormHandler.setWorkspace(workspace);
	  genericFormHandler.setSkipValidateWorkspace(true);
	  formHandler.setEditPortletHandler(genericFormHandler);
	  request.setAttribute(EditPortletSkinableHandler.DISPLAY_PORTLET_SKINABLE_FORM_REQUEST_ATTR, false);
	  request.setAttribute("jcms.edit.footer.display", true);
	  genericFormHandler.setLoggedMember(Channel.getChannel().getDefaultAdmin());
	  // Validate must be performed to initialize handler
	  if (genericFormHandler.validate()) {
	    return;
	  }
	  %>
	  <% request.setAttribute("formHandler", genericFormHandler); %>
	  <jalios:field name="title" formHandler="<%= genericFormHandler %>">
	    <jalios:control />
	  </jalios:field>
	 
	  <jalios:include jsp='<%= formHandler.getPortletEditTemplatePath() %>' />
	  <% if(formHandler.displayJMobileOptions()){%>
	     <jalios:field name="activateOnJMobile" value="false" label="jcmsplugin.collaborativespace.services.smartphone-ability.label" >
			   <jalios:control type="<%= ControlType.BOOLEAN %>" />
			 </jalios:field>
	  <% } %>
  <% } %>
</jalios:buffer>
    
<%if (formHandler.validate()) {%><%@ include file="/jcore/modal/modalRedirect.jspf" %><%}%>

<jalios:modal css="modal-lg explorer-modal-move-items" op="opAddService" 
              button="ui.com.btn.save" formHandler="<%= formHandler %>" 
              title="jcmsplugin.collaborativespace.services.lbl.add-new-title" url="plugins/CollaborativeSpacePlugin/jsp/doAddApplicationServiceModal.jsp">

  <jalios:field label="jcmsplugin.collaborativespace.services.lbl.type.application">
	   <jalios:control settings="<%= formHandler.getApplicationSettings() %>" />
	</jalios:field>
  <%= editPortletTemplateAndHandler %>
</jalios:modal>