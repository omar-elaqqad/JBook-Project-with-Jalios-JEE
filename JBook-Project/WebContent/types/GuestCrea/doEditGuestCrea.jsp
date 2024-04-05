<%-- This file has been automatically generated. --%>
<%--
  @Summary: GuestCrea content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditGuestCreaHandler formHandler = (EditGuestCreaHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.GuestCrea.class);
%>
<%-- Name ------------------------------------------------------------ --%>
<jalios:field name="name" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Firstname ------------------------------------------------------------ --%>
<jalios:field name="firstname" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Email ------------------------------------------------------------ --%>
<jalios:field name="email" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Organization ------------------------------------------------------------ --%>
<jalios:field name="organization" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Language ------------------------------------------------------------ --%>
<jalios:field name="language" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Country ------------------------------------------------------------ --%>
<jalios:field name="country" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/GuestRequest/doEditGuestRequest.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("GuestCrea.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- LuX/lDmKUc9YPTv84pWUzw== --%>