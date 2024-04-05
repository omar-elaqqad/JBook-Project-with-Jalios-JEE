<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/header.jspf" %> 
<div id="index-default" data-role="page" data-jalios-force-hide-back-btn="true">
  <jalios:buffer name="menuItems" trim="true">
      <li><a <%= SmartPhoneManager.getInstance().isMobileApp(request) ? "target=\"_blank\"" : "" %> data-ajax="false" href="<%= smartPhoneManager.getDesktopUrl(userLocale) %>"><jalios:icon src="smartphone-access-website" />  <%= glp("jcmsplugin.smartphone.lbl.index-default.desktop-link") %></a></li>  
      <jalios:include target="SMARTPHONE_TOPBAR_INDEX_ACTIONS" targetContext="LI" />
      <li><a data-ajax="false" class="confirm logout-link" href="<%= HttpUtil.getUrlWithCSRFToken("plugins/SmartPhonePlugin/jsp/core/logout.jsp",request,true) %>"><jalios:icon src="smartphone-logout" /> <%= glp("ui.com.alt.logout") %></a></li>
  </jalios:buffer>
  <% if(Util.notEmpty(menuItems)) { %>
    <%-- Index topbar menu --%>
    <% String uniqueId = ServletUtil.generateUniqueDOMId(request, "topbarPublicationMenu"); %>
    <div class="topbar-actions topbar-item topbar-right" data-role="none">
      <div class="topbar-item open-panel topbar-settings">
        <a href="#<%= uniqueId %>" data-rel="popup" data-transition="slideup">
          <jalios:icon src="smartphone-topbar-action-menu" />
        </a>
      </div>
    </div>
    <div data-role="popup" id="<%= uniqueId %>" data-theme="a" class="topbar-menu-dropdown">
      <ul data-role="listview" data-inset="true" style="min-width:210px;">
        <%= menuItems %>
      </ul>
    </div>
  <% } %>
  <jalios:include jsp="<%= SmartPhoneResourceHelper.getIndexServiceDrawer() %>"/>
</div>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/footer.jspf" %>