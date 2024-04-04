<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><% jcmsContext.addCSSHeader("css/jalios/core/jalios-portlet-publication.css"); %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditPortletPublicationHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% request.setAttribute("formHandler", formHandler); %><%
%><%@ include file='/work/doEditPubHeader.jspf' %>
<div class="container-fluid">
  <div class="row PortletPublication portlet-publication">
    <jalios:include jsp="types/PortletPublication/doEditPortletPublication.jsp" />
  </div>
</div>
<% 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("removedCatSet", removedCatSet);
%>
<jalios:include jsp="work/edition/doEditPubFooter.jsp" />