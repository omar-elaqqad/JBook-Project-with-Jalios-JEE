<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletQueryForeachCards content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletQueryForeachCardsHandler formHandler = (EditPortletQueryForeachCardsHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletQueryForeachCards.class);
%>
<%-- CardsPerLine ------------------------------------------------------------ --%>
<jalios:field name="cardsPerLine" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CardCssClass ------------------------------------------------------------ --%>
<jalios:field name="cardCssClass" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/PortletQueryForeach/doEditPortletQueryForeach.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletQueryForeachCards.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- vDGlM3+wv54YHXNIln9gHQ== --%>