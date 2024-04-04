<%--
  @Summary: [Abstract] Basic Collection content editor
  @Customizable: True
  @Requestable: False
--%><%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
EditAbstractCollectionHandler formHandler = (EditAbstractCollectionHandler)request.getAttribute("formHandler"); 
if (Util.toBoolean(request.getAttribute(JPortalEditorHandler.PORTLET_EDITION_REQUEST_ATTR), false)) {
  return;
}
%><%@ include file='/jcore/portal/doEditCommonPortlet.jspf' %>