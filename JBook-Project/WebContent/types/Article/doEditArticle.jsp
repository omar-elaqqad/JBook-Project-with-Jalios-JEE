<%-- This file has been automatically generated. --%>
<%--
  @Summary: Article content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditArticleHandler formHandler = (EditArticleHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.Article.class);
%>
<%-- Summary ------------------------------------------------------------ --%>
<jalios:field name="summary" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Intro ------------------------------------------------------------ --%>
<jalios:field name="intro" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Picture ------------------------------------------------------------ --%>
<jalios:field name="picture" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- PictureAlt ------------------------------------------------------------ --%>
<jalios:field name="pictureAlt" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Content ------------------------------------------------------------ --%>
<jalios:field name="content" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- RelatedContents ------------------------------------------------------------ --%>
<jalios:field name="relatedContents" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("Article.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- WOuLEve7Pt9S0RI860tg6Q== --%>