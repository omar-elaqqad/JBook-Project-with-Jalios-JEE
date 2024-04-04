<%@page import="com.jalios.jcms.application.json.Application"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncherTab"%>
<%@page import="com.jalios.jcms.shortcut.AbstractShortcut"%>
<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %><%
ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {%>
  <jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<% }
formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {
  return;
}

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card.css");

AbstractShortcut shortcut = formHandler.getAvailableDisplayedApplication();

if (!shortcut.canBeReadBy(loggedMember)) {
  sendForbidden(request, response);
  return;
}

Application app = new Application();
app.setShortcutId(shortcut.getId());
%>
<article>
  <% 
    List<BreadcrumbItem> items3 = new ArrayList<>(); 
    String backUrl = "jcore/appstore/app/appStoreApp.jsp?mode=" + formHandler.getAvailableMode().toString() + "&amp;cids=" + Util.getFirst(formHandler.getCids());
    items3.add(new BreadcrumbItem().prepend(JcmsUtil.getHtmlIcon("chevron-left")).label(glp("appstore.back-to-list")).url(backUrl));
  %>
  <jalios:breadcrumb items="<%= items3 %>" />
  
  <div class="displayed-application card <%= formHandler.isApplicationInstalled(app) ? "is-installed" : "" %>" >
    <div class="ribbon-top-left" data-toggle="tooltip" data-placement="top" title="<%= encodeForHTMLAttribute(glp("appstore.lbl.installed")) %>" aria-label="<%= encodeForHTMLAttribute(glp("appstore.lbl.installed")) %>"><jalios:icon src="appstore-installed"/></div>
    <div class="app-icon-wrapper">
      <img class="app-icon" src="<%= shortcut.getDataImage(userLang) %>" alt=""  />
    </div>  
  
    <h2 class="displayed-application-title"><%= shortcut.getTitle(userLang) %></h2>
    
    <div class="application-hashtags">
      <% if (shortcut != null && Util.notEmpty(shortcut.getType(loggedMember))) { %>
       <% for (Category cat : shortcut.getType(loggedMember)) { %>
         <span class="label label-default"><%= cat.getName(userLang) %></span> 
       <% } %>
      <% } %>
    </div>    
    <div class="displayed-application-description">
  	  <jalios:wysiwyg><%= shortcut.getText(userLang) %></jalios:wysiwyg>
    </div>
    <div class="displayed-application-footer">
      <% 
  	  int installCount = formHandler.getInstallCount(app);
  	  if (installCount > 0) {
  	  %>       
  	    <div class="install-count" data-toggle="tooltip" data-placement="top" title="<%= encodeForHTMLAttribute(glp("appstore.lbl.installed-app-count", installCount)) %>">
  	      <jalios:icon src="appstore-install-count" />
  	      <span class="counter"><%= installCount %></span>
  	    </div>     
  	   <% } %>   
    </div>
  
  </div>
  <div class="displayed-application-buttons">
    <div class="dropdown">
      <a onclick="return false;" role="button" tabindex="0" id="install-application-menu-<%= shortcut.getId() %>" class="ctx-caret btn btn-primary" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
        <%= glp("application-launcher.install") %>
      </a> 
      <ul class="dropdown-menu" aria-labelledby="install-application-menu-<%= shortcut.getId() %>">
        <% int tabIndex = 0; %>
        <% for (ApplicationLauncherTab tab : formHandler.getTabs()) { %>
          <li>
            <% boolean isInstalledInTab = formHandler.isApplicationInstalledInTab(app, tabIndex); %>
            <a class="appstore-add  <%= isInstalledInTab ? "is-installed" : "" %>" data-jalios-appstore-action="toggleApplicationInstall" data-jalios-appstore-action-params='{"tabIndex":<%= tabIndex %>, "shortcutId": "<%= app.getShortcutId() %>"}'>
              <jalios:icon css="pull-right" src="appstore-installed" /><%= encodeForHTML(tab.getName()) %>
            </a>
          </li>
          <% tabIndex++; %>
        <% } %>
      </ul>
    </div> 
    <a class="btn btn-default noTooltipCard" href="<%= shortcut.getUrl(userLocale) %>"  target="_blank"><%= glp("application-launcher.test") %></a>
    <% if (loggedMember.canWorkOn(shortcut)) { %>
  	  <a onclick="return false;" class="btn btn-default modal"  href="jcore/appstore/app/createApplicationModal.jsp?id=<%= shortcut.getId() %>">
  	    <%= glp("ui.com.alt.edit") %>
  	  </a>
    <% } %>
    <% if (formHandler.canDeployApplication()) { %>
      <a onclick="return false;" class="btn btn-default modal"  href="jcore/appstore/app/modal/deployApplicationModal.jsp?application=<%= shortcut.getId() %>">
        <%= glp("appstore.btn.deploy") %>
      </a>
      <% } %>
    <a class="btn btn-default modal" href="jcore/appstore/app/modal/recommendApplicationModal.jsp?shortcut=<%= shortcut.getId() %>" title="<%= encodeForHTMLAttribute(glp("application-launcher.recommend-app")) %>" aria-label="<%= encodeForHTMLAttribute(glp("application-launcher.recommend-app")) %>" ><jalios:icon src="recommendation" /></a>
  </div>
  <% if (formHandler.displaySocialFooter()) { %>
  	<% request.setAttribute("publication", shortcut); %>
  	<div class="displayed-application-social">
  		<jalios:include jsp="/front/vote/doVoteFooter.jsp" />    
  		<jalios:include target="DISPLAY_FOOTER" />       
  	</div>
  <% } %>
</article>