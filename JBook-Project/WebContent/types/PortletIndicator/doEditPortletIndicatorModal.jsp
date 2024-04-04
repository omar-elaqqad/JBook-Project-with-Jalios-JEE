<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletIndicator modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditPortletIndicatorHandler formHandler = (EditPortletIndicatorHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletIndicator.class);
%>
<%-- IndicatorType ------------------------------------------------------------ --%>
<jalios:field name="indicatorType" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Value ------------------------------------------------------------ --%>
<jalios:field name="value" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- TargetValue ------------------------------------------------------------ --%>
<jalios:field name="targetValue" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Percentage ------------------------------------------------------------ --%>
<jalios:field name="percentage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Label ------------------------------------------------------------ --%>
<jalios:field name="label" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Unit ------------------------------------------------------------ --%>
<jalios:field name="unit" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- PrimaryColor ------------------------------------------------------------ --%>
<jalios:field name="primaryColor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- SecondaryColor ------------------------------------------------------------ --%>
<jalios:field name="secondaryColor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Animation ------------------------------------------------------------ --%>
<jalios:field name="animation" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- BriefText ------------------------------------------------------------ --%>
<jalios:field name="briefText" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Metric ------------------------------------------------------------ --%>
<jalios:field name="metric" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- MetricParameters ------------------------------------------------------------ --%>
<jalios:field name="metricParameters" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- LinkType ------------------------------------------------------------ --%>
<jalios:field name="linkType" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- PublicationLink ------------------------------------------------------------ --%>
<jalios:field name="publicationLink" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Categorylink ------------------------------------------------------------ --%>
<jalios:field name="categorylink" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- LinkLabel ------------------------------------------------------------ --%>
<jalios:field name="linkLabel" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Picture ------------------------------------------------------------ --%>
<jalios:field name="picture" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletIndicator_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 6SPIPC6WLI6JTLhnEibdiA== --%>