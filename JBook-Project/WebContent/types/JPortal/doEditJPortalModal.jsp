<%-- This file has been automatically generated. --%>
<%--
  @Summary: JPortal modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditJPortalHandler formHandler = (EditJPortalHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.JPortal.class);
%>
<%-- PageTitle ------------------------------------------------------------ --%>
<jalios:field name="pageTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Keywords ------------------------------------------------------------ --%>
<jalios:field name="keywords" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- PortletImage ------------------------------------------------------------ --%>
<jalios:field name="portletImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- BehaviorCopy ------------------------------------------------------------ --%>
<jalios:field name="behaviorCopy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- CssId ------------------------------------------------------------ --%>
<jalios:field name="cssId" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- CssClasses ------------------------------------------------------------ --%>
<jalios:field name="cssClasses" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- CacheType ------------------------------------------------------------ --%>
<jalios:field name="cacheType" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- CacheSensibility ------------------------------------------------------------ --%>
<jalios:field name="cacheSensibility" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- InvalidClass ------------------------------------------------------------ --%>
<jalios:field name="invalidClass" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- InvalidTime ------------------------------------------------------------ --%>
<jalios:field name="invalidTime" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ExactCategory ------------------------------------------------------------ --%>
<jalios:field name="exactCategory" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DisplayTopbar ------------------------------------------------------------ --%>
<jalios:field name="displayTopbar" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DisplayScrollToTop ------------------------------------------------------------ --%>
<jalios:field name="displayScrollToTop" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Css ------------------------------------------------------------ --%>
<jalios:field name="css" formHandler="<%= formHandler %>">
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
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- VXcERlSD6AcIiTC+jEb00A== --%>