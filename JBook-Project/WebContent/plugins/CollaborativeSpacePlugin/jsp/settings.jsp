<%@page import="com.jalios.jcmsplugin.collaborativespace.portal.CollaborativeSpaceMobileDashboardResolver"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.portal.CSDisplayHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/doCSDisplayHandler.jsp" /><%

if (!workspace.isCollaborativeSpace()) {
  sendRedirect("index.jsp");
  return;
}
CSManager csMgr = CSManager.getInstance();
if (!csMgr.canManageCSSettings(loggedMember, workspace)) {
  sendForbidden(request, response);
  return;
}

CSDisplayHandler csHandler = (CSDisplayHandler) request.getAttribute("csDisplayHandler");

CollaborativeSpace cs = csMgr.getCollaborativeSpace(workspace);

request.setAttribute(CSManager.EDIT_SETTINGS_REQUEST_FLAG, Boolean.TRUE);
String wsId = cs.getWorkspace().getId();
String requiredFieldsAttr = "settings-required-fields";

request.setAttribute("jcmsplugin.collaborativespace.portal.fullscreen", Boolean.TRUE);    
String menuPrefixUrl = ServletUtil.getUrlWithRemovedParams(request, new String[] {"settingsView"}, true) + "&amp;settingsView="; 
request.setAttribute("menuPrefixUrl", menuPrefixUrl);
String settingsView = getAlphaNumParameter("settingsView", "info");
request.setAttribute("settingsView", settingsView);

boolean isInfo = "info".equals(settingsView);
boolean isAccessAndSignup = "accessAndSignup".equals(settingsView);
boolean isModel = "model".equals(settingsView);
boolean isModelInstances = "modelInstances".equals(settingsView);
boolean isLook = !isInfo && "look".equals(settingsView);
boolean isLayout = !isInfo && "layout".equals(settingsView);
boolean isJMobile = !isInfo && "jmobile".equals(settingsView);


%><jsp:useBean id="extFormHandler" scope="page" class="generated.EditWorkspaceExtensionHandler"><%
  %><jsp:setProperty name="extFormHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="extFormHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="extFormHandler" property="*" /><%
  %><jsp:setProperty name='extFormHandler' property='id' value='<%= wsId %>' /><%
  %><jsp:setProperty name='extFormHandler' property='noRedirect' value='true' /><%
%></jsp:useBean><%

List<String> titleList = new ArrayList<>();
for (Iterator it = channel.getLanguageList().iterator() ; it.hasNext() ; ) {
  String itLang = (String)it.next();
  String titleVal = cs.getTitle(itLang);
  if (Util.notEmpty(titleVal)){
    titleList.add(titleVal);
  }
}

%><jsp:useBean id="commonFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceCommonHandler"><%
  %><jsp:setProperty name="commonFormHandler" property="request"        value="<%= request %>"/><%
  %><jsp:setProperty name="commonFormHandler" property="response"       value="<%= response %>"/><%
  %><jsp:setProperty name="commonFormHandler" property="*" /><%
  %><jsp:setProperty name='commonFormHandler' property='id' value='<%= wsId %>' /><%
  %><jsp:setProperty name='commonFormHandler' property='noRedirect' value='true' /><%
%></jsp:useBean><%

%><jsp:useBean id="typeFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceTypeHandler"><%
  %><jsp:setProperty name="typeFormHandler" property="request"        value="<%= request %>"/><%
  %><jsp:setProperty name="typeFormHandler" property="response"       value="<%= response %>"/><%
  %><jsp:setProperty name="typeFormHandler" property="*" /><%
  %><jsp:setProperty name='typeFormHandler' property='id' value='<%= wsId %>' /><%
  %><jsp:setProperty name='typeFormHandler' property='noRedirect' value='true' /><%
%></jsp:useBean><%
// Set title: see JCMS-8690
if (!isInfo) {
  commonFormHandler.setTitle(titleList.toArray(new String[]{}));
}

%><jsp:useBean id="workspaceFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceHandler"><%
  %><jsp:setProperty name="workspaceFormHandler" property="request"           value="<%= request %>"/><%
  %><jsp:setProperty name="workspaceFormHandler" property="response"          value="<%= response %>"/><%
  %><jsp:setProperty name="workspaceFormHandler" property="extFormHandler"       value="<%= extFormHandler %>"/><%
  %><jsp:setProperty name="workspaceFormHandler" property="commonFormHandler" value="<%= commonFormHandler %>"/><%
  %><jsp:setProperty name="workspaceFormHandler" property="typeFormHandler"   value="<%= typeFormHandler %>"/><%
  %><jsp:setProperty name="workspaceFormHandler" property="*" /><%
  %><jsp:setProperty name='workspaceFormHandler' property='id' value='<%= wsId %>' /><%
  %><jsp:setProperty name='workspaceFormHandler' property='noRedirect' value='true' /><%
%></jsp:useBean><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.EditSettingsHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='id' value='<%= cs.getId() %>' /><%
  %>
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
<% if (isInfo) { %>
  <jsp:setProperty name='formHandler' property='redirect' value='<%= ServletUtil.getResourcePath(request) %>' />
<% } %>
<% if (isLook || isModel || isAccessAndSignup) { %>
  <jsp:setProperty name='formHandler' property='redirect' value='<%= cs.getDisplayUrl(userLocale) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/settings.jsp&settingsView=" + settingsView %>' />
<% } %>
<% if (isModel) { %>
  <jsp:setProperty name='formHandler' property='redirect' value='<%= cs.getDisplayUrl(userLocale) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/settings.jsp&settingsView=" + settingsView %>' />
<% } %>
<% if (isLayout) { %>
  <jsp:setProperty name='formHandler' property='redirect' value='<%= cs.getDisplayUrl(userLocale) %>' />
<% } %>
  <%
  %><jsp:setProperty name="formHandler" property="workspaceFormHandler" value="<%= workspaceFormHandler %>"/><%
