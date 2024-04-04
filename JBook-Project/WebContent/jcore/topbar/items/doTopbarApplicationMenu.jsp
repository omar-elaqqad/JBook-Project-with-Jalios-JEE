<%@ include file="/jcore/topbar/items/doInitTopbarItem.jspf" %><%

if (!topbarHandler.showApplicationMenu()) {
  return;
}

jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-application-menu.css");

%>
<div class="topbar-application-menu topbar-item-wrapper dropdown dropdown-topbar" data-jalios-dropdown-topbar-lazy-url="jcore/topbar/items/doTopbarApplicationMenu_items.jsp" data-jalios-topbar-application-menu-async-url="jcore/topbar/application/doTopbarApplicationMenu_badge.jsp">
  <a id="topbar-application-menu-opener" title="<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.title")) %>" href="#" class="topbar-item" data-toggle="dropdown" onclick="return false;" aria-haspopup="true">
    <jalios:icon src="topbar-application" alt="ui.topbar.application-menu" />
  </a>
  <div class="dropdown-menu keep-open dropdown-menu-right topbar-menu has-header has-btn-footer" aria-labelledby="topbar-application-menu-opener" id="ctxApplicationMenu">
    <div class="topbar-ctxmenu-header">
      <div class="topbar-ctxmenu-header-actions">
        <a class="topbar-ctxmenu-header-item js-close-menu" href="#" title="<%= encodeForHTMLAttribute(glp("ui.topbar.close-menu.title")) %>">
          <jalios:icon src="topbar-close-menu" alt="ui.topbar.close-menu.title" />
        </a>
      </div>
      <%= glp("ui.topbar.application-menu") %>
    </div>
    <div class="topbar-ctxmenu-body clearfix">
      <div class="ajax-loading-component ajax-loading"><div class="ajax-loading-display"><div class="loader"></div></div></div>
   </div>
  <div class="topbar-ctxmenu-footer"><a class="btn btn-default js-show-more-application-items topbar-ctxmenu-footer-btn js-no-clear-menu"><span class="show-more"><%= glp("ui.topbar.application-menu.see-more") %></span><span class="show-less"><%= glp("ui.topbar.application-menu.see-less") %></span></a></div>
</div>    
</div>
