<%-- This file was automatically generated. --%><%
%><%--
  @Summary: Shortcut editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditShortcutHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name="formHandler" property="noRedirect" value="true" /><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% request.setAttribute("formHandler", formHandler); %><%
%><% if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getModalRedirect()); %><%
%><%@ include file="/jcore/modal/modalRedirect.jspf" %><% return; } %><%
%><% formHandler.prepare(); %>
<jalios:modal formHandler="<%= formHandler %>" url="types/Shortcut/editShortcutModal.jsp">
<div class="row Shortcut">
  
  <%-- Workspace -------------------------------------------------------- --%>
  <%@ include file="/jcore/doWorkspaceField.jspf" %>
  
	<%-- Title ------------------------------------------------------------ --%>
	<% if (formHandler.isFieldEdition("title")) { %>
	
    <% TypeEntry titleTE = channel.getTypeEntry(formHandler.getPublicationClass()); %>
    <jalios:field name="title" css="focus" formHandler="<%= formHandler %>">
      <jalios:control /> 
    </jalios:field>
	<% } %>
	<jalios:include jsp="types/Shortcut/doEditShortcutModal.jsp" />
</div>
</jalios:modal>
<% 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  itRemoveCat = channel.getCategory("$id.application.shortcut.category");
  if (itRemoveCat != null){	removedCatSet.add(itRemoveCat);  }
  request.setAttribute("removedCatSet", removedCatSet);
%>
  <%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 3nRx51L1JcCeQsjUHzd2oA== --%>