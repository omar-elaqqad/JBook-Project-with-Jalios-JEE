<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncherTab"%>
<%@page import="com.jalios.jcms.application.json.Application"%>
<%@page import="generated.Shortcut"%>
<%@ include file="/front/card/doInitCard.jspf" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {%>
	<jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<% }

if (formHandler == null) {
  return;
}

Application itApplication = (Application) request.getAttribute("appstore.application");

if (itApplication == null) {
  return;
}

DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);
%>
<a class="card-link" href="<%= link %>">
	<div class="<%= css %>"<%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>>
	  <div class="ribbon-top-left" data-toggle="tooltip" data-placement="top" title="<%= encodeForHTMLAttribute(glp("appstore.lbl.installed")) %>" aria-label="<%= encodeForHTMLAttribute(glp("appstore.lbl.installed")) %>"><jalios:icon src="appstore-installed"/></div>
	  <div class="app-icon-wrapper">
	    <img class="app-icon" src="<%= itApplication.getImage() %>" alt=""  />
	  </div>
	  <jalios:cardBlock>
	    <div class="card-title"><%= itApplication.getName() %></div>
	    
	    <div class="application-hashtags">
	      <% Shortcut shortcut = (Shortcut) channel.getPublication(itApplication.getShortcutId()); %>
	      <% if (shortcut != null && Util.notEmpty(shortcut.getType(loggedMember))) { %>
	        <% for (Category cat : shortcut.getType(loggedMember)) { %>
	          <span class="label label-default"><%= cat.getName(userLang) %></span> 
	        <% } %>
	       <% } %>
	    </div>
	     
	    <div class="card-description">
	      <% if (Util.notEmpty(itApplication.getDescription())) { %>
	        <%= itApplication.getDescription() %>
	      <% } %>
	    </div>
	     
	     <div class="application-footer">
	      <div class="buttons pull-right">
	        <div class="dropdown" data-toggle="tooltip" data-placement="top" aria-label="<%= encodeForHTMLAttribute(glp("appstore.btn.install")) %>" title="<%= encodeForHTMLAttribute(glp("appstore.btn.install")) %>">
	          <a onclick="return false;" id="install-application-menu-<%= shortcut.getId() %>" class="application-action add-application-action" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	            <jalios:icon src="appstore-add-app"  />
	          </a> 
	          <ul class="dropdown-menu" aria-labelledby="install-application-menu-<%= shortcut.getId() %>">
	            <% int tabIndex = 0; %>
	            <% for (ApplicationLauncherTab tab : formHandler.getTabs()) { %>
	              <li>
	                <% boolean isInstalledInTab = formHandler.isApplicationInstalledInTab(itApplication, tabIndex); %>
	                <a class="appstore-add <%= isInstalledInTab ? "is-installed" : "" %>" data-jalios-appstore-action="toggleApplicationInstall" data-jalios-appstore-action-params='{"tabIndex":<%= tabIndex %>, "shortcutId": "<%= itApplication.getShortcutId() %>"}'>
	                  <jalios:icon css="pull-right" src="appstore-installed" /><%= tab.getName() %>
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
	
	</div>
</a>
