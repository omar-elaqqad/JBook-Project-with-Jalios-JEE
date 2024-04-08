<%-- This file has been automatically generated. --%>
<%--
  @Summary: Book content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditBookHandler formHandler = (EditBookHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.Book.class);
%>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Image ------------------------------------------------------------ --%>
<jalios:field name="image" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Topics ------------------------------------------------------------ --%>
<jalios:field name="topics" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Isbn ------------------------------------------------------------ --%>
<jalios:field name="isbn" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  itRemoveCat = channel.getCategory("$id.jcmsplugin.jbook.catalog.topic-root");
  if (itRemoveCat != null){ removedCatSet.add(itRemoveCat);  }
  request.setAttribute("Book.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- vRFYChBzDli1Yy0p1xc9HQ== --%>