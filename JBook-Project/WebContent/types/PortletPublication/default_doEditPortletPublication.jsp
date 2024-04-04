<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletPublication content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletPublicationHandler formHandler = (EditPortletPublicationHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletPublication.class);
%>
<%-- Pub ------------------------------------------------------------ --%>
<jalios:field name="pub" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Template ------------------------------------------------------------ --%>
<jalios:field name="template" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowDisplayHeader ------------------------------------------------------------ --%>
<jalios:field name="showDisplayHeader" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowDisplayFooter ------------------------------------------------------------ --%>
<jalios:field name="showDisplayFooter" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletPublication.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- P+hqVohpaf4T4tUQXwXwmw== --%>