<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneWorkspaceManager"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.service.SmartPhoneService"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.jmobile.CSMobileDashboardUtils"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%
CollaborativeSpace collaborativeSpace = (CollaborativeSpace) workspace.getCollaborativeSpace();
if (channel.getBooleanProperty("jcmplugin.smartphone.space.show-introduction", false) || collaborativeSpace.getMobileShowIntro()) { %>
  <%@ include file='/plugins/CollaborativeSpacePlugin/smartphone/jsp/doIntroductionContent.jspf' %>
<% } %><%
Set<SmartPhoneService> appSet = CSMobileDashboardUtils.getCSApps(loggedMember, userLang, workspace);
if (Util.notEmpty(appSet) && collaborativeSpace.getMobileShowApplications()) { %>
  <div class="portlet-skinable-wrapper-default">
    <div class="portlet-title"><%= glp("ui.topbar.application-menu") %></div>
    <div class="application-launcher">
      <% for (SmartPhoneService itService : appSet) { %>
        <a class="application-item" href="<%= itService.getUrl() %>">
          <jalios:icon src="<%= itService.getIcon() %>" />
          <span class="application-item-name"><%= itService.getLabel(userLang) %></span>
        </a>
      <% } %>
    </div>
  </div> 
  <div class="content-divider-contrasted"></div>
<% } %>
<%
Set<Portlet> portlets = CSMobileDashboardUtils.getCSPortletList((CollaborativeSpace) workspace.getCollaborativeSpace(), loggedMember);
%>
<jalios:foreach collection="<%= portlets %>" name="itPortlet" type="Portlet">
  <smartphone:includePortlet portlet="<%= itPortlet %>" />
</jalios:foreach>