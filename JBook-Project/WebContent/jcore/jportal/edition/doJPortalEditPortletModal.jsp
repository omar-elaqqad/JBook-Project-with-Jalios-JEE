<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcms.jportal.JPortalTemplate"%>
<%@page import="com.jalios.jcms.jportal.JPortalCreateHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditPorletHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%

if (formHandler.validate()) { %>
<!-- 
<script>
jQuery.jalios.jportal.triggerEvent("addPortlet",{blockId: "formHandler.getBlockId()", portletId:"c_626947"}); 
</script>
-->
<% } %>
<jalios:modal url="jcore/jportal/edition/doJPortalEditPortletModal.jsp" title="This is catastrophy" formHandler="<%= formHandler %>">
  <%= formHandler.getPortletId() %>
</jalios:modal>