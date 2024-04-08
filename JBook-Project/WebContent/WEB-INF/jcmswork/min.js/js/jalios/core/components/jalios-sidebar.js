(function(e,h,i,b){var g="sidebar",d={jaliosSidebarOverlay:true,jaliosSidebarDirection:"left",jaliosSidebarReadyOpen:false,jaliosSidebarCloseOnModal:true};function k(q,p){this.element=q;this.trigger=p?p.trigger:null;this.settings=e.extend({},d,e(this.element).data(),p);this._defaults=d;this._name=g;this.init()}e.extend(k.prototype,{init:function(){var p=this;e(this.element).addClass("ajax-refresh-div ajax-waiting-0.25");if(this.settings.jaliosSidebarDirection=="right"){e(this.element).addClass("sidebar-right")}else{if(e(this.element).hasClass("sidebar-right")){this.settings.jaliosSidebarDirection="right"}}if(this.settings.jaliosSidebarOverlay){l.apply(this)}},getFirstActiveElement:function(){const p=e.jalios.a11y.getFocusInformation(this.element);return p.firstFocusableElement},open:function(q){var p=this;if(p.settings.jaliosSidebarOverlay){e(i).one("click",".sidebar-backdrop",function(r){p.close()})}if(q.url){this.displayAjaxLoadingAnimation.apply(this);e(this.element).refresh({url:q.url,noscroll:true,nofocus:true})}j.apply(this)},close:function(){n();f.apply(this)},displayAjaxLoadingAnimation:function(){if(e.fn.displayLoading){e(this.element).displayLoading()}}});var j=function(){var q=this;var s=this.settings.jaliosSidebarDirection;var t={};var p=e(q.element);t[s]=0;var r=e.Event("show.jalios.sidebar",{sidebar:p});p.trigger(r);e("BODY").addClass("sidebar-open");if(q.settings.jaliosSidebarOverlay){a()}p.one(e.support.transition.end,function(){var u=e.Event("shown.jalios.sidebar",{sidebar:p});p.trigger(u);o(q)});p.removeClass("is-closed");setTimeout(function(){p.addClass("is-open")},10);if(this.settings.jaliosSidebarOverlay){e(i).on("SIDEBAR_ESCAPE",function(u){f.apply(q)})}};var f=function(){e(i).off("SIDEBAR_ESCAPE");e.fn.dropdown.clearMenus();var q=this;var r=this.settings.jaliosSidebarDirection;var t={};t[r]=-e(this.element).outerWidth(true)*2;var p=e(q.element);if(p.hasClass("is-closed")){return}var s=e.Event("start-hide.jalios.sidebar",{sidebar:p});p.trigger(s);p.one(e.support.transition.end,function(){var u=e.Event("hidden.jalios.sidebar",{sidebar:p});p.trigger(u);if(q.settings.jaliosSidebarOverlay){c();p.addClass("is-closed")}e("BODY").removeClass("sidebar-open");if(q.trigger){e(q.trigger).focus()}});p.removeClass("is-open")};var l=function(){if(e("body").find(".sidebar-backdrop").length==0){e("body").append(e("<div/>").addClass("sidebar-backdrop fade fadeout"))}};var a=function(){e(".sidebar-backdrop").addClass("full in")};var c=function(){var p=e(".sidebar-backdrop");p.removeClass("in");p.one(e.support.transition.end,function(){p.removeClass("full")})};const o=function(p){let $element=e(p.element);if(!$element.exists()){return}e(p.getFirstActiveElement()).focusElement();e(i).on("keydown.jalios.sidebar",function(q){e.jalios.a11y.handleKeydownTabEvent(q,$element)})};const n=function(){e(i).off("keydown.jalios.sidebar")};var m=function(){e(i).on("keydown",function(p){p=p||h.event;if(p.key==="Escape"){e(i).trigger("SIDEBAR_ESCAPE")}});e(i).on("keydown",'[data-jalios-sidebar-action="close"]',function(p){if(p.key!=="Enter"){return}let target=e(this).data("jalios-sidebar-target");e(target).data(g)["close"]()});e(i).on("click keydown","[data-jalios-sidebar-target]",function(p){if(!e.jalios.a11y.isFocusedClick(p)){return}let $target=e(p.target);if(!$target.data("jalios-sidebar-target")&&($target.is("A")||$target.is("INPUT")||$target.hasClass("jalios-sidebar-no-open"))){return}p.preventDefault();let target=e(this).data("jalios-sidebar-target");let action=e(this).data("jalios-sidebar-action");let options={url:e(this).data("jalios-sidebar-url")};let sidebarPlugin=e(target).data(g);if(sidebarPlugin==null){e(target).sidebar({trigger:e(p.currentTarget)})}e(target).data(g)[action](options)});e(".sidebar-component").removeClass("hide")};e.fn[g]=function(p){return this.each(function(){if(!e.data(this,g)){e.data(this,g,new k(this,p))}})};e(i).ready(function(p){m()})})(jQuery,window,document);