<%@page import="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler.ApplicationFilter"%>
<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%>
<%@page import="com.jalios.jcms.taglib.card.*"%><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.CSManager" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler" %><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf"%><%

if (!workspace.isCollaborativeSpace()) {
  sendRedirect("index.jsp");
  return;
}
if (!CSManager.getInstance().canManageCSServices(loggedMember, workspace)) {
  sendForbidden(request, response);
  return;
}

request.setAttribute(CSManager.EDIT_SERVICES_REQUEST_FLAG, Boolean.TRUE);
 

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="id" value='<%= portal.getId() %>'/><%
%></jsp:useBean>
<%

if (formHandler.validate()) {
  return;
}

formHandler.addFrontEndDependencies();
%>

<jalios:app name="services has-no-sidebar">
	<jalios:appMain>
		<div class="cs-services">
		    <form method="POST" >
			    <div class="navbar navbar-default no-navbar-brand" role="navigation">
			      <div class="container-fluid">
			      
              <div class="navbar-form navbar-left">
                <% if(formHandler.showCreateNewApplicationButton()){ %>
						      <jalios:buttonModal css="btn btn-default"
						                          label="jcmsplugin.collaborativespace.services.lbl.add-modal-title"
						                            url="plugins/CollaborativeSpacePlugin/jsp/doAddApplicationServiceModal.jsp" 
						                            icon="jcmsplugin-collaborativespace-add-services" />
					       <% } %>
					  
					  
					        <div class="select2-noinput has-filter">
		                <jalios:control  settings='<%= formHandler.getApplicationFilterSettings() %>' />
		             </div>
					 
		
					    
					          <div class="select2-noinput has-filter">
								      <jalios:control  settings='<%= formHandler.getPortalElementTypesSettings() %>' />
								    </div>
					     </div>
					     
					      <div class="navbar-form navbar-right">
					        <jalios:field resource="field-light">
					          <jalios:control settings='<%= formHandler.getSearchFieldSettings() %>' />
					        </jalios:field>
					      </div>
					      
			      </div>
			    </div>
		    </form>
		    
		    <jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/doServiceList.jsp" />
		</div>
	</jalios:appMain>
</jalios:app>
