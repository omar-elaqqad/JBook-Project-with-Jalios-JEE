<%-- This file was automatically generated. --%><%
%><%--
  @Summary: Media editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditMediaHandler'><%
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
<jalios:modal formHandler="<%= formHandler %>" url="types/Media/editMediaModal.jsp">
<div class="row Media">
  
  <%-- Workspace -------------------------------------------------------- --%>
  <%@ include file="/jcore/doWorkspaceField.jspf" %>
  
	<%-- Title ------------------------------------------------------------ --%>
	<% if (formHandler.isFieldEdition("title")) { %>
	
    <% TypeEntry titleTE = channel.getTypeEntry(formHandler.getPublicationClass()); %>
    <jalios:field name="title" css="focus" formHandler="<%= formHandler %>">
      <jalios:control /> 
    </jalios:field>
	<% } %>
	<jalios:include jsp="types/Media/doEditMediaModal.jsp" />
</div>
</jalios:modal>
<% 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("removedCatSet", removedCatSet);
%>
  <%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- m9YGtcLO6Sfgrr1IXoBDjw== --%>