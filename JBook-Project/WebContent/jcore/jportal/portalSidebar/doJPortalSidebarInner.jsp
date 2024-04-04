<%@page import="com.jalios.jcms.jportal.component.*"%>
<%@ page contentType="text/html; charset=UTF-8"%><%--
--%><%@ include file="/jcore/doInitPage.jspf"%><%--
--%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%

JPortal jPortal = (JPortal) formHandler.getAvailableJPortal();

if (jPortal == null) {
  jPortal = (JPortal) jcmsContext.getAjaxRequestAttribute("jPortal");
}

if (jPortal == null) {
  return;
} 

boolean isJPortalEdition = getBooleanParameter("jportalEdition", false);
jcmsContext.setAjaxRequestAttribute("jPortal", jPortal);
request.setAttribute("is-main-block", true);
request.setAttribute("jportalEditorHandler", formHandler);
boolean isSkinablePortlet = channel.getPublication(formHandler.getPortletId()) instanceof AbstractPortletSkinable;
%>
<div class="ajax-refresh-div jportal-sidebar" data-jalios-ajax-refresh-url="jcore/jportal/portalSidebar/doJPortalSidebarInner.jsp">
  <div class="sidebar-tab-content tab-content sidebar-index">
		<div id="ADD_COMPONENT" class="tab-pane fade <%= !isJPortalEdition ? " active in" : ""  %>">
		  <%@ include file='/jcore/jportal/portalSidebar/doJPortalSidebarInnerTab_components.jspf' %>
		</div>
    <div id="JPORTAL_EDIT" class="tab-pane fade <%= isJPortalEdition ? " active in" : ""  %>">
      <%@ include file='/jcore/jportal/portalSidebar/doJPortalSidebarInnerTab_edit.jspf' %>
    </div>		
    <div id="UI" class="tab-pane fade">
      <%@ include file='/jcore/jportal/portalSidebar/doJPortalSidebarInnerTab_ui.jspf' %>
    </div>   
	</div>
	<%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>