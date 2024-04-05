<%-- This file has been automatically generated. --%>
<%--
  @Summary: DBComment modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditDBCommentHandler formHandler = (EditDBCommentHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.DBComment.class);
%>
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
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- TargetContent ------------------------------------------------------------ --%>
<jalios:field name="targetContent" formHandler="<%= formHandler %>">
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
<%-- PrivateComment ------------------------------------------------------------ --%>
<jalios:field name="privateComment" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- J0JCc+d+R+wrWKEEJ8NvRA== --%>