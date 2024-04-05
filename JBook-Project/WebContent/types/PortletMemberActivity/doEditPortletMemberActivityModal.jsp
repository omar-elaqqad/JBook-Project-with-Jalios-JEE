<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletMemberActivity modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditPortletMemberActivityHandler formHandler = (EditPortletMemberActivityHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletMemberActivity.class);
%>
<%-- ActivityMode ------------------------------------------------------------ --%>
<jalios:field name="activityMode" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ShowAbstract ------------------------------------------------------------ --%>
<jalios:field name="showAbstract" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ShowMedia ------------------------------------------------------------ --%>
<jalios:field name="showMedia" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ShowComments ------------------------------------------------------------ --%>
<jalios:field name="showComments" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DisplayAllEvent ------------------------------------------------------------ --%>
<jalios:field name="displayAllEvent" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Filters ------------------------------------------------------------ --%>
<jalios:field name="filters" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DefaultPageSize ------------------------------------------------------------ --%>
<jalios:field name="defaultPageSize" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletMemberActivity_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- h/tGP0+JqmspoS+qu3DxhQ== --%>