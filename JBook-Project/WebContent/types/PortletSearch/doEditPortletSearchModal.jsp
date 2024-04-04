<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletSearch modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditPortletSearchHandler formHandler = (EditPortletSearchHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletSearch.class);
%>
<ul class="nav nav-tabs">
<li ><a href="#PortletSearch_text_tab" onclick="return false;"><%= formHandler.getTabLabel("text") %></a></li>
<li ><a href="#PortletSearch_advanced_tab" onclick="return false;"><%= formHandler.getTabLabel("advanced") %></a></li>
</ul>
<%-- TitleText ------------------------------------------------------------ --%>
<jalios:field name="titleText" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<div class="tab-content jalios-tab-template clearfix"><div id="PortletSearch_text_tab" class='tab-pane '>
<%-- SearchWith ------------------------------------------------------------ --%>
<jalios:field name="searchWith" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- SearchIn ------------------------------------------------------------ --%>
<jalios:field name="searchIn" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletSearch_advanced_tab" class='tab-pane '>
<%-- InstantSearch ------------------------------------------------------------ --%>
<jalios:field name="instantSearch" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Query ------------------------------------------------------------ --%>
<jalios:field name="query" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- RefineQueries ------------------------------------------------------------ --%>
<jalios:field name="refineQueries" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- QueryPortlet ------------------------------------------------------------ --%>
<jalios:field name="queryPortlet" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DisplayPortal ------------------------------------------------------------ --%>
<jalios:field name="displayPortal" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- AdvancedSearchPortlet ------------------------------------------------------------ --%>
<jalios:field name="advancedSearchPortlet" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div>
</div><div id="PortletSearch_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- OJTp4OH5aWLgcGY96k06Mg== --%>