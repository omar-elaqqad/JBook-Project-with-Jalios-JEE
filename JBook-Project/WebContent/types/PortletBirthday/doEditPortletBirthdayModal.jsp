<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletBirthday modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditPortletBirthdayHandler formHandler = (EditPortletBirthdayHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletBirthday.class);
%>
<%-- WorkspaceMembers ------------------------------------------------------------ --%>
<jalios:field name="workspaceMembers" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- RelationshipFilter ------------------------------------------------------------ --%>
<jalios:field name="relationshipFilter" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletBirthday_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- M0vyEVT2L6PYnLfNqMRIwQ== --%>