<%@page import="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler.ApplicationFilter"%>
<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%>
<%@page import="com.jalios.jcms.taglib.card.*"%><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.CSManager" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler" %><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

if (!workspace.isCollaborativeSpace()) {
  sendRedirect("index.jsp");
  return;
}
if (!CSManager.getInstance().canManageCSServices(loggedMember, workspace)) {
  sendForbidden(request, response);
  return;
}

request.setAttribute(CSManager.EDIT_SERVICES_REQUEST_FLAG, Boolean.TRUE);
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-services.css");

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="id" value='<%= portal.getId() %>'/><%
%></jsp:useBean>
<%

if (formHandler.validate()) {
  return;
}


request.setAttribute("jcmsplugin.collaborativespace.portal.fullscreen", Boolean.TRUE);    
String serviceInstalledUrl = ServletUtil.getUrlWithRemovedParams(request, new String[] {"serviceView"}, true) + "&amp;serviceView="; 

String previewLabel = glp("jcmsplugin.collaborativespace.services.lbl.preview-action");
Set<PortalElement> allServiceSet = formHandler.getAllServiceSet();
Set<PortalElement> installedServiceSet = formHandler.getInstalledServiceSet();
Set<PortalElement> notInstalledServiceSet = formHandler.getNotInstalledServiceSet();
%>

<div class="cs-services-list ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/CollaborativeSpacePlugin/jsp/doServiceList.jsp">
  <% if(Util.notEmpty(formHandler.getServiceSet())){ %>
  <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
    <% request.setAttribute("cs-service-formHandler", formHandler); %>
    <jalios:foreach collection="<%= formHandler.getServiceSet() %>" name="itService" type="PortalElement">
      <jalios:cardData data='<%= itService %>' link="" resource='carddata.cs-service.PortalElement' />
    </jalios:foreach>
    <% request.removeAttribute("cs-service-formHandler"); %>
  </jalios:cards> 
  <% }else{ %>
    <jalios:appBodyNoResult />
  <% } %>
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>
