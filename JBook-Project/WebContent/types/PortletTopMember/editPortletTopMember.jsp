<%-- This file was automatically generated. --%><%
%><%--
  @Summary: PortletTopMember editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditPortletTopMemberHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% request.setAttribute("formHandler", formHandler); %><%
%><%@ include file='/work/doEditPubHeader.jspf' %>
<div class="container-fluid">
  <div class="row PortletTopMember">
    <jalios:include jsp="types/PortletTopMember/doEditPortletTopMember.jsp" />
  </div>
</div>
<% 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("removedCatSet", removedCatSet);
  %>
<jalios:include jsp="work/edition/doEditPubFooter.jsp" /><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 39UCba8n9r9i53Fimv6w7w== --%>