<%@page import="com.jalios.jcmsplugin.smartphone.application.SmartPhoneApplicationManager.ApplicationMobile"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.application.SmartPhoneApplicationManager"%><% 
%><%@page import="com.jalios.jcms.shortcut.AbstractShortcut"%><%
%><%@page import="com.jalios.jcms.application.json.ApplicationLauncherTab"%><%
%><%@page import="com.jalios.jcms.application.json.ApplicationLauncher"%><%
%><%@page import="com.jalios.jcms.application.json.Application"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><% 
ApplicationLauncher launcher = SmartPhoneApplicationManager.getInstance().getMobileApplications(loggedMember);
int launcherTabCounter = 0;
int launcherTabContentCounter = 0;
%>
<div class="application-launcher-tabs">
  <ul class="nav nav-pills" id="myTab" role="tablist">
    <% for (ApplicationLauncherTab tab : launcher.getTabs()) { %>
      <li class="<%= launcherTabCounter == 0 ? "active" : "" %> "><a id="launcher-tab<%= launcherTabCounter %>" class="prevent-member-menu-toggle" data-toggle="tab" href="#launcher-tab<%= launcherTabCounter %>-content" role="tab" aria-controls="#launcher-tab<%= launcherTabCounter %>-content" aria-selected="false" href=""><%= tab.getLangName(userLang) %></a></li>
      <% launcherTabCounter++; %>
    <% } %>
  </ul>
</div>
<div class="tab-content">
  <% for (ApplicationLauncherTab tab : launcher.getTabs()) { %>
    <div class="tab-pane fade <%= launcherTabContentCounter == 0 ? "in active" : "" %>" id="launcher-tab<%= launcherTabContentCounter %>-content" aria-labelledby="launcher-tab<%= launcherTabContentCounter %>">
      <div class="application-launcher-tabs-content application-launcher">
        <% for (Application itApp : tab.getApplications()) { %>
          <a class="application-item js-close-mbr-menu" href="<%= SmartPhoneApplicationManager.getInstance().getApplicationMobileUrl(itApp, userLocale) %>">
            <jalios:icon src="<%= itApp.getImage() %>" />
            <span class="application-item-name"><%= itApp.getName() %></span>
          </a>
        <% } %>

        <% if (launcherTabContentCounter == 0) { %>
          <%-- Additional apps --%>
          <% List<ApplicationMobile> additionalApps = SmartPhoneApplicationManager.getInstance().getAdditionalApplications(loggedMember, userLang); %>
          <% for (ApplicationMobile additionalApp : additionalApps) { %>
            <a class="application-item js-close-mbr-menu" href="<%= additionalApp.getUrl() %>">
              <jalios:icon src="<%= additionalApp.getIcon() %>" />
              <span class="application-item-name"><%= additionalApp.getLabel() %></span>
            </a>
          <% } %>
        <% } %>
        <% launcherTabContentCounter++; %>
      </div>
    </div>
  <% } %>
</div>