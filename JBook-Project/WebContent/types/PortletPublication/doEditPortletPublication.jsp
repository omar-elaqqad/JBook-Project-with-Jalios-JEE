<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletPublicationHandler formHandler = (EditPortletPublicationHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletPublication.class);
%>
<%-- Pub ------------------------------------------------------------ --%>
<jalios:include jsp="types/PortletPublication/updatePublicationTemplate.jsp" />
<div>
<%-- ShowDisplayHeader ------------------------------------------------------------ --%>
  <jalios:field name="showDisplayHeader" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
 
<%-- ShowDisplayFooter ------------------------------------------------------------ --%>
  <jalios:field name="showDisplayFooter" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
</div>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletPublication.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %>