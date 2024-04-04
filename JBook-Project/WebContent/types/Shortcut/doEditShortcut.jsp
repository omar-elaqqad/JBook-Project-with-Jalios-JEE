<%-- This file has been automatically generated. --%>
<%--
  @Summary: Shortcut content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditShortcutHandler formHandler = (EditShortcutHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.Shortcut.class);
%>
<%-- Image ------------------------------------------------------------ --%>
<jalios:field name="image" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Icon ------------------------------------------------------------ --%>
<jalios:field name="icon" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Text ------------------------------------------------------------ --%>
<jalios:field name="text" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Link ------------------------------------------------------------ --%>
<jalios:field name="link" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Pub ------------------------------------------------------------ --%>
<jalios:field name="pub" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Parameters ------------------------------------------------------------ --%>
<jalios:field name="parameters" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Keywords ------------------------------------------------------------ --%>
<jalios:field name="keywords" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- OpenMode ------------------------------------------------------------ --%>
<jalios:field name="openMode" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowInToolsPage ------------------------------------------------------------ --%>
<jalios:field name="showInToolsPage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Type ------------------------------------------------------------ --%>
<jalios:field name="type" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  itRemoveCat = channel.getCategory("$id.application.shortcut.category");
  if (itRemoveCat != null){ removedCatSet.add(itRemoveCat);  }
  request.setAttribute("Shortcut.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- RAggSjBelKr01axU/unwNw== --%>