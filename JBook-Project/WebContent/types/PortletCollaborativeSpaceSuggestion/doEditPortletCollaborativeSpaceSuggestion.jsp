<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletCollaborativeSpaceSuggestion content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletCollaborativeSpaceSuggestionHandler formHandler = (EditPortletCollaborativeSpaceSuggestionHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletCollaborativeSpaceSuggestion.class);
%>
<%-- Typology ------------------------------------------------------------ --%>
<jalios:field name="typology" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Threshold ------------------------------------------------------------ --%>
<jalios:field name="threshold" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- MaxItems ------------------------------------------------------------ --%>
<jalios:field name="maxItems" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- HideWhenNoResults ------------------------------------------------------------ --%>
<jalios:field name="hideWhenNoResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  itRemoveCat = channel.getCategory("$id.jcmsplugin.collaborativespace.typology-root");
  if (itRemoveCat != null){ removedCatSet.add(itRemoveCat);  }
  request.setAttribute("PortletCollaborativeSpaceSuggestion.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- VMvpkhUrvx2hafRrp6PnuA== --%>