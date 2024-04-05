<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<%
SmartPhonePortalEditorHandler formHandler = (SmartPhonePortalEditorHandler) request.getAttribute(SmartPhonePortalEditorHandler.FORMHANDLER_REQUEST_ATTR);
%>
<div class="sidebar-tab-title">EDIT</div>
<div class="portal-sidebar-group">
  <jalios:include jsp="<%= formHandler.getPortletEditTemplatePath() %>" />
  <% EditPortalElementHandler genericFormHandler = (EditPortalElementHandler) request.getAttribute("formHandler"); %>
  <input type="hidden" name="cids" value="" />
</div>
<div class="buttons">
  <a class="btn btn-default" data-jalios-jmobile-portal-action="cancelPortletOperation"><%= glp("ui.com.btn.cancel") %></a>
  <button data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doEditSmartPhonePortletSidebar.jsp" class="btn btn-primary btn-create" name="opUpdate" value="true" data-jalios-action="ajax-refresh"><%= glp("ui.com.btn.save") %></button>
  <%@ include file='/plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doPortalLangChooser.jspf' %>
</div>  