(function(a){a.navmenu=function(d,c){var f={hiddenContainerClass:"hide"};var e=this;e.settings={};var b=a(d),d=d;e.init=function(){e.settings=a.extend({},f,c)};e.handleLinkChange=function(g){var h=a(g).closest(".nav-menu");var i=a(g).data("jalios-navmenu-target");a(".menu A",h).removeClass("selected ui-state-persist");a(g).addClass("selected ui-state-persist");a(".nav-menu-container",h).addClass(e.settings.hiddenContainerClass);a(i,h).removeClass("hide")};e.init()};a.fn.navmenu=function(b){return this.each(function(){if(undefined==a(this).data("navmenu")){var c=new a.navmenu(this,b);a(this).data("navmenu",c);c.handleLinkChange(this)}else{var c=a(this).data("navmenu");c.handleLinkChange(this)}})};a(document).on("tap",".nav-menu .menu A",function(c){c.preventDefault();var b=a(c.target);b.navmenu()})})(jQuery);