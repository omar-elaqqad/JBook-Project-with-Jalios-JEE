<%-- This file has been automatically generated. --%>
<%--
  @Summary: MemberProfile content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditMemberProfileHandler formHandler = (EditMemberProfileHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.MemberProfile.class);
%>
<%-- Introduction ------------------------------------------------------------ --%>
<jalios:field name="introduction" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Interest ------------------------------------------------------------ --%>
<jalios:field name="interest" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DateOfBirth ------------------------------------------------------------ --%>
<jalios:field name="dateOfBirth" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DateOfArrival ------------------------------------------------------------ --%>
<jalios:field name="dateOfArrival" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("MemberProfile.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- HVPKJXuPab6PN81TY4otLw== --%>