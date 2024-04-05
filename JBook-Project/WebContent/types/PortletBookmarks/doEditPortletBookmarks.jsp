<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletBookmarks content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletBookmarksHandler formHandler = (EditPortletBookmarksHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletBookmarks.class);
%>
<%-- OpenLinksInNewWindow ------------------------------------------------------------ --%>
<jalios:field name="openLinksInNewWindow" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletBookmarks.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 9ykweycIOkDMl88+aPlZmw== --%>