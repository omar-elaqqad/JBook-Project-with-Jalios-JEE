<%@page import="com.jalios.jcms.application.json.Application"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncherTab"%>
<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
jcmsContext.addJavaScript("js/lib/clamp/clamp.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-truncate.js");
ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {%>
  <jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<% }
formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {
  return;
}

Application itApplication = (Application) request.getAttribute("appstore.application");

boolean isInstalled = formHandler.isApplicationInstalled(itApplication); 
DataAttribute dataAttr = new DataAttribute();
dataAttr.addData("jalios-data-id", itApplication.getShortcutId());
%>
<jalios:card css='<%= isInstalled ? "is-installed is-clickable card-app": "is-clickable card-app" %>' dataAttribute="<%= dataAttr %>">
  <div class="ribbon-top-left" data-toggle="tooltip" data-placement="top" title="<%= encodeForHTMLAttribute(glp("appstore.lbl.installed")) %>" ><jalios:icon alt='appstore.lbl.installed' src="appstore-installed"/></div>

  <div class="app-uninstall" data-toggle="tooltip" data-placement="top" title="<%= encodeForHTMLAttribute(glp("appstore.btn.uninstall")) %>">
	  <a aria-describedby="app-title-<%= itApplication.getShortcutId() %>" onclick="return false;" role="button" tabindex="0" class="btn btn-rounded application-action" 
	    	 data-jalios-appstore-action="uninstallApplication" 
	    	 data-jalios-appstore-action-params='{"shortcutId": "<%= itApplication.getShortcutId() %>"}'>
	    <jalios:icon src="appstore-uninstall-app" alt="appstore.btn.uninstall"/>
	  </a>
  </div>

  <div class="app-icon-wrapper">
    <img class="app-icon" src="<%= itApplication.getImage() %>" alt=""  />
  </div>
  <jalios:cardBlock>
    <div class="card-title" ><a id="app-title-<%= itApplication.getShortcutId() %>" class="" role="button" tabindex="0"><%= itApplication.getName() %></a></div>
    
    <div class="application-hashtags">
      <% Shortcut shortcut = (Shortcut) channel.getPublication(itApplication.getShortcutId()); %>
      <% if (shortcut != null && Util.notEmpty(shortcut.getType(loggedMember))) { %>
        <% for (Category cat : shortcut.getType(loggedMember)) { %>
          <span class="label label-default" data-jalios-data-id="<%= cat.getId() %>"><%= cat.getName(userLang) %></span> 
        <% } %>
       <% } %>
    </div>
     
    <div class="card-description" data-jalios-truncate='{ "value" : 4 }'>
      <% if (Util.notEmpty(itApplication.getDescription())) { %>
        <jalios:truncate length="180" suffix="..."><%= encodeForHTML(itApplication.getDescription()) %></jalios:truncate>
      <% } %>
    </div>
     
     <div class="application-footer">
      <div class="buttons pull-right">
        <div class="dropdown" data-toggle="tooltip" data-placement="top" title="<%= encodeForHTMLAttribute(glp("appstore.btn.install")) %>">
          <a aria-label="<%= encodeForHTMLAttribute(glp("appstore.btn.install-app", shortcut.getTitle(userLang,true))) %>" onclick="return false;" id="install-application-menu-<%= shortcut.getId() %>" class="application-action add-application-action btn btn-rounded" data-toggle="dropdown" role="button" tabindex="0" aria-haspopup="true" aria-expanded="false">
            <jalios:icon src="appstore-add-app"  />
          </a> 
          <ul class="dropdown-menu" aria-labelledby="install-application-menu-<%= shortcut.getId() %>">
            <% int tabIndex = 0; %>
            <% for (ApplicationLauncherTab tab : formHandler.getTabs()) { %>
              <li>
                <% boolean isInstalledInTab = formHandler.isApplicationInstalledInTab(itApplication, tabIndex); %>
                <a role="button" tabindex="0" class="appstore-add <%= isInstalledInTab ? "is-installed" : "" %>" data-jalios-appstore-action="toggleApplicationInstall" data-jalios-appstore-action-params='{"tabIndex":<%= tabIndex %>, "shortcutId": "<%= itApplication.getShortcutId() %>"}'>
                  <jalios:icon css="pull-right" src="appstore-installed" /><%= encodeForHTML(tab.getName()) %>
                </a>
              </li>
              <% tabIndex++; %>
            <% } %>
          </ul>
        </div>    
      </div>                
      <% 
      int installCount = formHandler.getInstallCount(itApplication);
      if (installCount > 0) {
      %>       
        <div class="install-count" data-toggle="tooltip" data-placement="top" title="<%= encodeForHTMLAttribute(glp("appstore.lbl.installed-app-count", installCount)) %>">
          <jalios:icon src="appstore-install-count" />
          <span class="counter"><%= installCount %></span>
        </div>     
       <% } %>
     </div>
  </jalios:cardBlock>
</jalios:card>