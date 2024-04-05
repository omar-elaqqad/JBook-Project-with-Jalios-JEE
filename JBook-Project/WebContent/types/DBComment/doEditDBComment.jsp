<%-- This file has been automatically generated. --%>
<%--
  @Summary: DBComment content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@page import="com.jalios.jcmsplugin.dbcomment.DBCommentManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditDBCommentHandler formHandler = (EditDBCommentHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.DBComment.class);
  
  boolean displayPrivateCommentFields = false;
  
  boolean showAnonymousCommentFields = formHandler.showAnonymousCommentFields() && !Util.toBoolean(request.getAttribute("jcmsplugin.dbcomment.hide-anonymous-fields"),false);
  
%>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- TargetContent ------------------------------------------------------------ --%>
<jalios:field name="targetContent" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% if (showAnonymousCommentFields) { %>
<%-- Name ------------------------------------------------------------ --%>
<jalios:field name="name" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Email ------------------------------------------------------------ --%>
<jalios:field name="email" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- WebSite ------------------------------------------------------------ --%>
<jalios:field name="webSite" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- IpAddress ------------------------------------------------------------ --%>
<jalios:field name="ipAddress" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- UserAgent ------------------------------------------------------------ --%>
<jalios:field name="userAgent" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Referer ------------------------------------------------------------ --%>
<jalios:field name="referer" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% } %>
<% if (DBCommentManager.getInstance().canPublishPrivateComment(loggedMember)) { %>
  <%-- PrivateComment ------------------------------------------------------------ --%>
  <jalios:field name="privateComment" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
<% } %>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("DBComment.removedCatSet", removedCatSet);
}  
%>
<input type="hidden" name="opComment" value="true"/>  
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %>

