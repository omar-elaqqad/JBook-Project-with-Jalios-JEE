<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%
PortalElement portlet = (PortalElement) getPublicationParameter("editedPortlet");
JPortal jportal = (JPortal) getPublicationParameter("jportal");

String modalUrl = "jcore/jportal/simpleEdition/editPortletModal.jsp";
if (jportal.getWorkspace().isCollaborativeSpace() && !JcmsUtil.isSameId(jportal.getWorkspace(), portlet.getWorkspace())) {
  modalUrl = "plugins/CollaborativeSpacePlugin/jsp/portal/editPortletModal.jsp";
}
%><jalios:include jsp="<%= modalUrl %>" />