<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletWorkflow content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletWorkflowHandler formHandler = (EditPortletWorkflowHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletWorkflow.class);
%>
<%-- Queries ------------------------------------------------------------ --%>
<jalios:field name="queries" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- MaximumItemsPerWorkspace ------------------------------------------------------------ --%>
<jalios:field name="maximumItemsPerWorkspace" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- OrderBy ------------------------------------------------------------ --%>
<jalios:field name="orderBy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- HideWhenNoResults ------------------------------------------------------------ --%>
<jalios:field name="hideWhenNoResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- PageSizes ------------------------------------------------------------ --%>
<jalios:field name="pageSizes" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- PagerAllLimit ------------------------------------------------------------ --%>
<jalios:field name="pagerAllLimit" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DisplayCSWorkspacePublication ------------------------------------------------------------ --%>
<jalios:field name="displayCSWorkspacePublication" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletWorkflow.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- JoVyxmpsnsYfABLy5GcIjg== --%>