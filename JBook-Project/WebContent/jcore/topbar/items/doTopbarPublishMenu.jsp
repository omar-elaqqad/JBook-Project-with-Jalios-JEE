<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><%

if (topbarHandler.showPublishMenuEntry()) { 
  jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-slide-menu-keybinding.js");
  %>
  <div class="topbar-publish-menu dropdown dropdown-topbar topbar-item-wrapper" data-jalios-dropdown-topbar-lazy-url="jcore/topbar/items/doTopbarPublishMenu_items.jsp">
    <a id="topbar-publish-menu-opener" title="<%= encodeForHTMLAttribute(glp("ui.topbar.publish-menu.title")) %>" tabindex="0" role="button" class="topbar-item" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <jalios:icon src="publish-menu" css="publish-menu-icon-sm" alt="ui.topbar.publish-menu"/>
    </a>
    <div class="dropdown-menu keep-open topbar-default-menu dropdown-menu-right topbar-menu has-header" aria-labelledby="topbar-publish-menu-opener" id='ctxPublishMenu'>
      <div class="topbar-ctxmenu-header">
        <div class="topbar-ctxmenu-header-actions">
          <a class="topbar-ctxmenu-header-item js-close-menu" href="#" title="<%= encodeForHTMLAttribute(glp("ui.topbar.close-menu.title")) %>">
            <jalios:icon src="topbar-close-menu" alt="ui.topbar.close-menu.title" />
          </a>
        </div>
        <h2><%= glp("ui.topbar.publish-menu") %></h2>
      </div>
      <div class="topbar-ctxmenu-body">
        <div class='ajax-loading-component ajax-loading topbar-ctxmenu-firstload'><div class='ajax-loading-display'><div class='loader'></div></div></div>
      </div>        
    </div>         
  </div>
<% } %>