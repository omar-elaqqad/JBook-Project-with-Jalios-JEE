<%-- This file has been automatically generated. --%>
<%--
  @Summary: FaqEntry modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditFaqEntryHandler formHandler = (EditFaqEntryHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.FaqEntry.class);
%>
<%-- Answer ------------------------------------------------------------ --%>
<jalios:field name="answer" formHandler="<%= formHandler %>">
  <jalios:control settings='<%= new WysiwygSettings().configurationId("light").rows(7) %>' />
</jalios:field>
<%-- Faq ------------------------------------------------------------ --%>
<jalios:field name="faq" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- BSZhQ6OdE7kuKrgn2WB6kQ== --%>