<%--
  @Summary: PortletMyCollaborativeSpaces Subspace list
  @Category: Custom
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com> 
  @Since: csp-4.3, csp-5.0 
--%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.guest.selector.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

if (portlet == null) {
  return;
}
if (!isLogged) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}
// Not a collaborative Space ?
if (workspace == null || ! workspace.isCollaborativeSpace()) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-my-spaces.css");

String url = "types/PortletMyCollaborativeSpaces/doPortletMyCollaborativeSpacesHierarchicalFullDisplayItembox.jsp";
CSManager csMgr = CSManager.getInstance();
String csTypoParam = "cstypology_" + JcmsUtil.getId(portlet);
Category typoCat = getCategoryParameter(csTypoParam);

String typoFormAction = url;
%><%@ include file='/types/PortletMyCollaborativeSpaces/hierarchical/doHierarchicalFooter.jspf' %><%
%><%@ include file='/types/PortletMyCollaborativeSpaces/doSubCsTree.jspf' %>
