!(function(d){const h=32;if(!d.jalios){d.jalios={}}if(!d.jalios.topbar){d.jalios.topbar={}}d.jalios.topbar={refreshApplicationBadges:function(){var l=d(".topbar-application-launcher");if(!l.exists()){return}d.getJSON(l.data("jalios-topbar-application-menu-async-url"),function(o){if(o){var n=o.badgeLevel;var m=o.badgeCount;if(parseInt(m,10)>0){i.html(m).addClass(k+n.toLowerCase());l.find(".topbar-item").prepend(i);setTimeout(function(){i.addClass("in")},100)}}});if(d.jalios.topbar.applicationmenu){d.jalios.topbar.applicationmenu.refreshApplicationMenuBadges()}}};var i=d("<span>",{"class":"topbar-item-badge fade"});var k="topbar-badge-level-";var f=function(){if(d("body").find(".dropdown-overlay-backdrop").length==0){d("body").append(d("<div/>").addClass("dropdown-overlay-backdrop fade fadeout"))}};var b=function(){d(".dropdown-overlay-backdrop").addClass("full in");d("BODY").addClass("has-overlay")};var c=function(){var l=d(".dropdown-overlay-backdrop");l.removeClass("in");l.one(d.support.transition.end,function(){l.removeClass("full")});d("BODY").removeClass("has-overlay")};const e=function(){window.addEventListener("resize",j)};const a=1000;let topbarRefreshTimeout;const j=function(l){topbarRefreshTimeout&&clearTimeout(topbarRefreshTimeout);topbarRefreshTimeout=setTimeout(function(){let isExpanded=d(".topbar-navigation-menu-wrapper").hasClass("is-expanded");d(".topbar-navigation-menu").refresh({params:{isExpanded:isExpanded,isRefreshAfterResize:true},nohistory:true,noscroll:true})},a)};var g=function(){f();e();d(document).on("click keydown",".topbar-pull-wrapper",function(n){if(!d.jalios.a11y.isFocusedClick(n)){return}n.preventDefault();const m=d(n.currentTarget);m.closest(".topbar-navigation-menu-wrapper").toggleClass("is-expanded");if(m.closest(".topbar-navigation-menu-wrapper.is-expanded").exists()){m.attr("aria-expanded",true)}else{m.attr("aria-expanded",false)}m.closest(".topbar-wrapper").toggleClass("is-expanded");d("BODY").toggleClass("is-topbar-with-navigation-expanded")});d(document).on("jalios:topbar-dropdown",function(n){var m=n.dropdown&&n.dropdown.type==="done"&&n.dropdown.trigger&&n.dropdown.trigger.hasClass("topbar-application-menu");if(m){var o=d(".topbar-application-item-wrapper .topbar-application-item");if(o.length>9){d(".topbar-application-menu .topbar-ctxmenu-footer").removeClass("hide")}}});d(document).on("hide.bs.dropdown",function(n){var m=d(n.target);m.find(".topbar-item").attr("aria-expanded",false);if(!m.hasClass("dropdown-topbar")){return}c()});d(document).on("shown.bs.dropdown",function(o){var n=d(o.target);if(!n.hasClass("dropdown-topbar")){return}b();var m=n.data("jalios-dropdown-topbar-reload")===true;if(n.data("jalios-dropdown-topbar-lazy-url")&&((m&&!n.hasClass("is-loaded"))||(!m&&!n.hasClass("is-loaded")))){n.find(".dropdown-menu").addClass("is-loading");d.jalios.ui.CtxMenu.$latest=undefined;d.jalios.AjaxRefresh.refresh(n.data("jalios-dropdown-topbar-lazy-url"),n.find(".topbar-ctxmenu-body"),{noscroll:true,nohistory:true,callback:function(){n.find(".dropdown-menu").removeClass("is-closed");if(!m){n.addClass("is-loaded")}n.find(".dropdown-menu").removeClass("is-loading");var p=jQuery.Event("jalios:topbar-dropdown");p.dropdown={};p.dropdown.type="done";p.dropdown.trigger=n;d(document).trigger(p)}})}});d(document).on("click",".topbar-menu .js-close-menu",function(o){var n=d(o.target);var m=n.closest(".dropdown");if(!m.exists()){return}d.fn.dropdown.clearMenus()});d(".topbar-menu .js-close-menu").on("keydown",function(o){if(o.keyCode!==h){return}o.preventDefault();var n=d(o.target);var m=n.closest(".dropdown");if(!m.exists()){return}d.fn.dropdown.clearMenus()});d.jalios.topbar.refreshApplicationBadges();var l=d(".topbar-wrapper");d(".topbar-search-wrapper > FORM").attr("action",l.data("portlet-search-action"));if(l.data("workspace-filter-hidden-field")){d("<input>").attr({type:"hidden",name:"ws",value:l.data("workspace-filter-hidden-field")}).appendTo(".topbar-search-wrapper > FORM")}};d(document).ready(function(){g()})})(window.jQuery);