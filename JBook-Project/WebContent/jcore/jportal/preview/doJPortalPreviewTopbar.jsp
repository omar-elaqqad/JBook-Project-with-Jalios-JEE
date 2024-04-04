<%@page import="com.jalios.jcms.jportal.JPortalStructure"%>
<%@page import="com.jalios.jcms.jportal.JPortalManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<% 
JPortal jPortal = (JPortal) formHandler.getAvailableJPortal();

if (jPortal == null) {
  jPortal = (JPortal) jcmsContext.getAjaxRequestAttribute("jPortal");
}

if (jPortal == null) {
  return;
} 
%>


<svg class="topbar-pull js-toggle-topbar" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 56 23">
  <path class="topbar-pull-shape" d="M48.63,4.38A9.85,9.85,0,0,1,56,0H0A9.85,9.85,0,0,1,7.37,4.38C10.58,9.2,13.11,18,28,18S45.42,9.2,48.63,4.38Z"/>
  <rect class="topbar-pull-handle" width="6px" height="2px" x="29" y="8" rx="1" ry="1" transform="translate(41 -23) rotate(90)"/>
  <rect class="topbar-pull-handle" width="6px" height="2px" x="25" y="8" rx="1" ry="1" transform="translate(37 -19) rotate(90)"/>
  <rect class="topbar-pull-handle" width="6px" height="2px" x="21" y="8" rx="1" ry="1" transform="translate(33 -15) rotate(90)"/>
</svg>
<div class="jportal-topbar">
  <div class="jportal-navigation jportal-topbar-left">
	  <a class="jportal-name jportal-navigation-item js-jportal-preview-close" href="jcore/jportal/edition/jportalEdition.jsp?jPortal=<%= jPortal.getId()%>"><%= jPortal.getTitle(userLang) %></a>
	  <div class="jportal-navigation-item"><%= glp("jportal.edition.preview.label") %></div>
	</div> 
	<div class="jportal-topbar-center">
	  <a class="jportal-tooltip js-jportal-preview-mode-smartphone btn btn-default"
	     data-toggle="tooltip" data-placement="bottom" title='<%= glp("jportal.preview.emulate.phone.label")%>'>
	    <jalios:icon src="jportal-preview-mode-smartphone" />  
	  </a>
	  <a class="jportal-tooltip js-jportal-preview-mode-tablet btn btn-default"
	     data-toggle="tooltip" data-placement="bottom" title='<%= glp("jportal.preview.emulate.tablet.label")%>'>
      <jalios:icon src="jportal-preview-mode-tablet" />  
    </a>
    <a class="jportal-tooltip js-jportal-preview-mode-screen btn btn-default" 
    data-toggle="tooltip" data-placement="bottom" title='<%= glp("jportal.preview.emulate.screen.label")%>'>
      <jalios:icon src="jportal-preview-mode-screen" />  
    </a>
    <a class="jportal-tooltip js-jportal-preview-mode-largescreen btn btn-default is-active" 
    data-toggle="tooltip" data-placement="bottom" title='<%= glp("jportal.preview.emulate.largescreen.label")%>'>
      <jalios:icon src="jportal-preview-mode-largescreen" />  
    </a>
    
    <a class="jportal-tooltip js-jportal-preview-mode-rotate disabled jportal-preview-mode-rotate btn btn-default" 
    data-toggle="tooltip" data-placement="bottom" title='<%= glp("jportal.preview.emulate.rotate.label")%>'>
      <jalios:icon src="jportal-preview-mode-rotate" />  
    </a>
	</div>
  <div class="jportal-topbar-right">
    <!-- 
    <a class="js-jportal-see-as btn-see-jportal-as btn btn-default" href="#">
      Voir le portail en tant que
      <jalios:field resource="field-light">
        <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
      </jalios:field>
    </a>
    -->  
    <a class="js-jportal-preview-close btn btn-default" href="jcore/jportal/edition/jportalEdition.jsp?jPortal=<%= jPortal.getId()%>">
      <%= glp("jportal.edition.history.back-edition.label") %>
    </a>
  </div>
  
</div>
