<%-- This file has been automatically generated. --%>
<%--
  @Summary: GlossaryEntry modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditGlossaryEntryHandler formHandler = (EditGlossaryEntryHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.GlossaryEntry.class);
%>
<%-- Definition ------------------------------------------------------------ --%>
<jalios:field name="definition" formHandler="<%= formHandler %>">
  <jalios:control settings='<%= new WysiwygSettings().configurationId("light").rows(3) %>' />
</jalios:field>
<%-- SeeAlso ------------------------------------------------------------ --%>
<jalios:field name="seeAlso" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Glossary ------------------------------------------------------------ --%>
<jalios:field name="glossary" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- MrcHJ3pdLEogkwqcRfm2FA== --%>