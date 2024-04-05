<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletCollaborativeSpaceSuggestion modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditPortletCollaborativeSpaceSuggestionHandler formHandler = (EditPortletCollaborativeSpaceSuggestionHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletCollaborativeSpaceSuggestion.class);
%>
<%-- Typology ------------------------------------------------------------ --%>
<jalios:field name="typology" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Threshold ------------------------------------------------------------ --%>
<jalios:field name="threshold" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- MaxItems ------------------------------------------------------------ --%>
<jalios:field name="maxItems" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- HideWhenNoResults ------------------------------------------------------------ --%>
<jalios:field name="hideWhenNoResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletCollaborativeSpaceSuggestion_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- +hFnnH1hwn6m/Y10K6MywA== --%>