<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletCarousel content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletCarouselHandler formHandler = (EditPortletCarouselHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletCarousel.class);
%>
<%-- Autoplaycarousel ------------------------------------------------------------ --%>
<jalios:field name="autoplaycarousel" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Arrows ------------------------------------------------------------ --%>
<jalios:field name="arrows" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Dots ------------------------------------------------------------ --%>
<jalios:field name="dots" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowTitle ------------------------------------------------------------ --%>
<jalios:field name="showTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowDate ------------------------------------------------------------ --%>
<jalios:field name="showDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowAuthor ------------------------------------------------------------ --%>
<jalios:field name="showAuthor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SlidesToShow ------------------------------------------------------------ --%>
<jalios:field name="slidesToShow" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- NumberOfLinesInTheTitle ------------------------------------------------------------ --%>
<jalios:field name="numberOfLinesInTheTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/PortletQueryForeach/doEditPortletQueryForeach.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletCarousel.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- aiJ91dcSVipY0ArCwTqsOg== --%>