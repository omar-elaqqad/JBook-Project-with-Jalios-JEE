<%@page import="com.jalios.jcms.jportal.JPortalAddPorletHandler"%>
<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcms.jportal.JPortalTemplate"%>
<%@page import="com.jalios.jcms.jportal.JPortalCreateHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}%>
<jalios:include jsp="jcore/jportal/edition/doJPortalAddPortletModalHandler.jsp" /><%
JPortalAddPorletHandler formHandler = (JPortalAddPorletHandler) request.getAttribute("formHandler");
formHandler.addFrontEndDependencies();
%>


<!-- MODAL TO CREATE -->
<% if(formHandler.showPortletCreation()){ %>
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

    <% if (formHandler.validate()) { %>
    <script>
	    jQuery.jalios.jportal.triggerEvent("addPortlet", {blockId: "<%= formHandler.getBlockId() %>", portletId:"<%= formHandler.getNewPortletId() %>"}); 
	    jQuery.jalios.ui.Modal.close(false);
	  </script>
	  <% } %>
	    
	<jalios:modal css="modal-lg jportal-add-portlet-modal" op="opAddService" 
	              button="ui.com.btn.save" formHandler="<%= formHandler %>" 
	              title="jcmsplugin.collaborativespace.services.lbl.add-new-title" url="jcore/jportal/edition/doJPortalAddPortletModal.jsp">
	  <jalios:field label="jcmsplugin.collaborativespace.services.lbl.type.application">
	     <jalios:control 
	       settings="<%= formHandler.getApplicationSettings() %>" />
	  </jalios:field>
	  
    
	  <%= editPortletTemplateAndHandler %>
	  <%= formHandler.getFormStepHiddenFields() %>
	</jalios:modal>
<% }else{ %>
 <!--  MODAL TO ADD  -->
 <% if (formHandler.validate()) { %>
  <script>
   jQuery.jalios.jportal.triggerEvent("addPortlet", {blockId: "<%= formHandler.getBlockId() %>", portletId:"<%= formHandler.getAvailableOpSelectedPortlet().getId() %>"}); 
   jQuery.jalios.ui.Modal.close(false);
 </script>
 <% } %>
	<jalios:modal css="modal-lg jportal-add-portlet-modal" url="jcore/jportal/edition/doJPortalAddPortletModal.jsp" title="jportal.simple-edition.add-portlet-modal"  formHandler="<%= formHandler %>">
	  <div class="filters">
	    <div class="filters__left">
	      <div class="input-wrapper input-wrapper-type">
	        <jalios:control settings='<%= formHandler.getPortalElementTypesSettings() %>' />
	      </div>
	        <% if(formHandler.showCreateNewPortletButton()){ %>
	        <button class="btn btn-default create-portlet-btn" type="submit" 
	                data-jalios-action="ajax-refresh" 
	                name="opLoadPortletCreation" value="true">
	                 <jalios:icon src="jportal-simple-edition-add-portlet" alt="add" />
	                <%= formHandler.getCreateNewPortletButtonLabel() %>
	        </button>
          <% } %>
	    </div>

	    <div class="input-wrapper">
	      <jalios:field resource="field-light">
	        <jalios:control settings='<%= formHandler.getSearchFieldSettings() %>' />
	      </jalios:field>
	    </div>
	  </div>
	  <jalios:include jsp="jcore/jportal/edition/doJPortalAddPortletModalPortlets.jsp" />
	  <%= formHandler.getFormStepHiddenFields() %>
	</jalios:modal>
<% } %>