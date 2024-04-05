<%--
  @Summary : Preview a portlet as a service.
  @Category: CollaborativeSpace
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSConstants"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

String serviceId = getDataIdParameter("service");  
Portlet service = (Portlet) channel.getData(serviceId);
if (service == null) {
  return;
}
String csId = getDataIdParameter("id");
CollaborativeSpace cs = (CollaborativeSpace) channel.getData(csId);
if (cs == null) {
  return;
}
if (!CSManager.getInstance().canManageCSServices(loggedMember, cs.getWorkspace())) {
  sendForbidden(request, response);
  return;
}
request.setAttribute(PortalManager.PORTAL_PORTAL, cs); // for jcmsContext.getPortal() computation
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-services.css");
String description = service.getDescription(userLang);
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="id" value='<%= csId %>'/><%
  %><jsp:setProperty name="formHandler" property="service" value='<%= service.getId() %>'/><%
%></jsp:useBean>
<%
if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
  return;
}
boolean isInstalled = formHandler.isInstalled(service);
String opActionName = isInstalled ? "opRemoveService" : "opAddService";
String actionLabel = isInstalled ? glp("jcmsplugin.collaborativespace.services.btn.remove") : glp("jcmsplugin.collaborativespace.services.btn.add");
%>
<jalios:modal title="jcmsplugin.collaborativespace.services.lbl.preview" op='opClose' url='plugins/CollaborativeSpacePlugin/jsp/servicePreview.jsp'>
  <% if (Util.notEmpty(description)) { %>
    <jalios:message title="" dismissable="false"><p class="abstract"><jalios:wiki span="true"><%= service.getDescription(userLang) %></jalios:wiki></p></jalios:message>
  <% } %>

  <div class="servicePreviewShield"></div>
  <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/doService.jspf" %>

  <jalios:buffer name="MODAL_BUTTONS">
    <button type="submit" class="btn btn-default" name="opCancel" data-dismiss="modal" value="true"><%= glp("ui.com.btn.cancel") %></button>
    <button type="submit" class="btn btn-primary _ajax-refresh" name="<%= opActionName %>" value="true"><%= encodeForHTML(actionLabel) %></button>
    <input type="hidden" name="redirect" value='<jalios:url data="<%= cs %>" params="jsp=plugins/CollaborativeSpacePlugin/jsp/services.jsp" />' />
    <input type="hidden" name="service" value="<%= service.getId() %>" />
    <input type="hidden" name="id" value="<%= csId %>" />
  </jalios:buffer>

  <%-- JS: Focus modal's first button to prevent previewed service's INPUT to have focus by default --%>
  <jalios:javascript>
  var buttons = jQuery('#jalios-modal .modal-footer BUTTON');
  if (buttons && buttons[0]) {
    jQuery(buttons[0]).focus();
  }
  </jalios:javascript>
</jalios:modal>