<%-- This file has been automatically generated. --%>
<%--
  @Summary: Blog content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditBlogHandler formHandler = (EditBlogHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.Blog.class);
%>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- BloggerGroup ------------------------------------------------------------ --%>
<jalios:field name="bloggerGroup" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("Blog.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- ZkpkbhqjH5Tr9TUzPN0VWA== --%>