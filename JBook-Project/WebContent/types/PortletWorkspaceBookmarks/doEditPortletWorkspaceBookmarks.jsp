<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletWorkspaceBookmarks content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletWorkspaceBookmarksHandler formHandler = (EditPortletWorkspaceBookmarksHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletWorkspaceBookmarks.class);
%>
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletWorkspaceBookmarks.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- f0jwwQ0JiCvvEn+loSI6PQ== --%>