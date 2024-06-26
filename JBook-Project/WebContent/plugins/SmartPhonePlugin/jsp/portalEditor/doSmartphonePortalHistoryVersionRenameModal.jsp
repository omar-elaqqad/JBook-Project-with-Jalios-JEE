<%@page import="com.jalios.jcms.jportal.JPortalPublishHandler"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcms.jportal.JPortalTemplate"%>
<%@ page import="com.jalios.jcms.workspace.WKRole" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portalEditor.SmartphonePortalHistoryHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%

formHandler.validate(); 

String button = glp("ui.com.btn.update");
String modalUrl = "plugins/SmartPhonePlugin/jsp/portalEditor/doSmartphonePortalHistoryVersionRenameModal.jsp?portalStructureId="+formHandler.getPortalStructure().getId();
%>
<jalios:modal url="<%= modalUrl %>" title="portal.structure.rename-title.label" op="opUpdate" button="<%= button %>" formHandler="<%= formHandler %>">
  <jalios:field name="customTitle" label="portal.structure.custom-title.label" value='<%=formHandler.getPortalStructure().getCustomTitle()%>'>
    <jalios:control settings="<%= new TextFieldSettings() %>" />
  </jalios:field>
</jalios:modal>