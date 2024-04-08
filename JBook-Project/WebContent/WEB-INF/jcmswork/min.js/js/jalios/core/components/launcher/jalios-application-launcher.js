(function(d,g,h,c){if(!d.jalios){d.jalios={}}if(!d.jalios.launcher){d.jalios.launcher={}}d.jalios.launcher.init=function(n){return new a(n)};d.jalios.launcher.getLauncher=function(n){};var f={log:function(n){d.console.log(n)},checkInView:function(q,p,o,n){let startX=-parseInt(q.css("left"),10);let endX=startX+p+1;let elemStartX=parseInt(o.position().left,0);let elemEndX=elemStartX+o.width();if(elemStartX>=startX&&elemEndX<=endX){return true}return false},BadgeLevel:{info:1,warning:2,danger:3}};var b={};var e=function(p,n,o){Object.defineProperty(b,n,{value:o,writable:false,enumerable:true,configurable:true})};const j=function(o){this.isIE11=!!g.MSInputMethodContext&&!!h.documentMode;this.isSafari=navigator.vendor&&navigator.vendor.indexOf("Apple")>-1&&navigator.userAgent&&navigator.userAgent.indexOf("CriOS")==-1&&navigator.userAgent.indexOf("FxiOS")==-1;var n=this;this.launcher=o;this.$element=this.launcher.$element.parent();d(h).on("click",function(p){let $target=d(p.target);let $closest=$target.closest(".js-app-install");if($target.hasClass("js-app-install")||$closest.length>0){return true}n.removeStoreDropdown()});this.init()};j.prototype.init=function(){var n=this;this.$element.find(".app-search-store").click(function(o){n.display()});this.$element.find(".app-search-store").keydown(function(o){if(o.keyCode===32){n.display();o.preventDefault()}})};j.prototype.display=function(){var n=this;this.$element.find(".topbar-ctxmenu-header").hide();this.$element.find(".topbar-ctxmenu-body").hide();let html=b.APPLICATION_STORE_MENU();this.$element.append(html);this.$element.find(".app-search-input").focus();this.search("");this.$element.find(".js-close-app-store").click(function(o){o.preventDefault();o.stopPropagation();o.stopImmediatePropagation();n.remove();d(".app-search-store").focus()});this.$element.find(".js-close-app-store").keydown(function(o){if(o.keyCode===32){n.display();o.preventDefault();n.remove();d(".app-search-store").focus()}});this.$element.find(".app-search-input").on("input",function(o){n.triggerNewSearch(d(o.currentTarget).val())})};j.prototype.removeTimeout=function(){if(this.timeout){clearTimeout(this.timeout)}};j.prototype.triggerNewSearch=function(o){var n=this;this.removeTimeout();this.timeout=setTimeout(function(){n.search(o)},300)};j.prototype.updatePs=function(){if(this.isIE11||this.isSafari){return}var n=this;if(this.ps==null){let $applicationStore=this.$element.find(".application-store");this.ps=new PerfectScrollbar($applicationStore[0]);$applicationStore.on("ps-scroll-y",function(o){n.removeStoreDropdown()})}else{this.ps.update()}};j.prototype.remove=function(){this.$element.find(".topbar-ctxmenu-header").show();this.$element.find(".topbar-ctxmenu-body").show();this.$element.find(".topbar-ctxmenu-header.applications-store-search-header").remove();this.$element.find(".topbar-ctxmenu-body.application-store").remove();this.$element.find(".application-store-redirect").remove();this.launcher.$element.find(".js-store-dropdown-install").remove();this.removeStoreDropdown();this.ps=null;this.launcher.navTabs.checkDisplayArrows()};j.prototype.removeStoreDropdown=function(){if(this.$dropdownMenu){this.$dropdownMenu.remove()}if(this.$currentApplicationWrapper){this.$currentApplicationWrapper.removeClass("store-dropdown-open")}};j.prototype.search=function(o){var n=this;this.launcher.service.searchApplication({text:o},function(p){n.displayApplications(p)},function(p){f.log("Error : "+p)})};j.prototype.updateInstalledApplicationsCssClass=function(){var n=this;let tabs=n.launcher.applicationLauncherJson.tabs;let isInstalled=false;this.$element.find(".application-wrapper").each(function(o,p){let shortcutId=d(p).find(".js-app-install").data("jalios-dataid");isInstalled=false;d.each(tabs,function(q,r){d.each(r.applications,function(s,t){if(t.shortcutId==shortcutId){isInstalled=true;return false}})});if(isInstalled){d(p).addClass("is-installed")}else{d(p).removeClass("is-installed")}})};j.prototype.displayAndPositionDropdownMenu=function(n){let $applicationwrapper=n.closest(".application-wrapper");this.$currentApplicationWrapper=$applicationwrapper;this.$currentApplicationWrapper.addClass("store-dropdown-open");this.$dropdownMenu=this.launcher.$element.parent().find(".js-store-dropdown-install");let $storeHeader=this.$element.find(".applications-store-search-header");this.$dropdownMenu.css("display","block");this.$dropdownMenu.css("top",$applicationwrapper.position().top+$storeHeader.height()+$applicationwrapper.height()/2);let positionLeft=$applicationwrapper.width()-this.$dropdownMenu.width();this.$dropdownMenu.css("left",positionLeft+"px")};j.prototype.displayApplications=function(o){var p=this;var n=b.APPLICATIONS_STORE(o);this.$element.find(".application-store").html(n);this.updatePs();this.updateInstalledApplicationsCssClass();let appCount=d(".topbar-application-launcher .topbar-ctxmenu-body  .application-wrapper").length;d(".js-application-launcher-search-live").html(d.jalios.I18N.glp("appstore.lbl.search.aria-polite",appCount));this.$element.find(".js-app-install").click(function(q){p.launcher.$element.parent().find(".js-store-dropdown-install").remove();let tabs=p.launcher.applicationLauncherJson.tabs;n=b.APPLICATIONS_STORE_INSTALL_MENU(tabs);p.launcher.$element.parent().prepend(n);p.displayAndPositionDropdownMenu(d(q.currentTarget));let shorcutId=d(q.currentTarget).data("jalios-dataid");d.each(tabs,function(r,s){d.each(s.applications,function(t,u){if(u.shortcutId==shorcutId){let $li=p.$dropdownMenu.find("li:eq("+r+")");$li.addClass("js-app-installed");$li.find(".app-list-check").removeClass("hide");return false}})});p.$dropdownMenu.find("li").click(function(r){r.preventDefault();r.stopPropagation();let index=d(r.currentTarget).data("jalios-index");if(d(r.currentTarget).hasClass("js-app-installed")){p.launcher.removeApp(shorcutId,index)}else{p.launcher.installApp(shorcutId,index)}p.removeStoreDropdown()})})};const l=function(n){this.launcher=n;this.navMenuWidth=320;this.$element=n.$element.find(".nav-tabs-wrapper");this.$scrollers=n.$element.find(".scroller");this.$scrollerLeft=n.$element.find(".scroller.scroller-left");this.$scrollerRight=n.$element.find(".scroller.scroller-right");this.$navTabs=this.$element.find(".nav-tabs");this.init()};l.prototype.init=function(){this.initListeners();this.updateAddTabIconTopBar()};l.prototype.updateAddTabIconTopBar=function(){if(this.$navTabs.find(".application-nav-tab").length>1){this.launcher.$element.closest(".topbar-application-launcher").find(".add-new-tab-topbar").addClass("hide")}else{this.launcher.$element.closest(".topbar-application-launcher").find(".add-new-tab-topbar").removeClass("hide")}};l.prototype.initListeners=function(){var n=this;this.$scrollers.click(function(o){if(d(o.currentTarget).hasClass("scroller-left")){n.scrollNav("left")}else{n.scrollNav("right")}})};l.prototype.updateTabsBadge=function(){var n=this;this.$element.find(".application-nav-tab-link").each(function(o,p){let $tab=d(p);let $tabBadge=$tab.find(".topbar-item-badge");let tabId=$tab.data("target");tabId=tabId.substring(1,tabId.length);let $tabContent=n.launcher.$element.find("#"+tabId);let $badges=$tabContent.find(".tab-applications-items .topbar-item-badge");if($badges.length>0){$tabBadge.removeClass("hide");$tabBadge.removeClass("app-badge-level-info");$tabBadge.removeClass("app-badge-level-warning");$tabBadge.removeClass("app-badge-level-danger");let level="info";let levelIndex=0;$badges.each(function(r,q){let badgeLevel=d(q).data("level");let badgeLevelIndex=f.BadgeLevel[badgeLevel];if(badgeLevelIndex>levelIndex){level=badgeLevel;levelIndex=badgeLevelIndex}});$tabBadge.addClass("app-badge-level-"+level)}else{$tabBadge.addClass("hide")}})};l.prototype.getTotalWidth=function(){let totalWidth=1;this.$navTabs.find("li").each(function(n,o){totalWidth+=d(o).width()});return totalWidth};l.prototype.getCurrentScrollLeft=function(){return parseInt(this.$navTabs.css("left"),10)};l.prototype.scrollNav=function(o){var n=this;let $aimTab=null;let firstVisibleElementFound=false;this.$navTabs.find(".application-nav-tab, .application-nav-tab-add").each(function(p,q){if(f.checkInView(n.$navTabs,n.navMenuWidth,d(q),true)){firstVisibleElementFound=true;if(o=="left"){return false}}else{if(o=="right"&&firstVisibleElementFound){$aimTab=d(q);return false}}$aimTab=d(q)});let targetPosX;if(o=="left"){targetPosX=-$aimTab.position().left}else{targetPosX=this.navMenuWidth-($aimTab.width()+$aimTab.position().left)}this.$navTabs.one(d.support.transition.end,function(p){n.checkDisplayArrows()});this.$navTabs.css("left",targetPosX+"px")};l.prototype.getTabMenuWidth=function(){let tabMenuWidth=this.$navTabs.closest(".nav-tabs-wrapper").outerWidth(true);return tabMenuWidth};l.prototype.checkDisplayArrows=function(){let totalWidth=this.getTotalWidth();let tabMenuWidth=this.getTabMenuWidth();if(totalWidth>tabMenuWidth){this.$navTabs.css("min-width",totalWidth+"px");this.displayArrows()}else{this.removeArrows()}};l.prototype.checkDisplayLeftArrow=function(){if(parseInt(this.$navTabs.css("left"),10)==0){this.$scrollerLeft.css("visibility","hidden")}else{this.$scrollerLeft.css("visibility","visible")}};l.prototype.checkDisplayRightArrow=function(){let isLastItemInView=f.checkInView(this.$navTabs,this.navMenuWidth,this.$navTabs.find(".application-nav-tab-add"),false);if(isLastItemInView){this.$scrollerRight.css("visibility","hidden")}else{this.$scrollerRight.css("visibility","visible")}};l.prototype.displayArrows=function(){this.launcher.$element.addClass("display-arrows");this.checkDisplayLeftArrow();this.checkDisplayRightArrow()};l.prototype.removeArrows=function(){this.launcher.$element.removeClass("display-arrows")};l.prototype.focusLastTab=function(){let $lastTab=this.$navTabs.find(".application-nav-tab").last();$lastTab.find("a").click();let totalWidth=this.getTotalWidth();let tabMenuWidth=this.getTabMenuWidth();if(totalWidth>tabMenuWidth){this.$navTabs.css("left",tabMenuWidth-totalWidth-$lastTab.width()+"px")}};const k=function(n){this.launcher=n;this.$element=this.launcher.$element.find(".launcher-navtab-menu");this.$validateDelete=this.launcher.$element.find(".tab-delete-confirm");this.initListeners()};k.prototype.initListeners=function(){var n=this;this.$element.find(".js-tab-menu-cancel").on("click keydown",function(o){if(!d.jalios.a11y.isFocusedClick(o)){return}o.preventDefault();o.stopImmediatePropagation();n.removeMenu();n.launcher.removeBackdrop()});this.$element.find(".js-tab-menu-rename").on("click keydown",function(o){if(!d.jalios.a11y.isFocusedClick(o)){return}o.preventDefault();o.stopImmediatePropagation();n.removeMenu();n.launcher.newAppTab.displayRename()});this.$element.find(".js-tab-menu-delete").on("click keydown",function(o){if(!d.jalios.a11y.isFocusedClick(o)){return}o.preventDefault();o.stopImmediatePropagation();n.removeMenu();n.$validateDelete.removeClass("hide")});this.launcher.$backdrop.click(function(o){n.removeMenu()});this.launcher.$element.find(".js-delete-tab-validate").click(function(o){o.preventDefault();o.stopImmediatePropagation();n.launcher.deleteActiveTab();n.removeMenu()});this.launcher.$element.find(".js-delete-tab-cancel").click(function(o){o.preventDefault();o.stopImmediatePropagation();n.removeMenu()})};k.prototype.displayMenu=function(o,n){this.launcher.displayBackdrop();if(this.launcher.navTabs.$navTabs.find(".application-nav-tab").length==1){this.$element.find(".js-tab-menu-delete").hide()}this.$element.css({display:"block",left:o,top:n})};k.prototype.removeMenu=function(){this.$element.css("display","none");this.launcher.removeBackdrop();this.$validateDelete.addClass("hide")};const i=function(n){this.launcher=n;this.initListener()};i.prototype.initListener=function(){var n=this;let $addNewTab=this.launcher.$element.parent().find(".add-new-tab");$addNewTab.click(function(o){o.stopPropagation();o.stopImmediatePropagation();o.preventDefault();n.showAddTabInput()});$addNewTab.keydown(function(o){if(o.keyCode===32){n.showAddTabInput();o.preventDefault()}})};i.prototype.displayRename=function(){this.launcher.navTabs.$navTabs.hide();this.launcher.navTabs.removeArrows();var n=b.NEW_APPLICATION_INPUT();this.launcher.$element.find(".nav-tabs-wrapper").prepend(n);let currentName=this.launcher.navTabs.$navTabs.find(".application-nav-tab.active a").text();currentName=currentName.trim();this.$element=this.launcher.$element.find(".new-tab-display");this.$element.find(".tab-title").val(currentName);this.$element.find(".tab-title").focus();var o=this;this.$element.find(".js-cancel-new-tab").click(function(p){p.preventDefault();p.stopPropagation();o.removeAddTabInput()});this.$element.find(".js-cancel-new-tab").keydown(function(p){if(p.keyCode===32){o.removeAddTabInput();p.preventDefault()}});this.$element.find(".js-create-new-tab").click(function(p){p.preventDefault();p.stopPropagation();let tabTitle=o.$element.find(".tab-title").val();o.launcher.renameActiveTab(tabTitle);o.removeAddTabInput()});this.$element.find(".js-create-new-tab").keydown(function(p){if(p.keyCode===32){let tabTitle=o.$element.find(".tab-title").val();o.launcher.renameActiveTab(tabTitle);p.preventDefault()}});this.$element.find(".tab-title").keyup(function(p){if(p.keyCode==13){o.removeAddTabInput();o.launcher.renameActiveTab(d(p.target).val())}})};i.prototype.showAddTabInput=function(){this.launcher.navTabs.$navTabs.hide();this.launcher.navTabs.removeArrows();var n=b.NEW_APPLICATION_INPUT();this.launcher.$element.find(".nav-tabs-wrapper").prepend(n);this.$element=this.launcher.$element.find(".new-tab-display");this.$element.find(".tab-title").focus();var o=this;this.$element.find(".js-cancel-new-tab").click(function(p){p.preventDefault();p.stopPropagation();o.removeAddTabInput()});this.$element.find(".js-create-new-tab").click(function(p){p.preventDefault();p.stopPropagation();o.checkAndCreateNewTab()});this.$element.find(".tab-title").keyup(function(p){if(p.keyCode==13){o.checkAndCreateNewTab()}})};i.prototype.checkAndCreateNewTab=function(){let that=this;let tabTitle=that.$element.find(".tab-title").val();if(tabTitle.trim()==""){return}that.removeAddTabInput();that.launcher.addTab(tabTitle)};i.prototype.removeAddTabInput=function(){this.$element.remove();this.launcher.navTabs.$navTabs.show();this.launcher.navTabs.checkDisplayArrows()};var m=function(n){this.launcher=n;this.isHelperActive=false};m.prototype.recalculateActiveTabCloneDivDimension=function(){this.launcher.$tabActive.find(".tab-applications-items-clone").width(this.launcher.$tabActive.find("tab-applications-items").width()).height(this.launcher.$tabActive.find("tab-applications-items").height())};m.prototype.resetActiveTabClones=function(){var n=this.launcher.$tabActive.find(".tab-applications-items-clone");n.empty();this.recalculateActiveTabCloneDivDimension();this.launcher.$tabActive.find(".tab-applications-items .launcher-application-item").not(".exclude-me").each(function(){var p=d(this);var q=p.clone();p.data("clone",q);var o=p.position();q.css("left",o.left);q.css("top",o.top);q.addClass("is-clone");q.find(".topbar-item-badge").remove();n.append(q)})};m.prototype.helperOverTabHandler=function(){this.helperOver()};m.prototype.helperOutTabHandler=function(){if(!this.launcher.isOneTabDropActivated()){this.helperOut()}};m.prototype.helperOut=function(){this.$appHelper.removeClass("helper-over-tab");this.launcher.$tabActive.find(".ui-sortable-placeholder").css("display","block");this.updatePositions()};m.prototype.helperOver=function(){this.$appHelper.addClass("helper-over-tab");this.launcher.$tabActive.find(".ui-sortable-placeholder").css("display","none");this.updatePositions()};m.prototype.updatePositions=function(){this.launcher.$tabActive.find(".tab-applications-items .launcher-application-item:not(.exclude-me, .ui-sortable-placeholder, .app-draggable-clone)").each(function(){var o=d(this);var p=o.data("clone");p.stop(true,false);var n=o.position();p.animate({left:n.left,top:n.top},200)})};m.prototype.initHelper=function(o){var n=this;this.isHelperActive=true;this.$appHelper=o.helper;this.$appHelper.addClass("exclude-me");this.$appHelper.addClass("application-sortable-helper");this.$appHelper.find(".topbar-item-badge").remove()};m.prototype.removeHelper=function(){this.isHelperActive=false};m.prototype.startDrag=function(){this.launcher.$tabActive.find(".tab-applications-items-clone").removeClass("hide");this.launcher.$tabActive.find(".tab-applications-items .launcher-application-item:not('.app-draggable-clone, .exclude-me')").css("visibility","hidden")};var a=function(n){this.$element=d(n);this.$element.data("jalios-launcher",this);this.applicationClones=new m(this);this.isIE11=!!g.MSInputMethodContext&&!!h.documentMode;this.isSafari=navigator.vendor&&navigator.vendor.indexOf("Apple")>-1&&navigator.userAgent&&navigator.userAgent.indexOf("CriOS")==-1&&navigator.userAgent.indexOf("FxiOS")==-1;this.initGlobalEvents();this.init()};a.prototype.initGlobalEvents=function(){var n=this;d(h).on("jalios.application-launcher",function(o){let eventName=o.applicationLauncher.name;if(eventName=="addApplication"||eventName=="removeApplication"){n.update()}})};a.prototype.init=function(){e(b,"APPLICATION_LAUNCHER",Handlebars.compile(this.$element.find(".application-launcher-template").html()));e(b,"APPLICATION",Handlebars.compile(this.$element.find(".application-template").html()));e(b,"NEW_APPLICATION_INPUT",Handlebars.compile(this.$element.find(".new-tab-application-template").html()));e(b,"APPLICATION_TAB",Handlebars.compile(this.$element.find(".application-tab-template").html()));e(b,"APPLICATION_TAB_CONTENT",Handlebars.compile(this.$element.find(".application-tab-content-template").html()));e(b,"APPLICATION_STORE_MENU",Handlebars.compile(this.$element.find(".application-store-menu").html()));e(b,"APPLICATIONS_STORE",Handlebars.compile(this.$element.find(".applications-store").html()));e(b,"APPLICATIONS_STORE_INSTALL_MENU",Handlebars.compile(this.$element.find(".application-store-install-menu").html()));this.service=d.jalios.launcher.service.getInstance();this.ApplicationStore=new j(this);this.loadApplicationLauncher(this.initApplicationLauncher)};a.prototype.displayBackdrop=function(){this.$backdrop.removeClass("hide")};a.prototype.deleteActiveTab=function(){this.navTabs.$navTabs.find(".application-nav-tab.active").remove();this.saveApplicationLauncher();this.initApplicationLauncher()};a.prototype.removeBackdrop=function(){this.$backdrop.addClass("hide")};a.prototype.renameActiveTab=function(n){if(n.trim()==""){return}this.navTabs.$navTabs.find(".application-nav-tab.active .tab-name").text(n);this.saveApplicationLauncher()};a.prototype.installApp=function(o,n){if(this.applicationLauncherJson.tabs[n].applications==null){this.applicationLauncherJson.tabs[n].applications=[]}this.applicationLauncherJson.tabs[n].applications.push({shortcutId:o});this.ApplicationStore.updateInstalledApplicationsCssClass();this.saveApplicationLauncherJsonAndUpdateMenu()};a.prototype.removeApp=function(p,n){var o=this;this.applicationLauncherJson.tabs[n].applications.each(function(r,q){if(r.shortcutId==p){o.applicationLauncherJson.tabs[n].applications.splice(q,1)}});this.ApplicationStore.updateInstalledApplicationsCssClass();this.saveApplicationLauncherJsonAndUpdateMenu()};a.prototype.addTab=function(n){let that=this;this.tabIndex++;let html=b.APPLICATION_TAB({name:n,index:this.tabIndex});d(html).insertAfter(this.navTabs.$navTabs.find(".application-nav-tab").last());html=b.APPLICATION_TAB_CONTENT({index:this.tabIndex});this.$element.find(".tab-content").append(html);this.saveApplicationLauncher(function(){that.navTabs.focusLastTab()});this.initApplicationLauncher()};a.prototype.update=function(){this.loadApplicationLauncher(this.initApplicationLauncher)};a.prototype.initApplicationLauncher=function(){var n=this;this.destroyPs();this.displayApplicationLauncher(function(){n.navTabs=new l(n);n.initElementsVariables();n.initTabEditionMenu();n.initActiveTabListener();n.initListeners();n.initApplicationsSortable();n.initTabsSortable();n.initTabsDroppable();n.initBinDroppable();n.refreshShortcutBadges();n.navTabs.checkDisplayArrows();n.newAppTab=new i(n);n.$element.closest(".topbar-application-launcher").find(" > .dropdown-menu").removeClass("is-loading");n.$element.closest(".topbar-application-launcher").find(".js-topbar-add-menu").on("click",function(o){if(d(o.target).hasClass("js-topbar-add-menu")){d(o.target).addClass("open");o.stopPropagation();o.stopImmediatePropagation()}});d.jalios.launcher.service.getInstance().triggerEvent("renderComplete")})};a.prototype.refreshShortcutBadges=function(){var n=this;this.$element.find("[data-jalios-application-async-url]").each(function(q,r){var p=d(r);var o=p.data("jalios-dataid");d.getJSON(p.data("jalios-application-async-url"),{shortcutId:o},function(t){if(t){if(p.find(".topbar-item-badge").exists()){p.find(".topbar-item-badge").remove()}if(t.title){p.find(".label-wrapper").html(t.title)}if(t.url){p.attr("href",t.url)}var u=t.badgeLevel&&t.badgeText;if(u){var s=d("<span>",{"class":"topbar-item-badge fade"});s.html(t.badgeText);s.data("level",t.badgeLevel.toLowerCase());s.addClass("app-badge-level-"+t.badgeLevel.toLowerCase());if(t.badgeTitle){s.attr("title",t.badgeTitle)}p.prepend(s);s.addClass("in")}n.navTabs.updateTabsBadge()}})})};a.prototype.initElementsVariables=function(){this.$navtabMenu=this.$element.find(".launcher-navtab-menu");this.$backdrop=this.$element.find(".application-launcher-backdrop");this.$bin=this.$element.find(".application-trash")};a.prototype.initTabEditionMenu=function(){this.editTabMenu=new k(this)};a.prototype.initListeners=function(){var n=this;this.navTabs.$navTabs.find(".launcher-navtab-menu-btn").on("click keydown",function(o){if(!d.jalios.a11y.isFocusedClick(o)){return}n.editTabMenu.displayMenu(d(o.currentTarget).offset().left-n.navTabs.$navTabs.offset().left+parseInt(n.navTabs.$navTabs.css("left"),10),d(o.currentTarget).offset().top-n.navTabs.$navTabs.offset().top)})};a.prototype.displayBin=function(){var n=this;this.$bin.addClass("active")};a.prototype.removeBin=function(){this.$bin.removeClass("active")};a.prototype.initBinDroppable=function(){var n=this;this.$bin.find(".trash-overlay").droppable({accept:".launcher-application-item",over:function(o,p){d(o.target).parent().addClass("application-over-bin");n.applicationClones.$appHelper.addClass("helper-over-tab")},out:function(o,p){d(o.target).parent().removeClass("application-over-bin");n.applicationClones.$appHelper.removeClass("helper-over-tab")},drop:function(o,p){d(p.draggable).remove();d(o.target).parent().removeClass("application-over-bin");n.updatePs()}});this.$bin.removeClass("not-initialized")};a.prototype.initTabsDroppable=function(){var n=this;let $tabs=this.navTabs.$navTabs.find("li:not(.add-new-tab)");$tabs.droppable({accept:".launcher-application-item",over:function(o,p){d(o.target).addClass("tab-drop-over");n.applicationClones.helperOverTabHandler()},out:function(o,p){d(o.target).removeClass("tab-drop-over");n.applicationClones.helperOutTabHandler()},drop:function(o,p){}});this.navTabs.$navTabs.find("li.active").droppable("destroy")};a.prototype.initActiveTabListener=function(){var n=this;this.$tabActive=n.$element.find(".tab-applications.active");this.updatePs();this.$element.find('a[data-toggle="tab"]').on("shown.bs.tab",function(p){n.initTabsDroppable();var o=d(p.target).data("target");n.$tabActive=d(o);n.initApplicationsSortable();n.updatePs()});n.$tabActive=n.$element.find(".tab-applications.active")};a.prototype.loadApplicationLauncher=function(o){var n=this;this.service.getApplicationLauncher(function(p){try{n.applicationLauncherJson=p;n.tabIndex=n.applicationLauncherJson.tabs.length;if(o){o.apply(n)}}catch(q){location.reload()}},function(p){f.log(p);location.reload()})};a.prototype.displayLoadingError=function(){this.$element.find(".ajax-loading-component").remove();this.$element.closest(".topbar-application-launcher").find(" > .dropdown-menu").removeClass("is-loading");this.$element.find(".application-launcher-error").removeClass("hide")};a.prototype.removeLoadingError=function(){this.$element.find(".application-launcher-error").addClass("hide")};a.prototype.displayApplicationLauncher=function(p){var o=this;var n=b.APPLICATION_LAUNCHER(this.applicationLauncherJson);let $buffer=this.$element.find(".application-launcher-buffer");$buffer.html(n);$buffer.imagesLoaded({},function(){o.$element.html(n);p()})};a.prototype.getApplicationLauncherAsJson=function(){let tabs=[];var o=this;this.$element.find(".nav-tabs .application-nav-tab a").each(function(p,q){let tab={};let applications=[];tab.name=d(q).find(".tab-name").text().trim();let tabId=d(q).data("target");o.$element.find(tabId).find(".tab-applications-items .launcher-application-item").each(function(r,s){let application={};let $element=d(s);let shortcutId=$element.data("jalios-dataid");let img=$element.find("img").attr("src");let name=$element.find(".label-wrapper").text().trim();let url=$element.attr("href");application.shortcutId=shortcutId;application.image=img;application.name=name;application.url=url;if($element.data("jalios-application-async-url")){application.asyncUrl=$element.data("jalios-application-async-url")}applications[r]=application});tab.applications=applications;tabs[p]=tab});var n=JSON.stringify({tabs:tabs});return n};a.prototype.saveApplicationLauncher=function(n){let json=this.getApplicationLauncherAsJson();this.applicationLauncherJson=JSON.parse(json);let cleanedJSON=this.getCleanedApplicationLauncherJSON();this.service.saveApplicationLauncher(cleanedJSON,function(o){f.log("Saved application launcher in member prefs");n&&n()},function(o){f.log("An error as occured during member prefs update")})};a.prototype.saveApplicationLauncherJsonAndUpdateMenu=function(){var n=this;let cleanedJSON=this.getCleanedApplicationLauncherJSON();this.service.saveApplicationLauncher(cleanedJSON,function(o){n.update()},function(o){f.log("An error as occured during member prefs update")})};a.prototype.getCleanedApplicationLauncherJSON=function(){let cleanedJSON=d.extend(true,{},this.applicationLauncherJson);d.each(cleanedJSON.tabs,function(n,o){if(o.shortcutIds){delete o.shortcutIds}d.each(o.applications,function(q,p){delete p.image;delete p.name;delete p.asyncUrl;delete p.url})});return cleanedJSON};a.prototype.handleAppSortableEvent=function(n,o){this.applicationClones.removeHelper();this.$tabActive.find("a.exclude-me").each(function(){var q=d(this);var r=q.data("clone");if(r){var p=q.position();r.css("left",p.left);r.css("top",p.top);r.show()}q.removeClass("exclude-me")});this.$tabActive.find(".tab-applications-items .launcher-application-item").css("visibility","visible");this.$tabActive.find(".tab-applications-items-clone").addClass("hide");this.saveApplicationLauncher()};a.prototype.handleAppDroppableEvent=function(p,r){var q={};var t=this.applicationClones.$appHelper;q.shortcutId=t.data("jalios-dataid");q.image=t.find("img").attr("src");q.name=t.find(".label-wrapper").text();q.url=t.attr("href");q.htmlAttributes=t.data("jalios-html-attributes");if(t.data("jalios-application-async-url")){q.asyncUrl=t.data("jalios-application-async-url")}this.$tabActive.find("[data-jalios-dataid='"+q.shortcutId+"']").remove();const n=this.$element.find(".tab-drop-over a").data("target");const s=d(n);let alreadyExistApp=s.find(".tab-applications-items a[data-jalios-dataid='"+q.shortcutId+"']");if(!alreadyExistApp.length){var o=b.APPLICATION(q);s.find(".tab-applications-items").append(o)}if(d(o).data("jalios-application-async-url")){this.refreshShortcutBadges()}this.navTabs.$navTabs.find("li").removeClass("tab-drop-over");this.applicationClones.removeHelper();this.$tabActive.find("a.exclude-me").each(function(){var u=d(this);var v=u.data("clone");v.remove();v.addClass("scale-out-bottom");u.remove()});this.$tabActive.find(".tab-applications-items .launcher-application-item").css("visibility","visible");this.$tabActive.find(".tab-applications-items-clone").addClass("hide");this.saveApplicationLauncher();this.updatePs()};a.prototype.destroyPs=function(){if(this.ps!=null){this.ps.destroy();this.ps=null}};a.prototype.updatePs=function(){if(this.isIE11||this.isSafari){return}var n=this;if(this.ps==null){let $tabContent=this.$element.find(".tab-content");this.ps=new PerfectScrollbar($tabContent[0])}else{this.ps.update()}};a.prototype.isOneTabDropActivated=function(){return this.navTabs.$navTabs.find(".tab-drop-over").length>0};a.prototype.initTabsSortable=function(){var o=this;var n=o.$element.find(".nav-tabs");this.navTabs.$navTabs.sortable({delay:d.support.touch?150:0,items:".application-nav-tab",tolerance:"pointer",forceHelperSize:true,helper:"clone",containment:n,cursorAt:{left:30,top:24},stop:function(p,q){o.saveApplicationLauncher()}})};a.prototype.initApplicationsSortable=function(){var n=this;n.$tabActive.find(".tab-applications-items").sortable({helper:"clone",start:function(p,o){n.destroyPs();n.applicationClones.initHelper(o);n.applicationClones.resetActiveTabClones();n.applicationClones.startDrag();n.displayBin()},appendTo:n.$element,cursorAt:{left:50,top:41},change:function(p,o){n.applicationClones.updatePositions()},delay:150,tolerance:"pointer",stop:function(o,p){n.updatePs();n.removeBin();if(n.isOneTabDropActivated()){n.handleAppDroppableEvent(o,p)}else{n.handleAppSortableEvent(o,p)}}})}})(jQuery,window,document);