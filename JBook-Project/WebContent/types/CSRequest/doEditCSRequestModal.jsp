<%-- This file has been automatically generated. --%>
<%--
  @Summary: CSRequest modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditCSRequestHandler formHandler = (EditCSRequestHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.CSRequest.class);
%>
<%-- Name ------------------------------------------------------------ --%>
<jalios:field name="name" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- AccessPolicy ------------------------------------------------------------ --%>
<jalios:field name="accessPolicy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- SignupPolicy ------------------------------------------------------------ --%>
<jalios:field name="signupPolicy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Model ------------------------------------------------------------ --%>
<jalios:field name="model" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Language ------------------------------------------------------------ --%>
<jalios:field name="language" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Admins ------------------------------------------------------------ --%>
<jalios:field name="admins" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Groups ------------------------------------------------------------ --%>
<jalios:field name="groups" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Members ------------------------------------------------------------ --%>
<jalios:field name="members" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- NotificationPolicy ------------------------------------------------------------ --%>
<jalios:field name="notificationPolicy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Parent ------------------------------------------------------------ --%>
<jalios:field name="parent" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- SyncMode ------------------------------------------------------------ --%>
<jalios:field name="syncMode" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- TanFPs1oGinn+KJ6M93YEA== --%>