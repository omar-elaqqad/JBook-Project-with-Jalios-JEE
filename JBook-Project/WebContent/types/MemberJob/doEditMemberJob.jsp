<%-- This file has been automatically generated. --%>
<%--
  @Summary: MemberJob content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditMemberJobHandler formHandler = (EditMemberJobHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.MemberJob.class);
%>
<%-- Organization ------------------------------------------------------------ --%>
<jalios:field name="organization" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Place ------------------------------------------------------------ --%>
<jalios:field name="place" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Site ------------------------------------------------------------ --%>
<jalios:field name="site" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- StartDate ------------------------------------------------------------ --%>
<jalios:field name="startDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- EndDate ------------------------------------------------------------ --%>
<jalios:field name="endDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("MemberJob.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- PebhMJWahwXHEAFpiynxTA== --%>