%></jsp:useBean><% 

if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
  <%
} 
%>
<div class="settings cs-settings ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/CollaborativeSpacePlugin/jsp/settings.jsp"
data-jalios-ajax-refresh-target=".Portlet.CollaborativeSpace">

  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned cs-settings-nav" >
    <li class='info-tab <%= isInfo ? "active" : "" %>' ><a href="<%= menuPrefixUrl + "info" %>" data-jalios-ajax-refresh="noscroll" ><%= glp("jcmsplugin.collaborativespace.settings.lbl.info") %></a></li>
    <li class='info-tab <%= isAccessAndSignup ? "active" : "" %>' ><a href="<%= menuPrefixUrl + "accessAndSignup" %>" data-jalios-ajax-refresh="noscroll" ><%= glp("jcmsplugin.collaborativespace.settings.lbl.info.access") %></a></li>
    <li class='info-tab <%= isModel ? "active" : "" %>' ><a href="<%= menuPrefixUrl + "model" %>" data-jalios-ajax-refresh="noscroll" ><%= glp("jcmsplugin.collaborativespace.settings.lbl.model") %></a></li>
    <% if(csHandler.isModel()){ %>
      <li class='info-tab <%= isModelInstances ? "active" : "" %>' ><a href="<%= menuPrefixUrl + "modelInstances" %>" 
          data-jalios-ajax-refresh="noscroll" ><%= glp("jcmsplugin.collaborativespace.settings.lbl.model-instances") %></a></li>
    <% } %>
    <li class='look-tab <%= isLook ? "active" : "" %>' ><a href="<%= menuPrefixUrl + "look" %>" ><%= glp("jcmsplugin.collaborativespace.settings.lbl.look") %></a></li>
    <% if(csHandler.showLayoutSettings()){ %>
      <li class='layout-tab <%= isLayout ? "active" : "" %>' ><a href="<%= menuPrefixUrl + "layout" %>" ><%= glp("jcmsplugin.collaborativespace.settings.lbl.layout") %></a></li> 
    <% } %>
    <% if (csHandler.showJMobilePortalSettings()) { %>
      <li class='jmobile-tab <%= isJMobile ? "active" : "" %>' ><a href="<%= menuPrefixUrl + "jmobile" %>" ><%= glp("jcmsplugin.collaborativespace.settings.lbl.jmobile") %></a></li>
    <% } %>
    <jalios:include target="PLUGIN_CSP_SETTINGS_MENU" targetContext="li" />
  </ul>
 
  <%-- -- MessageBox -------------------------------------------- --%>
  <%@ include file='/jcore/doMessageBox.jspf' %>

  <div class="form-wrapper">
    <% if (isInfo || isLook || isLayout || isModel || isAccessAndSignup || isModelInstances) { %>
      <form name="editForm" 
          id='settingsForm' 
          class="form-horizontal" 
          action="plugins/CollaborativeSpacePlugin/jsp/settings.jsp" 
          method="post" 
          accept-charset='UTF-8' 
          enctype='multipart/form-data'>
        <% request.setAttribute("field-vertical", true); %>
        <% if (isInfo) { %>
          <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/settings_info.jspf' %>
        <% } else if (isAccessAndSignup) { %>
          <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/settings_accessAndSignup.jspf' %>
        <% } else if (isModel) { %>
          <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/settings_model.jspf' %>
        <% } else if(isLayout){ %>
          <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/settings_layout.jspf' %>          
        <% } else if (isLook) { %>
          <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/settings_look.jspf' %>
        <% }else if(isModelInstances){ %>
          <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/settings_model_instances.jspf' %>
        <% } %>
  
        <% if (Util.toBoolean(request.getAttribute(requiredFieldsAttr), false)) { %>
          <p><%= glp("ui.com.txt.required") %></p>
        <% } %>
  
        <input type="hidden" name="id" value="<%= cs.getId() %>" />
        <input type="hidden" name="jsp" value="plugins/CollaborativeSpacePlugin/jsp/settings.jsp" />
        <input type="hidden" name="settingsView" value="<%= settingsView %>" />
        
        <%-- BUTTONS --%>  
        <% if(isLayout || isModelInstances ||(isModel && !csHandler.isModel() && !csHandler.canChooseSyncMode())){%>
          <%-- Do not Display button if model tab and the member can not update syncMode --%>
        <% }else{ %>
	        <div class="button-wrapper">
	          <input type="submit" data-jalios-action="ajax-refresh" class="btn btn-primary" name="opUpdate" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.save")) %>" />
	          <input type="button" class="btn btn-default" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.cancel")) %>" onclick="document.location='<%= portalCategory.getDisplayUrl(userLocale) %>'; return false;" />
	        </div>
        <% } %>
      </form>
    <% } %>
    <%-- JMobile is in a separate part since it uses ajax refresh --%>
    <% if (isJMobile && csHandler.showJMobilePortalSettings()) { %>
      <jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/settings_mobile.jsp" />
    <% } %>
    <jalios:include target="PLUGIN_CSP_SETTINGS" targetContext="li" />
    
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>