<%-- This file has been automatically generated. --%>
<%--
  @Summary: CollaborativeSpace content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditCollaborativeSpaceHandler formHandler = (EditCollaborativeSpaceHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.CollaborativeSpace.class);
%>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Introduction ------------------------------------------------------------ --%>
<jalios:field name="introduction" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<% if(!formHandler.isPartialFieldEdition()) { %>
  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned">
    <li class='active'><a href="#CollaborativeSpace_access_tab" onclick="return false;"><%= formHandler.getTabLabel("access") %></a></li>
    <li><a href="#CollaborativeSpace_layout_tab" onclick="return false;"><%= formHandler.getTabLabel("layout") %></a></li>
    <li><a href="#CollaborativeSpace_portal_tab" onclick="return false;"><%= formHandler.getTabLabel("portal") %></a></li>
    
  </ul>
<% } %>
<div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="CollaborativeSpace_access_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane active'" : "" %>>
<%-- AccessPolicy ------------------------------------------------------------ --%>
<jalios:field name="accessPolicy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SignupPolicy ------------------------------------------------------------ --%>
<jalios:field name="signupPolicy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- FollowersGroup ------------------------------------------------------------ --%>
<jalios:field name="followersGroup" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="CollaborativeSpace_layout_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- Layout ------------------------------------------------------------ --%>
<jalios:field name="layout" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DashboardColumnCount ------------------------------------------------------------ --%>
<jalios:field name="dashboardColumnCount" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Theme ------------------------------------------------------------ --%>
<jalios:field name="theme" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Header ------------------------------------------------------------ --%>
<jalios:field name="header" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- HeaderSettings ------------------------------------------------------------ --%>
<jalios:field name="headerSettings" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ExactCategory ------------------------------------------------------------ --%>
<jalios:field name="exactCategory" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- MobileShowIntro ------------------------------------------------------------ --%>
<jalios:field name="mobileShowIntro" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- MobileShowApplications ------------------------------------------------------------ --%>
<jalios:field name="mobileShowApplications" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="CollaborativeSpace_portal_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- Jportal ------------------------------------------------------------ --%>
<jalios:field name="jportal" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SyncMode ------------------------------------------------------------ --%>
<jalios:field name="syncMode" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ModelSyncMode ------------------------------------------------------------ --%>
<jalios:field name="modelSyncMode" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Model ------------------------------------------------------------ --%>
<jalios:field name="model" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Applications ------------------------------------------------------------ --%>
<jalios:field name="applications" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- MobilePortlets ------------------------------------------------------------ --%>
<jalios:field name="mobilePortlets" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div>
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractCollaborativeSpace/doEditAbstractCollaborativeSpace.jsp" />
 
</div><%-- End 'tab-content' --%>
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("CollaborativeSpace.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- GcYSVFkD12ttSFa18O9eDw== --%>