<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>

<div class="edition-sidebar sidebar-component sidebar-left sidebar-tabbed is-open" data-jalios-sidebar-overlay="false" data-jalios-sidebar-direction="left" >
  <div class="sidebar-header-icon">
    <a class="" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.header.back.title")) %>" data-jalios-jmobile-portal-action="cancelPortletOperation"
      ><jalios:icon src="glyph: icomoon-mobile2" />
    </a>
  </div>
  <ul class="sidebar-tabs" role="tablist">
    <li role="presentation" class="active">
      <a href="#ADD_PORTLET" data-toggle="tab" aria-controls="paths" role="tab" title='<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.jportal-edit.tab-add.title")) %>'>
        <jalios:icon src="jcmsplugin-smartphone-portal-editor-tab-add" />
      </a>
    </li>
    <li role="presentation">
      <a href="#PORTAL_EDIT" data-toggle="tab" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("portal.edition.sidebar.portal-edit.tab-edit.title")) %>">
        <jalios:icon src="jcmsplugin-smartphone-portal-editor-tab-portal-edition" />
      </a>
    </li>  
    <li role="presentation" class="">
      <a href="#UI" data-toggle="tab" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("portal.edition.sidebar.portal-edit.tab-ui.title")) %>">
        <jalios:icon src="jcmsplugin-smartphone-portal-editor-tab-portal-ui" />
      </a>
    </li>
  </ul>
  <div class="sidebar-body">
    <jalios:include jsp="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doPortalSidebarInner.jsp"/>
  </div>
</div>
<%@ include file='/jcore/doAjaxFooter.jspf' %>
