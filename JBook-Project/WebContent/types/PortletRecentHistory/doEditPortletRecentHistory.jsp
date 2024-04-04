<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletRecentHistory content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletRecentHistoryHandler formHandler = (EditPortletRecentHistoryHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletRecentHistory.class);
%>
<%-- HistorySize ------------------------------------------------------------ --%>
<jalios:field name="historySize" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- PageSize ------------------------------------------------------------ --%>
<jalios:field name="pageSize" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- FilterOnCurrentWorkspace ------------------------------------------------------------ --%>
<jalios:field name="filterOnCurrentWorkspace" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletRecentHistory.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- U7UuYySN4lPlqiwo4q5iTw== --%>