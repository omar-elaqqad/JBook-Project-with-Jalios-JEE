<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletQueryForeachCards modal content editor
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
</div><div id="PortletQueryForeachCards_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/PortletQueryForeach/doEditPortletQueryForeachModal.jsp" />
</div>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- z7M31qMSq3eA5y6n4a6j8A== --%>