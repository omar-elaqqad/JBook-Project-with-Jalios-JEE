<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletMyCollaborativeSpaces content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletMyCollaborativeSpacesHandler formHandler = (EditPortletMyCollaborativeSpacesHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletMyCollaborativeSpaces.class);
%>
<%-- Depth ------------------------------------------------------------ --%>
<jalios:field name="depth" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- TypologyFilter ------------------------------------------------------------ --%>
<jalios:field name="typologyFilter" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletMyCollaborativeSpaces.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- tX/mIHvfPQITkC5nVF7TJQ== --%>