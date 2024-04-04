<%@page import="com.jalios.jcms.uicomponent.topbar.TopbarHandler"%>
<%@page import="com.jalios.jcms.jportal.*"%>
<%@page import="com.jalios.jcms.jportal.json.*"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jalios:include jsp="jcore/jportal/edition/jportalEditorHandler.jsp" />
<%
JPortalEditorHandler jportalEditorHandler = (JPortalEditorHandler) request.getAttribute("jportalEditorHandler");

JPortal jPortal = (JPortal) jportalEditorHandler.getAvailableJPortal();

if (jPortal == null || !isLogged) {
  return;
}
WebAssetsUtils.addScrollbarWebAssets(jcmsContext);
jportalEditorHandler.addFrontEndDependencies();
jportalEditorHandler.processAction();

/*
Send redirect to remove the reset history parameter from url
*/
if(jportalEditorHandler.isOpResetHistory()){
  sendRedirect("jcore/jportal/edition/jportalEdition.jsp?jPortal="+jPortal.getId());
  return;
}

%><%@ include file='/jcore/doEmptyHeader.jspf'%><%
JPortalStructure structure = (JPortalStructure) getDataParameter("structureId");
JPortalMapping mapping = jportalEditorHandler.getAvailableJPortalMapping();
%>
<div class="jportal-overlay is-active is-first-load">
	<div class="jportal-loading">
	  <div class="jportal-loading-item jportal-loading-item-1"></div>
	  <div class="jportal-loading-item jportal-loading-item-2"></div>
	  <div class="jportal-loading-item jportal-loading-item-3"></div>
	  <div class="jportal-loading-item jportal-loading-item-4"></div>
	</div>
</div>

<div class="jportal-edition hide">
	<jalios:include jsp="jcore/jportal/edition/doJPortalTopbar.jsp" />
  <jalios:include jsp='<%= TopbarHandler.getTopbarResource(TopbarHandler.Zone.FrontArea) %>' />
	<jalios:include jsp='<%= ResourceHelper.getSidebar() %>' />
	<div class="jportal-sidebar-component jportal-editor-sidebar is-closed sidebar-component sidebar-left sidebar-tabbed hide"
	     data-jalios-sidebar-overlay="false"
	     data-jalios-sidebar-direction="left">
  </div>

	<div class="jportal-wrapper is-edition-mode is-topbar-displayed"
	     data-jalios-jportal-id="<%= jPortal.getId() %>"
	     data-jalios-ui="<%= encodeForHTMLAttribute(jportalEditorHandler.getJPortalMappingUI()) %>">
	  <div class="jportal-sidebar-pull-toggler">
		  <a class="jportal-sidebar-opener jportal-sidebar-pull-open" data-jalios-sidebar-overlay="false" data-jalios-sidebar-action="open" data-jalios-sidebar-target=".jportal-editor-sidebar"><jalios:icon src="jportal-sidebar-open" /></a>
		  <a class="jportal-sidebar-pull-close"  data-jalios-sidebar-action="close" data-jalios-sidebar-target=".jportal-editor-sidebar"><jalios:icon src="jportal-sidebar-close"/></a>
	  </div>

	  <div class="jportal-wrapper-inner" data-jalios-cell-title="<%= encodeForHTMLAttribute(glp("jportal.edition.cell.title")) %>">
		  <% if (mapping == null) { %>
			  <jalios:message level="<%= MessageLevel.WARN %>">
			    <%= glp("jportal.edition.warning.no-structure") %>
			    <a class="btn btn-default modal" href="#?jPortalId=<%= jPortal.getId() %>"><%= glp("jportal.edition.action.choose-structure") %></a>
			  </jalios:message>
		  <% } else { %>
		    <div class="jportal-edition-menu">
				  <a class="jportal-sidebar-opener jportal-side-button"
				     data-jalios-sidebar-action="open"
				     data-jalios-sidebar-overlay="false"
				     data-jalios-sidebar-target=".jportal-editor-sidebar"
				     data-jalios-sidebar-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%= jPortal.getId() %>">
				    <jalios:icon src="plus" />
				  </a>
		    </div>
			  <div class="row">
			    <% for (JBlockMapping jBlock : mapping.getjBlocks()) { %>
		        <% request.setAttribute("jcms.jportal.jblock-mapping",jBlock); %>
		        <jalios:include jsp="types/JPortal/doJBlocksEdition.jsp" />
		        <% request.removeAttribute("jcms.jportal.jblock-mapping"); %>
			    <% } %>
			  </div>
		  <% } %>
	  </div>

	</div>
