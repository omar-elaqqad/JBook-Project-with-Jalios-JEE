<%@ page contentType="text/html; charset=UTF-8"%><%--
--%><%@ include file="/jcore/doInitPage.jspf"%><%--
--%>
<%-- <a class="btn sidebar-close sidebar-closer " data-jalios-sidebar-action="close" data-jalios-sidebar-target=".jportal-editor-sidebar">
  <jalios:icon src="close-sidebar"/>
</a> --%>
<%
String jPortalId = getDataIdParameter("jPortal");
boolean isJPortalEdition = getBooleanParameter("jportalEdition", false);
boolean isPortletCreation = getBooleanParameter("createPortlet", false);
boolean displayReturnCaret = getBooleanParameter("displayReturnCaret", false);
%>
<div class="sidebar-header-icon">
	<% if(displayReturnCaret){ %>
		<a class="jportal-sidebar-home-link" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.header.back.title")) %>" 
		   data-jalios-sidebar-target=".jportal-editor-sidebar" data-jalios-sidebar-action="open" 
			 data-jalios-sidebar-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%= jPortalId %>">
				<jalios:icon src="jportal-sidebar-back" />
		</a>
	<% } %>
  <a class="" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.header.back.title")) %>" data-jalios-sidebar-target=".jportal-editor-sidebar" data-jalios-sidebar-action="open" data-jalios-sidebar-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%=jPortalId%>"><jalios:icon src="jportal-sidebar-header" /></a> 
</div>
<ul class="sidebar-tabs" role="tablist">
  <li role="presentation"<%= !isJPortalEdition ? " class=\"active\"" : "" %>>
    <a href="#ADD_COMPONENT" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab" title="<%= glp("jportal.edition.sidebar.jportal-edit.tab-add.title") %>">
     <jalios:icon src="jportal-sidebar-tab-components"/>
    </a>
  </li>
  <% if(!isPortletCreation){%> 
	  <li role="presentation"<%= isJPortalEdition ? " class=\"active\"" : "" %>>
	    <a href="#JPORTAL_EDIT" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.jportal-edit.tab-edit.title")) %>">
	     <jalios:icon src="jportal-sidebar-tab-jportal-edit"/>
	    </a>
	  </li>  
	  <li role="presentation" class="">
	    <a href="#UI" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.jportal-edit.tab-ui.title")) %>">
	     <jalios:icon src="jportal-sidebar-tab-ui"/>
	    </a>
	  </li> 
  <% } %>
</ul>
<div class="sidebar-body">
  <jalios:include jsp="/jcore/jportal/portalSidebar/doJPortalSidebarInner.jsp"/>
</div>