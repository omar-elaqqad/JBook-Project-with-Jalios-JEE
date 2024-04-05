<%@page import="com.jalios.jcmsplugin.smartphone.service.SmartPhoneService"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.service.DefaultSmartPhoneWSService"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.smartphone.*" %>

<jsp:useBean id="searchHandler" scope="page" class="com.jalios.jcmsplugin.smartphone.SmartPhoneSearchHandler"><%
  %><jsp:setProperty name='searchHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='searchHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name="searchHandler" property="*" /><%
%></jsp:useBean>
<div class="ajax-refresh-wrapper">
	<%
	searchHandler.performSearch();
	SmartPhoneService service = new DefaultSmartPhoneWSService("jcmsplugin.smartphone.workspace-service.search");
	SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
	workspace = (Workspace) request.getAttribute("jcms.plugin.smartphone.workspace");
	%>
	
	<% if (workspace != null) { %>
	  <smartphone:breadcrumb service="<%= service %>" workspace="<%= workspace %>" css="no-padding-bottom"/>
	<% } %>
	<form class="ui-filterable search-form" method="post" action="plugins/SmartPhonePlugin/jsp/service/search/doSearch.jsp">
	  <div class="colored-banner input-in-header">
	    <input value="<%= encodeForHTMLAttribute(searchHandler.getAvailableText()) %>" name="text" data-type="search" placeholder="<%= glp("ui.com.placeholder.search") %>" class="search-topbar-desktop-input append-text smartphone-search-filter-input">
	  </div>
	  <input type="hidden" name="currentTab" value="<%= encodeForHTMLAttribute(searchHandler.getCurrentTab()) %>" />
	  <input type="hidden" name="sort" value="relevance"/>
    <input type="hidden" name="globalSearch" value="true"/>
	<div data-role="navbar">
	  <ul>
	  	<% String serviceUrl = channel.getProperty("jcmsplugin.smartphone.service.search"); %>
	    <li><a data-transition="none" class='ajax-refresh <%= searchHandler.isTabActive("all") ?  "ui-btn-active" : "" %>' 
	    		data-jalios-ajax-params-form=".search-form" data-jalios-ajax-params='{"searchTab":"all"}'><%= glp("jcmsplugin.smartphone.service.search.tabs.all.label") %></a></li>
	    <li><a data-transition="none" class='ajax-refresh <%= searchHandler.isTabActive("members") ?  "ui-btn-active" : "" %>' 
	       	data-jalios-ajax-params-form=".search-form" data-jalios-ajax-params='{"searchTab":"members"}'><%= glp("jcmsplugin.smartphone.service.search.tabs.members.label") %></a></li>
	    <li><a data-transition="none" class='ajax-refresh <%= searchHandler.isTabActive("publications") ?  "ui-btn-active" : "" %>' 
	    		data-jalios-ajax-params-form=".search-form" data-jalios-ajax-params='{"searchTab":"publications"}'><%= glp("jcmsplugin.smartphone.service.search.tabs.publications.label") %></a></li>
	  </ul>
	</div>
	
		<% if(Util.notEmpty(smartPhoneManager.getSearchableTypes()) && searchHandler.isTabActive("publications")) { %>
      <div class="padded-input">
      <select name="type" class="ajax-refresh" data-jalios-ajax-target=".smartphone-search-autocomplete"
          data-jalios-ajax-refresh-inner="true" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/service/search/search-result.jsp">
        <option value=""><%= glp("ui.work.pub.lbl.all-type") %></option>
        <% for (Class clazz : smartPhoneManager.getSearchableTypes(userLang)) { %>
          <option value="<%= clazz.getSimpleName() %>"><%= channel.getTypeLabel(clazz, userLang) %></option>
        <% } %>
      </select>
      </div>
    <% } %> 

	</form>
	
	<div data-role="content">
		<ul
		  class="smartphone-search-autocomplete ajax-autocomplete ui-listview-full ui-listview"
		  data-enhanced="true"
		  data-filter="true"
		  data-input=".smartphone-search-filter-input"
		  data-inset="false"
		  data-jalios-ajax-method="post"
		  data-jalios-autocomplete="plugins/SmartPhonePlugin/jsp/service/search/search-result.jsp"
		  data-role="listview"
		>
		<% if(Util.notEmpty(searchHandler.getAvailableText())){ %>
			<jalios:include jsp="/plugins/SmartPhonePlugin/jsp/service/search/search-result.jsp"/>
		<% } %>
		</ul>
	</div>
</div>