</div>

<script id="jportal-block" type="text/x-handlebars-template">
  <div class="jportal-block col-md-{{grid-md-size}}" data-id="{{block-id}}">

  </div>
</script>

<script id="block-portlet-dropdown-edit-item" type="text/x-handlebars-template">
  <div class="jportlet-edit jblock-menu"
       title="<%= encodeForHTMLAttribute(glp("jportal.edition.action.edit.title")) %>"
       data-jalios-sidebar-target=".jportal-editor-sidebar"
       data-jalios-sidebar-action="open"
       data-jalios-sidebar-url="jcore/jportal/portalSidebar/doJBlockEditionSidebar.jsp?blockId={{block-id}}&id={{portlet-id}}&portletId={{portlet-id}}&jPortal=<%= jportalEditorHandler.getAvailableJPortal().getId() %>">
         <jalios:icon src="jportal-jblock-menu-edit" />
  </div>
</script>

<script id="jportal-block-inner-template" type="text/x-handlebars-template">
  <div class="jportal-drop-block drop-right"></div>
  <div class="jportal-drop-block drop-left"></div>
  <div class="jportal-jblock-header">
    <div class="jportal-jblock-header-label jportal-bypass jportal-block-header">
      <span title="<%= encodeForHTMLAttribute(glp("jportal.edition.action.move.title")) %>"  class="js-handle icomoon-move"></span> <span class="block-title">Cell</span>
    </div>
    <div  class="jblock-edit jblock-menu"
        title="<%= encodeForHTMLAttribute(glp("jportal.edition.action.edit.title")) %>"
        data-jalios-sidebar-target=".jportal-editor-sidebar"
        data-jalios-sidebar-action="open"
        data-jalios-sidebar-url="jcore/jportal/portalSidebar/doJBlockEditionSidebar.jsp?blockId={{block-id}}&jPortal=<%= jportalEditorHandler.getAvailableJPortal().getId() %>">
          <jalios:icon src="jportal-jblock-menu-edit" />
    </div>
    <div title="<%= encodeForHTMLAttribute(glp("jportal.edition.action.delete.title")) %>" data-jalios-confirm-text="<%= encodeForHTMLAttribute(glp("jportal.edition.remove-block-confirm-text")) %>" class="jblock-delete jblock-menu"><jalios:icon src="jportal-jblock-menu-delete" /></div>
  </div>
  <div class="jportal-block-inner">

  </div>
</script>

<script id="jportal-structure" type="text/x-handlebars-template">
  <div class="container-fluid jportal-{{structure-type}}">

  </div>
</script>

<script id="jportlet" type="text/x-handlebars-template">
  <div class="jportlet">
    <div class="jportlet-title">{{title}}</div>
  </div>
</script>

<script id="jblock-drop-center" type="text/x-handlebars-template">
  <div class="jportal-drop-block drop-center"></div>
</script>

<script id="jportal-block-line" type="text/x-handlebars-template">
  <div class="jportal-block-line">
    <div class="jportal-drop-block drop-top"></div>
    <div class="jportal-drop-block drop-bottom"></div>
  </div>
</script>
<%@ include file='/jcore/doEmptyFooter.jspf'%>
