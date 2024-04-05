<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletMemberActivity content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletMemberActivityHandler formHandler = (EditPortletMemberActivityHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletMemberActivity.class);
%>
<%-- ActivityMode ------------------------------------------------------------ --%>
<jalios:field name="activityMode" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowAbstract ------------------------------------------------------------ --%>
<jalios:field name="showAbstract" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowMedia ------------------------------------------------------------ --%>
<jalios:field name="showMedia" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowComments ------------------------------------------------------------ --%>
<jalios:field name="showComments" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DisplayAllEvent ------------------------------------------------------------ --%>
<jalios:field name="displayAllEvent" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Filters ------------------------------------------------------------ --%>
<jalios:field name="filters" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DefaultPageSize ------------------------------------------------------------ --%>
<jalios:field name="defaultPageSize" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletMemberActivity.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- rYjU1OZ3OX2bx4IFxO3s3A== --%>