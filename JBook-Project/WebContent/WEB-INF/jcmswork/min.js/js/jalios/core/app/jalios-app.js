!(function(b){let currentPlugin;const c=window.matchMedia("screen and (max-width: 480px)");let sidebarBurgerTemplate;let sidebarRefresh=false;const h=function(){b(".app-sidebar .form-control:input").each(function(){if(this.value!==""){b(this).addClass("has-value")}})};const e=function(l){if(b.jalios.Event.match(l,"refresh","before")){if(l.refresh.options.brokerTrigger&&b(l.refresh.options.brokerTrigger).closest(".app-sidebar").exists()){sidebarRefresh=true}else{if(l.refresh.options.trigger&&b(l.refresh.options.trigger).closest(".app-sidebar").exists()){sidebarRefresh=true}}return}const k=b.jalios.Event.match(l,"refresh","after");if(!k){return}var j=l.refresh.target.find(".app-sidebar");if(j.exists()){h();if(b(".app").data("plugin_jaliosApp")){b(".app").data("plugin_jaliosApp").addLastVisibleButtonClass(l.target)}else{b(".app").jaliosApp()}}if(sidebarRefresh){b(".app-body").attr("tabindex","-1");b(".app-body")[0].focus({preventScroll:true});sidebarRefresh=false}};const d="jaliosApp",a={};function f(k,j){this.$element=b(k);this.settings=b.extend({},a,j);this._defaults=a;this._name=d;this.hasToggler=this.$element.find(".sidebar-pull-wrapper").exists();if(this.hasToggler){this.$element.addClass("is-toggleable-app")}this.init()}b.extend(f.prototype,{init:function(){currentPlugin=this;currentPlugin.checkMediaQuery();b(window).resize(function(){currentPlugin.checkMediaQuery()});this.$element.on("click",".sidebar-pull-wrapper",function(j){currentPlugin.toggleSidebar(j)});this.$element.on("keydown",".app-sidebar-section LABEL[role=button]",function(j){if(b.jalios.a11y.isFocusedClick(j)){j.preventDefault();const k=b(j.currentTarget).find(":input");if(k.is(":checked")){k.prop("checked",false)}else{k.prop("checked",true)}}});this.$element.on("keydown",function(j){if(b(document.activeElement).is(".sidebar-pull-wrapper")&&(j.keyCode===13||j.keyCode===32)){currentPlugin.toggleSidebar(event);j.preventDefault()}});this.$element.on("click",".js-toggle-sidebar",function(j){j.preventDefault();currentPlugin.toggleResponsiveSidebar(j)});this.$element.on("click",".js-search-cancel, .btn-reset-search",function(j){let $searchWidget=b(j.currentTarget).closest(".widget");$searchWidget.find(".app-search-field, input[type=text]").val("");$searchWidget.find(".app-search-submit, .btn-submit-search").click()});this.$element.find(".app-sidebar .input-group-btn").each(function(j,k){b(k).find(".btn:visible").last().addClass("is-last-visible-btn")});this.addLastVisibleButtonClass();b(document).on("shown.bs.collapse",".app-sidebar .collapse",function(j){currentPlugin.addLastVisibleButtonClass(j.target)});b(".app-sidebar-section .radio.control-enumerate, .app-sidebar-section .checkbox.control-enumerate, .app-sidebar-treecat li").each(function(j,k){b(k).find("> label").attr("tabindex",0).attr("role","button");b(k).find("> label").on("keypress",function(l){if((l.key||l.which||(l.keyCode===32||l.keyCode===13))){b(l.currentTarget).find("input").prop("checked",true).trigger("change")}})})},checkMediaQuery:function(){if(c.matches&&!this.$element.hasClass("is-no-responsive")){currentPlugin.$element.addClass("app-mobile");if(!currentPlugin.$element.find(".app-header .js-toggle-sidebar").exists()){currentPlugin.$element.find(".app-header > H1").prepend(sidebarBurgerTemplate)}if(!currentPlugin.$element.find(".app-sidebar .js-toggle-sidebar").exists()){currentPlugin.$element.find(".app-sidebar .app-sidebar-icon").prepend(sidebarBurgerTemplate)}currentPlugin.$element.addClass("is-sidebar-folded-mq")}else{if(!this.$element.hasClass("is-no-responsive")){currentPlugin.$element.removeClass("app-mobile");currentPlugin.$element.find(".app-header > H1 .js-toggle-sidebar").remove();currentPlugin.$element.find(".app-sidebar .app-sidebar-icon .js-toggle-sidebar").remove();currentPlugin.$element.removeClass("is-sidebar-folded-mq");currentPlugin.getToggler().attr("aria-expanded",true)}}},addLastVisibleButtonClass:function(j){let $element;if(!j){$element=this.$element.find(".app-sidebar")}else{$element=b(j)}$element.find(".input-group-btn").each(function(k,l){b(l).find(".btn:visible").last().addClass("is-last-visible-btn")})},toggleResponsiveSidebar:function(j){if(currentPlugin.$element.hasClass("is-sidebar-folded")||currentPlugin.$element.hasClass("is-sidebar-folded-mq")){currentPlugin.openSidebar(j)}else{currentPlugin.closeSidebar(j)}},getToggler:function(){return currentPlugin.$element.find(".sidebar-pull-wrapper")},getSidebar:function(){return currentPlugin.$element.find(".app-sidebar")},toggleSidebar:function(j){if(currentPlugin.$element.hasClass("is-sidebar-folded")){currentPlugin.openSidebar(j)}else{currentPlugin.closeSidebar(j)}},openSidebar:function(j){var k=b.Event("show.jalios.sidebar",{app:currentPlugin.$element,event:j});currentPlugin.getSidebar().css("visibility","visible");currentPlugin.getToggler().attr("aria-expanded",true);currentPlugin.$element.trigger(k).removeClass("is-sidebar-folded").removeClass("is-sidebar-folded-mq");currentPlugin.$element.one(b.support.transition.end,function(){var l=b.Event("shown.jalios.sidebar",{app:currentPlugin.$element,event:j});currentPlugin.$element.trigger(l)})},closeSidebar:function(j){var k=b.Event("start-hide.jalios.sidebar",{app:currentPlugin.$element,event:j});currentPlugin.getToggler().attr("aria-expanded",false);currentPlugin.$element.trigger(k).addClass("is-sidebar-folded");currentPlugin.$element.one(b.support.transition.end,function(){var l=b.Event("hidden.jalios.sidebar",{app:currentPlugin.$element,event:j});currentPlugin.$element.trigger(l);setTimeout(function(){currentPlugin.getSidebar().css("visibility","hidden")},100)})}});b.fn[d]=function(j){return this.each(function(){if(!b.data(this,"plugin_"+d)){b.data(this,"plugin_"+d,new f(this,j))}})};const i=function(){b(document).on("jalios:ready",function(){b(".app").jaliosApp()})};const g=function(){b(".app").jaliosApp();b(document).on("jalios:refresh",e);b(document).on("input change propertychange",".app-sidebar .form-control:input",function(j){if(this.value!==""){b(this).addClass("has-value")}else{b(this).removeClass("has-value")}});b(document).on("jalios.date.change",".app-sidebar .form-control:input",function(j){if(this.value!==""){b(this).addClass("has-value")}else{b(this).removeClass("has-value")}});h()};b(document).ready(function(k){let burger=document.getElementById("jalios-app-sidebar-burger");if(burger){var j=burger.innerHTML;sidebarBurgerTemplate=Handlebars.compile(j)}g();i()})})(window.jQuery);