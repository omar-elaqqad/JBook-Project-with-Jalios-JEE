<%@page import="com.jalios.jcms.uicomponent.topbar.TopbarItem"%><%
%><%@page import="com.jalios.jcms.uicomponent.topbar.TopbarManager"%><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.uicomponent.topbar.TopbarHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%

if (!formHandler.displayTopbar()) {
  return;
}

formHandler.addFrontEndDependencies();

String logoBreakpoint = channel.getProperty("jcms.topbar.logo-breakpoint");
request.setAttribute(TopbarManager.TOPBAR_HANDLER_REQUEST_ATTR, formHandler);

boolean wrapLogoWithH1 = formHandler.wrapLogoWithH1();

%>
<%-- Javascript that needs to be computed to avoid FOUC  --%>
<script>
  document.body.classList.add("is-topbar-displayed");
  <% if (formHandler.isNavigationExpanded()) { %>
    document.body.classList.add("is-topbar-with-navigation-expanded");
  <% } %>
</script>
<%-- Prints logo style (Width and Height) --%>
<%= formHandler.getLogoStyle() %>

<header role="banner" class="topbar-wrapper<%= formHandler.getTopbarWrapperCss() %>" <%= formHandler.getSearchDataAttributes() %>>
  <div class="topbar<%= formHandler.getTopbarCss() %>">
    <div class="topbar-inner">
      <%-- TOPBAR LEFT PART --%>
      <div class="topbar-left">
        <jalios:include target='<%= formHandler.getTargetPrefix() + "_LEFT_START" %>' targetContext="topbar" />
        
        <% if (wrapLogoWithH1) { %><h1><% } %>
          <span class="sr-only"><%= channel.getName() %></span>
          <a class="topbar-logo topbar-item" href="<%= formHandler.getTopbarHomeUrl() %>" title="<%= encodeForHTMLAttribute(formHandler.getTopbarHomeTitle()) %>">
            <picture>
              <source media="(max-width: <%= logoBreakpoint %>)" srcset="<%= channel.getProperty("icon.topbar-logo-mobile") %>" />
              <source media="(min-width: <%= logoBreakpoint %>)" srcset="<%= channel.getProperty("icon.topbar-logo") %>" />
              <jalios:icon src="topbar-logo" alt="<%= formHandler.getTopbarHomeTitle() %>" />
            </picture>
          </a>
        <% if (wrapLogoWithH1) { %></h1><% } %>
        <jalios:include jsp="jcore/topbar/items/doTopbarWorkspaceMenu.jsp" />
        <%-- MESSAGE --%>
        <% if (isLogged) { %>
          <jsp:include page='/jcore/topbar/items/doTopbarMessage.jsp' flush="true" />
        <% } %>

        <jalios:include target='<%= formHandler.getTargetPrefix() + "_LEFT_END" %>' targetContext="topbar" />
      </div>

      <%-- TOPBAR CENTER PART --%>
      <% request.setAttribute("jcms.live-search.topbar",true); %>
      <jalios:include pub="<%= PortalManager.getPortletSearchTopbar() %>" />
      <% request.removeAttribute("jcms.live-search.topbar"); %>

      <%-- TOPBAR RIGHT PART --%>
      <div class="topbar-right">
        <jalios:include target='<%= formHandler.getTargetPrefix() + "_RIGHT_START" %>' targetContext="topbar" />
        <% if (Util.notEmpty(PortalManager.getPortletSearchTopbar())) { %>
          <div class="topbar-item-wrapper hidden-sm hidden-md hidden-lg ">
            <a class="topbar-item" href="<%= encodeForHTMLAttribute(formHandler.getPortletSearchMobileUrl()) %>"><jalios:icon src="topbar-search" /></a>
          </div>
        <% } %>
        
        <% for (TopbarItem item : formHandler.getTopbarItemSet()) { %>
          <jalios:include jsp="<%= item.getUrl() %>" targetContext="topbar-item"/>
        <% } %>

        <!-- TARGET -->
        <jalios:include target='<%= formHandler.getTargetPrefix() + "_RIGHT_END" %>' targetContext="topbar" />
      </div>
    </div>

  </div>
  <% if (formHandler.showNavigationMenu()) { %>
    <jalios:include pub="<%= formHandler.getTopbarPortlet() %>" />
  <% } %>

</header>
<div class="topbar-placeholder<%= formHandler.isNavigationExpanded() ? " is-expanded" : "" %>"></div><%
request.removeAttribute(TopbarManager.TOPBAR_HANDLER_REQUEST_ATTR);
%>