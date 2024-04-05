<%-- This file has been automatically generated. --%>
<%--
  @Summary: SmartPhonePortal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditSmartPhonePortalHandler formHandler = (EditSmartPhonePortalHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.SmartPhonePortal.class);
%>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Structure ------------------------------------------------------------ --%>
<jalios:field name="structure" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Portlets ------------------------------------------------------------ --%>
<jalios:field name="portlets" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DisplayScrollToTop ------------------------------------------------------------ --%>
<jalios:field name="displayScrollToTop" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- PageTitle ------------------------------------------------------------ --%>
<jalios:field name="pageTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Image ------------------------------------------------------------ --%>
<jalios:field name="image" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Css ------------------------------------------------------------ --%>
<jalios:field name="css" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("SmartPhonePortal.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- xBe2VlZvMuihg/QEvYRwEg== --%>