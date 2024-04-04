<%@page import="com.jalios.jcms.jportal.handler.JPortalFrontFilesHandler"%>
<%@page import="com.jalios.jcms.jportal.component.*"%>
<%@ page contentType="text/html; charset=UTF-8"%><%--
--%><%@ include file="/jcore/doInitPage.jspf"%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.handler.JPortalFrontFilesHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<%
if(!formHandler.canUploadJPortalFrontFiles()){
  return;
}

formHandler.validate();
%>

<div class="ajax-refresh-div jportal-front-files-uploader" 
		 data-jalios-ajax-refresh-url="jcore/jportal/portalSidebar/doJPortalFrontFilesUploader.jsp">
	 <form method="post" accept-charset='UTF-8' enctype='multipart/form-data'>
			<input type="hidden" name="jPortal" value="<%= formHandler.getAvailableJPortal().getId() %>" />
			<input type="hidden" name="fileExtension" value="<%= formHandler.getFileExtension() %>" />
			<jalios:field name="currentFiles" value="<%= formHandler.getCurrentFileIds() %>" label="<%= formHandler.getSectionLabel() %>" mv="1" resource="field-vertical">
		    <jalios:control settings="<%= new PublicationSettings().superType(FileDocument.class).disableDropdown().disableFileInput() %>" />
		  </jalios:field>
			<jalios:field name="frontFiles" resource="field-vertical"> 
			  <jalios:control type="<%= ControlType.FILE %>" /> 
			</jalios:field>
		<div class="front-files-validate-wrapper">
    	<button data-jalios-action="ajax-refresh" type="submit" name="opUpdateFrontFiles" value="true" class="btn btn-primary plupload-submit">
    		<%= glp("ui.com.btn.update") %>
    	</button>
  	</div>
  </form>
	<%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>