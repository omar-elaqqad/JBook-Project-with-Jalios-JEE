<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletMemberProfile content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletMemberProfileHandler formHandler = (EditPortletMemberProfileHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletMemberProfile.class);
%>
<%-- ShowSuggestions ------------------------------------------------------------ --%>
<jalios:field name="showSuggestions" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowConnectionRequests ------------------------------------------------------------ --%>
<jalios:field name="showConnectionRequests" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletMemberProfile.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- /axP0Xk3c1tnIv+2UIpsjA== --%>