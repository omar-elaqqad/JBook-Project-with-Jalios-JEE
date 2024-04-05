<%-- This file has been automatically generated. --%>
<%--
  @Summary: GuestCrea modal content editor
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
</div><div id="GuestCrea_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/GuestRequest/doEditGuestRequestModal.jsp" />
</div>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- F7P7QBwoFIHJ6g7b9G4cHA== --%>