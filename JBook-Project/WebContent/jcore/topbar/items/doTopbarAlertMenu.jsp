<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><%
%><%@ page import="com.jalios.jcms.alert.*" %><%

if (!isLogged) {
  return;
}
jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-alert-menu.css");
jcmsContext.addJavaScript("js/jalios/core/alert/jalios-alert.js");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-alert.js");
// Toastr
jcmsContext.addCSSHeader("css/lib/toastr/toastr.css");
jcmsContext.addCSSHeader("css/jalios/core/components/toastr/jalios-toastr.css");
jcmsContext.addJavaScript("js/lib/toastr/toastr.js");
%>
<div class="topbar-item-wrapper topbar-item-alert-menu" data-jalios-ajax-refresh-url="jcore/topbar/items/doTopbarAlertMenu.jsp" data-jalios-alert-refresh-interval="<%= AlertManager.getInstance().getAlertRefreshInterval() %>">
	<div class="topbar-alert-menu dropdown keep-open dropdown-topbar" data-jalios-dropdown-topbar-reload="true" data-jalios-dropdown-topbar-lazy-url="jcore/topbar/items/doTopbarAlertMenu_items.jsp">
	  <%-- TOPBAR ICON --%>
	  <a href="jcore/alert/app/alertApp.jsp" aria-expanded="false" id="topbar-alert-menu-opener" class="topbar-item" data-toggle="dropdown" tabindex="0" aria-haspopup="true" role="button" title='<%= encodeForHTMLAttribute(glp("js.ui.topbar.alert-menu-opener.title",0)) %>'>
	    <jalios:icon src="topbar-alert" />
      <span aria-hidden="true" class="alert-count topbar-item-badge alert-badge fade animated"></span>
      <span class="sr-only js-topbar-alert-count-title" aria-live="polite" aria-atomic="true">You have XX</span>
	  </a>

	  <div class="topbar-alert-menu-dropdown is-closed dropdown-menu dropdown-menu-right topbar-menu topbar-alerts-menu has-header has-btn-footer" aria-labelledby="topbar-alert-menu-opener">
	    <div class="topbar-ctxmenu-header">
	      <div class="topbar-ctxmenu-header-actions">
	        <% if (channel.isDataWriteEnabled()){ %>
	          <a data-jalios-topbar-menu-action="confirmMarkAllRead" class="topbar-ctxmenu-header-item js-alert-mark-all-as-read js-skip-slide-menu-keybind <%= (!(AlertManager.getInstance().getUnreadAlertCount(loggedMember) > 0)?" hide":"") %>" role="button" tabindex="0" aria-label="<%= encodeForHTMLAttribute(glp("ui.topbar.alert-menu.mark-all-read")) %>" title="<%= encodeForHTMLAttribute(glp("ui.topbar.alert-menu.mark-all-read")) %>" ><jalios:icon src="topbar-alert-mark-allread" /></a>
            <a data-jalios-topbar-menu-action="toggleSettings" class="topbar-ctxmenu-header-item js-alert-toggle-settings js-skip-slide-menu-keybind" aria-describedby="topbar-alert-menu-title" role="button" tabindex="0" aria-label="<%= encodeForHTMLAttribute(glp("ui.topbar.alert-menu.settings.title")) %>" title='<%= encodeForHTMLAttribute(glp("ui.topbar.alert-menu.settings.title")) %>'><jalios:icon src="actions" alt="ui.topbar.alert-menu.settings.title" /></a>
	        <% } %>
	        <a class="topbar-ctxmenu-header-item js-close-menu" aria-describedby="topbar-alert-menu-title" role="button" tabindex="0" title="<%= encodeForHTMLAttribute(glp("ui.topbar.close-menu.title")) %>"><jalios:icon alt="ui.topbar.close-menu.title" src="topbar-close-menu" /></a>
	      </div>
	      <h2 id="topbar-alert-menu-title"><%= glp("alert.list.lbl.title") %></h2>
	    </div>

	    <div class="topbar-ctxmenu-body topbar-alerts-item-wrapper clearfix">
	      <div class='ajax-loading-component ajax-loading topbar-ctxmenu-firstload'><div class='ajax-loading-display'><div class='loader'></div></div></div>
	    </div>
	    <div class="topbar-ctxmenu-footer">
	      <a href="jcore/alert/app/alertApp.jsp" class="btn btn-default topbar-ctxmenu-footer-btn"><%= glp("ui.topbar.alert-menu.see-all") %></a>
	    </div>
	  </div>
	</div>
</div>
