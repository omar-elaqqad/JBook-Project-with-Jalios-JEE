<%@page import="com.jalios.jcms.uicomponent.autocomplete.TopbarSearchAutocompleteHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

  PortletSearch box = (PortletSearch) portlet;  
  String topBarSearchParam = Util.toBoolean(request.getAttribute("jcms.live-search.topbar"),false) ? "&amp;topbarSearch=true" : "";
  boolean isInstantSearch = box.getInstantSearch();

  final String placeholder = HttpUtil.encodeForHTMLAttribute(Util.getString(JcmsUtil.unescapeHtml(box.getTitleText(userLang, false)), glp("ui.com.placeholder.search-all-site")));
  String topbarSearchRefreshUrl = "/" + TopbarSearchAutocompleteHandler.getAutocompleteJsp() + "?portletSearchId=" + box.getId() + topBarSearchParam;
  jcmsContext.addAvoidanceLink("a11y-global-search", glp("a11y.avoidance-link.search"));
%>
<!-- Search zone -->
<div class="topbar-search-wrapper topbar-item">
  <form autocomplete="off" action="<%= ResourceHelper.getQuery() %>">
    <div class="search-container" role="search" >
      <%-- form tag for chrome  http://stackoverflow.com/a/15917221/1877464 --%>
        <% if (isInstantSearch) { %>
          <input type="text" id="a11y-global-search" name="text" data-ac-lookup-pending-refresh="true" title='<%= encodeForHTMLAttribute(glp("ui.com.placeholder.search-all-site"))  %>'
              data-jalios-ajax-refresh-url="<%= topbarSearchRefreshUrl %>" aria-label="<%= encodeForHTMLAttribute(glp("ui.com.placeholder.search-all-site")) %>"
              class="form-control topbar-search-query" placeholder="<%= placeholder %>" />
        <% } else { %>
          <input type="text" id="a11y-global-search" name="text" class="form-control topbar-search-query" placeholder="<%= placeholder %>" aria-label="<%= glp("ui.com.btn.search") %>"/>
        <% } %>
        
          <button class="btn btn-default btn-topbar-search" value="true" name="opSearch" type="submit" title='<%= encodeForHTMLAttribute(glp("ui.com.btn.search")) %>'><%
            %><jalios:icon src="topbar-search" /><%
          %><span class="sr-only"><%= placeholder %></span></button>
        
      <%@ include file='doQueryHandler.jspf' %>

      <%-- JCMS-8680 - make topbar search a "text search" --%>
      <input type="hidden" name="textSearch" value="true" />

      <%-- Keep some of portlet parameters  --%>
      <% if (Util.arrayContains(box.getSearchIn(), "searchInMembers")) { %>
      <input type="hidden" name="searchInMembers" value="true" />
      <% } %>
      <% if (Util.arrayContains(box.getSearchIn(), "searchInFiles")) { %>
      <input type="hidden" name="searchInFiles" value="true" />
      <% } %>
      <% if (Util.arrayContains(box.getSearchIn(), "catName")) { %>
      <input type="hidden" name="catName" value="true" />
      <% } %>   
      <% if (Util.notEmpty(box.getSearchWith())) { %>
      <input type="hidden" name="searchWith" value="<%= box.getSearchWith() %>" />
      <% } %>
    </div>
    
    <% if (isInstantSearch) { %>
    <div class="topbar-search-results-dummy hide">
      <jalios:include jsp="jcore/autocomplete/acTopbarSearch.jsp" />
    </div>
    <% } %>

    <%
	    String searchDisplayId = box.getDisplayPortal() != null ? box.getDisplayPortal().getId() : currentCategory.getId();
    %>
    <% if(channel.getBooleanProperty("query.topbar-search.add-hidden-params", false)) { %>
      <%= formHandler.getHiddenParams() %>
    <% } %>
		<% if ("Current".equals(box.getRefineQueries())) { %><input name="cids" type="hidden" value="<%= currentCategory.getId() %>" /><% } %>
		<% if ("Portal".equals(box.getRefineQueries())) { %><input name="cids" type="hidden" value="<%= portalCategory.getId() %>" /><% } %>
		<% if ("CurrentWS".equals(box.getRefineQueries())) { %><input name="wrkspc" type="hidden" value="<%= workspace.getId() %>" /><% } %>
		<% if (box.getQueryPortlet() != null) { %>
		  <input type="hidden" name="<%= PortalManager.getActionParam(box.getQueryPortlet(),"DynamicQuery") %>" value="true" />
		  <input type="hidden" name="portlet" value="<%= box.getQueryPortlet().getId() %>" />
		  <% List enabledParams = Arrays.asList( new String[]{ "id" , "portal" , "cid"}); %>
		  <%= printEnabledHiddenParams(request,enabledParams) %>
		<% } %>
  </form>
</div>
<% if (isInstantSearch) { %>
<div class="topbar-search-overlay"></div>
<% } %>
