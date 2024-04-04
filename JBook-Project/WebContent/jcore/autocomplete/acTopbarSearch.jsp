<%@page import="com.jalios.jcms.uicomponent.autocomplete.TopbarSearchAutocompleteHandler"%>
<%@page import="com.jalios.jcms.uicomponent.topbar.TopbarSearchItem"%><%
%><%@page import="com.jalios.jcms.uicomponent.topbar.TopbarManager"%><%
%><%@page import="com.jalios.jcms.uicomponent.autocomplete.TopbarSearchAutocompleteResult"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.uicomponent.autocomplete.TopbarSearchAutocompleteHandler"><%
  %><jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

WebAssetsUtils.addScrollbarWebAssets(jcmsContext);
formHandler.validate();

request.setAttribute("jcms.topbar.search.formHandler", formHandler);
TopbarSearchAutocompleteResult result = formHandler.getResult();
Set<TopbarSearchItem> itemSet = TopbarManager.getInstance().getTopbarSearchItemSet();

boolean searchInMembers = (isLogged || channel.getBooleanProperty("query.show-mbrs-to-anonymous", false)) && formHandler.isSearchInMembers(); // Specific code for members
%>
<div data-jalios-ajax-refresh-url="<%= TopbarSearchAutocompleteHandler.getAutocompleteJsp() %>" class="no-focus ajax-refresh-div search-global">
  <div class="topbar-search-results-full-wrapper">
    <a role="button" tabindex="0" class="btn topbar-search-close" title='<%= encodeForHTMLAttribute(glp("ui.topbar.search-close")) %>'><jalios:icon src="topbar-search-close" /></a>
    <div class="topbar-search-inner" data-jalios-loading-label='<%= encodeForHTMLAttribute(glp("ui.topbar.search-min-chars"))  %>'>
      <div class="columns-header">
        <% for (TopbarSearchItem item : itemSet) { %>
          <% if (!item.getName().equals("member") || (item.getName().equals("member") && searchInMembers)) { %>
	        <h2 class="topbar-search-results-title topbar-search-results-title-<%= item.getName() %>"><%= item.getLabel(userLang) %></h2>
	        <% } %>
        <% } %>
      </div>
      <div class="columns-body">
        <% for (TopbarSearchItem item : itemSet) { %>
          <% if (!item.getName().equals("member") || (item.getName().equals("member") && searchInMembers)) { %>
            <jalios:include jsp="<%= item.getJsp() %>" />
          <% } %>
        <% } %>
      </div>
    </div>
    <div class="topbar-search-footer">
      <button type="submit" class="btn btn-primary btn-full-search"><%= glp("ui.work.search.topbar.complete-search") %></button>
    </div>
  </div>
</div>