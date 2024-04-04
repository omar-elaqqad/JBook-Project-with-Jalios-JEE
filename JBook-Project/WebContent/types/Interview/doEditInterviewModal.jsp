<%-- This file has been automatically generated. --%>
<%--
  @Summary: Interview modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditInterviewHandler formHandler = (EditInterviewHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.Interview.class);
%>
<%-- Summary ------------------------------------------------------------ --%>
<jalios:field name="summary" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Intro ------------------------------------------------------------ --%>
<jalios:field name="intro" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Bio ------------------------------------------------------------ --%>
<jalios:field name="bio" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Questions ------------------------------------------------------------ --%>
<jalios:field name="questions" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Answers ------------------------------------------------------------ --%>
<jalios:field name="answers" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- QuestionPrefix ------------------------------------------------------------ --%>
<jalios:field name="questionPrefix" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- AnswerPrefix ------------------------------------------------------------ --%>
<jalios:field name="answerPrefix" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Photo ------------------------------------------------------------ --%>
<jalios:field name="photo" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Yx1hE/nIEPqLv1xV9yjchA== --%>