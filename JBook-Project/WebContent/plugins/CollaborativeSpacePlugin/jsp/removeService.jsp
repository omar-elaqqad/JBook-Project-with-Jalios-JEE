<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.CSManager" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

// Only within CollaborativeSpace
String csId = getDataIdParameter("id");
CollaborativeSpace cs = (CollaborativeSpace) channel.getData(csId);
if (cs == null) {
  return;
}
if (!CSManager.getInstance().canManageCSServices(loggedMember, cs.getWorkspace())) {
  sendForbidden(request, response);
  return;
}
String serviceId = getDataIdParameter("service");
if (Util.isEmpty(serviceId)) {
  return;
}
Data service = channel.getData(serviceId);
if (service == null || (!(service instanceof PortalElement))) {
  return;
}
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="id" value='<%= cs.getId() %>'/><%
  %><jsp:setProperty name="formHandler" property="opRemoveService" value='true'/><%
  %><jsp:setProperty name="formHandler" property="service" value='<%= service.getId() %>'/><%
  %><jsp:setProperty name="formHandler" property="ws" value='<%= cs.getWorkflowId() %>'/><%
%></jsp:useBean>
<%
if (formHandler.validate()) {
  sendRedirect(cs);
  return;
}
%>