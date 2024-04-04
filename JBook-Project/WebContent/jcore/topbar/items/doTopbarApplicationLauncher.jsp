<%@page import="com.jalios.jcms.application.ApplicationManager"%>
<%@ include file="/jcore/topbar/items/doInitTopbarItem.jspf" %><%
if (!topbarHandler.showApplicationMenu()) {
  return;
}

if (!ApplicationManager.getInstance().canUseApplicationLauncher(loggedMember)) {
  return;
}

jcmsContext.addCSSHeader("css/jalios/core/components/launcher/jalios-topbar-application-launcher.css");
jcmsContext.addCSSHeader("css/jalios/core/components/launcher/jalios-application-launcher.css");
jcmsContext.addCSSHeader("css/jalios/core/components/tabs/jalios-tabs-underlined.css");
jcmsContext.addJavaScript("js/lib/handlebars/handlebars.js");
jcmsContext.addJavaScript("js/jalios/core/components/launcher/jalios-application-launcher.js");
jcmsContext.addJavaScript("js/jalios/core/components/launcher/jalios-application-launcher-service.js");
jcmsContext.addJavaScript("js/jalios/core/components/launcher/jalios-application-topbar-launcher.js");
%>
<div class="topbar-application-launcher topbar-item-wrapper dropdown dropdown-topbar" data-jalios-topbar-application-menu-async-url="jcore/topbar/application/doTopbarApplicationMenu_badge.jsp">
  <a role="button" tabindex="0" id="topbar-application-launcher-opener" title="<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.title")) %>" class="topbar-item" data-toggle="dropdown" aria-haspopup="true">
    <jalios:icon src="topbar-application" alt="ui.topbar.application-menu" />
  </a>
  
  <div class="dropdown-menu is-loading keep-open dropdown-menu-right topbar-menu has-header" aria-labelledby="topbar-application-launcher-opener" id="ctxApplicationLauncher">
    
    <div class="topbar-ctxmenu-header">
      <div class="topbar-ctxmenu-header-actions">
      	<h2 class="app-menu-title"><%= glp("ui.topbar.application-menu") %></h2>
      	<div class="topbar-ctxmenu-right-actions">
      		<a role="button" tabindex="0" class="topbar-ctxmenu-header-item app-search-store" title="<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.search-app")) %>">
      			<jalios:icon src="application-search" alt="ui.topbar.application-menu.search-app" />
      		</a>
      		<a role="button" tabindex="0" class="topbar-ctxmenu-header-item js-close-menu" title="<%= encodeForHTMLAttribute(glp("ui.topbar.close-menu.title")) %>">
      			<jalios:icon src="topbar-close-menu" alt="ui.topbar.close-menu.title" />
      		</a>
      	</div>
      </div>
          
    </div>
    
    <div class="topbar-ctxmenu-body clearfix application-launcher">
    	<div class="application-launcher-error hide">
    		<jalios:message level="<%= MessageLevel.ERROR %>" msg="application-launcher.load-error.msg" />
    	</div>
    	<div class="application-launcher-buffer hide"></div>
      <div class="ajax-loading-component ajax-loading">
      	<div class="ajax-loading-display">
      		<div class="loader"></div>
      	</div>
     </div>

    	<%-- HANDLEBARS TEMPLATE --%>
    	<% String prefixId = ServletUtil.generateUniqueDOMId(request, "launcher"); %>
			<script class="application-launcher-template" type="text/x-handlebars-template">
				<div class="application-launcher-backdrop hide"></div>
        
				<div class="tab-delete-confirm hide">
				  <span class="delete-tab-msg"><%= glp("ui.topbar.application-menu.delete-tab.validate") %></span>
					<div class="delete-tab-confirm-btns">
 					  <div role="button" tabindex="0" class="btn btn-default js-delete-tab-cancel"><%= glp("ui.com.btn.cancel") %></div>						
					  <div role="button" tabindex="0" class="btn btn-danger js-delete-tab-validate"><%= glp("ui.com.alt.remove") %></div>
				  </div>
        </div>

		    <ul class="dropdown-menu launcher-navtab-menu">
		  	  <li><a role="button" tabindex="0" class="js-tab-menu-rename"><%= glp("ui.com.lbl.rename") %></a></li>
		  		<li><a role="button" tabindex="0" class="js-tab-menu-delete"><%= glp("ui.com.btn.delete") %></a></li>
					<li><a role="button" tabindex="0" class="js-tab-menu-cancel"><%= glp("ui.com.btn.cancel") %></a></li>
		  	</ul>

				<div class="nav-tabs-border"></div>
				
				<div class="scroller scroller-left"><jalios:icon src="chevron-left" /></div>
        <div class="scroller scroller-right"><jalios:icon src="chevron-right" /></div>

				<div class="nav-tabs-wrapper">
				  <ul class="nav nav-tabs nav-tabs-underlined" role="tablist">
				    {{#each tabs}}
				  		<li class="application-nav-tab {{#if @first}}active{{/if}}">
				  			<a data-target="#<%= prefixId %>{{@index}}" role="tab" data-toggle="tab" tabindex="0" class="application-nav-tab-link">
									<span class="topbar-item-badge app-badge-level-info hide"></span>
                  <span class="tab-name">{{name}}</span>
				  				<span class="launcher-navtab-menu-btn" role="button" tabindex="0" aria-describedby="<%= prefixId %>" aria-label="<%= encodeForHTMLAttribute(glp("application-launcher.edit-tab")) %>" title="<%= encodeForHTMLAttribute(glp("application-launcher.edit-tab")) %>"><jalios:icon src="caret" /></span>
				  		  </a>
				  		</li>
            {{/each}}
						<li class="application-nav-tab-add add-new-tab">
							<a data-target="#addNewTab" role="tab" class="application-nav-tab-link" title="<%= encodeForHTMLAttribute(glp("application-launcher.add-tab")) %>" aria-label="<%= encodeForHTMLAttribute(glp("application-launcher.add-tab")) %>">
								<jalios:icon src="add" />
							</a>
						</li>
				  </ul>
				</div>

				<!-- Tab panes -->
        <div class="tab-content">
					{{#each tabs}}
            <div class="tab-applications tab-pane {{#if @first}}active{{/if}}" id="<%= prefixId %>{{@index}}">
							<div class="tab-applications-items">
							{{#each applications}}
							  <a href="{{url}}" {{{htmlAttributes}}} data-jalios-html-attributes="{{htmlAttributes}}" class="launcher-application-item" data-jalios-dataid="{{shortcutId}}" {{#if asyncUrl}} data-jalios-application-async-url="{{asyncUrl}}"{{/if}}>
                  {{#if hasBadge}}
                    <span class="topbar-item-badge app-badge-level-{{badgeLevel}}" {{#if hasBadge}}title="{{badgeTitle}}"{{/if}} >{{badgeText}}</span>
                  {{/if}}
                  <span class="icon-wrapper"><img src="{{image}}" alt=""></span>
                  <span class="label-wrapper">{{name}}</span>
                </a>
							{{/each}}
							
              </div>
              <div class="tab-applications-items-clone"></div>
						</div>
					{{/each}}     			
				</div>

				<div class="application-trash">
					<div class="trash-overlay"></div>
					<div class="trash-animate">
				    <jalios:icon src="applications-launcher-bin" alt="trash" />
			    </div>
			  </div>	
	    </script>
	    
	    <script class="application-template" type="text/x-handlebars-template">
				<a href="{{url}}"  {{{htmlAttributes}}} data-jalios-html-attributes="{{htmlAttributes}}" class="launcher-application-item" data-jalios-dataid="{{shortcutId}}" {{#if asyncUrl}}data-jalios-application-async-url="{{asyncUrl}}"{{/if}}>
          <span class="icon-wrapper"><img src="{{image}}" alt=""></span>
          <span class="label-wrapper">{{name}}</span>
        </a>
	    </script>
	    
	    <script class="new-tab-application-template" type="text/x-handlebars-template">
			  <div class="new-tab-display">
				  <input type="text" title='<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.tab-title")) %>' placeholder='<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.tab-title")) %>' name="tabTitle" class="tab-title form-control"  autocomplete="off"/>
					<div role="button" tabindex="0" class="btn btn-primary btn-xs js-create-new-tab btn-new-tab"><%= glp("ui.com.btn.validate") %></div>
				  <div role="button" tabindex="0" class="btn btn-default btn-xs js-cancel-new-tab"><%= glp("ui.com.btn.cancel") %></div>
			  </div>
		  </script>
		
		  <script class="application-tab-template" type="text/x-handlebars-template">
				<li class="application-nav-tab"><a href="#<%= prefixId %>{{@index}}" role="tab" data-toggle="tab" onclick="return false;"><span class="tab-name">{{name}}</span></a></li>
  		</script>
  		
  		<script class="application-tab-content-template" type="text/x-handlebars-template">
		    <div class="tab-applications tab-pane" id="<%= prefixId %>{{@index}}">
			    <div class="tab-applications-items"></div>
          <div class="tab-applications-items-clone"></div>
		    </div>
      </script>
      
      <script class="application-store-menu" type="text/x-handlebars-template">
        <div class="topbar-ctxmenu-header applications-store-search-header">
					<input type="text" name="app-search-name" class="app-search-input form-control" aria-label="<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.search-app")) %>" title='<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.search-app")) %>' placeholder='<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.search-app")) %>'  autocomplete="off"/>
					<div class="topbar-ctxmenu-header-actions">
					  <a class="topbar-ctxmenu-header-item js-close-app-store" role="button" tabindex="0" title="<%= encodeForHTMLAttribute(glp("ui.com.btn.close")) %>">
          	  <jalios:icon src="topbar-close-menu" alt='<%= encodeForHTMLAttribute(glp("ui.topbar.application-menu.close-aria")) %>' />
        	  </a>
					</div>
				</div>

				<div class="topbar-ctxmenu-body application-launcher application-store">
				</div>
        <span aria-live="polite" class="sr-only js-application-launcher-search-live"></span>
				<a href="<%= channel.getProperty("appstore.url") %>" class="application-store-redirect">
					<jalios:icon src="appstore" /><span><%= glp("ui.topbar.application-menu.goto-store") %></span>
				</a>
		  </script>
		  
		  <script class="applications-store" type="text/x-handlebars-template">
				{{#each this}}
				  <div class="application-wrapper">
					  <div class="app-store-img">
							<a href="{{url}}" tabindex="-1" aria-hidden="true"  {{{htmlAttributes}}}>
						    <img src="{{image}}" alt="" />
							</a>
					  </div>
					  <div class="app-store-item">
						  <p class="app-store-title">
								<a href="{{url}}" {{{htmlAttributes}}}>
						  	  {{name}}
								</a>
						  </p>
					  	<p class="app-store-description">
						  	{{description}}
						  </p>
 
					  </div>
						<div class="app-store-add">
              <a role="button" tabindex="0" aria-label="<%= encodeForHTMLAttribute(glp("appstore.btn.install")) %>" title="<%= encodeForHTMLAttribute(glp("appstore.btn.install")) %>" class="js-app-install btn btn-rounded" data-jalios-dataid="{{shortcutId}}"><jalios:icon src="appstore-add-app"  /></a>
						</div>
						<div class="installed-checkmark" data-toggle="tooltip" data-placement="top" title="{{{installedAriaLabel}}}">
							<jalios:icon htmlAttributes='aria-hidden="true"' src="appstore-installed" /><span class="sr-only">{{installedAriaLabel}}</span>
						</div>
			  	</div>
					{{else}}

					<p class="app-store-no-result">
						<%= glp("ui.com.lbl.no-result") %>
					</p>
				{{/each}}
			</script>
			
			<script class="application-store-install-menu" type="text/x-handlebars-template">
				<ul class="dropdown-menu js-store-dropdown-install">
				  {{#each this}}
			  	  <li data-jalios-index="{{@index}}">
				  	  <a tabindex="0" role="button" class="appstore-menu-add"><jalios:icon src="app-list-check" css="hide pull-right"/> {{name}}</a>
		  		  </li>
				  {{/each}} 
				</ul>
			</script>
		
    </div>
  </div>    
</div>

