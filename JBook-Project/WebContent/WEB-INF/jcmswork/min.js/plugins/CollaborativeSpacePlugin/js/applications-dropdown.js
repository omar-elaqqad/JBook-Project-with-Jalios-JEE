!(function(c){const a=function(){new b(c("#cs-header-tabs"))};const b=function(d){this.$element=d;this.$backdrop=c(".application-edition-backdrop");this.$backdrop.prependTo(document.body);this.$menu=d.find(".dropdown-menu.applications-menu");this.$menu.prependTo(document.body);this.initListeners();let $tabsUL=d.find(">ul");this.cspId=$tabsUL.data("csp-id");this.confirmMessage=$tabsUL.data("remove-app-confirm-message");this.redirectHomeUrl=$tabsUL.data("home-url");this.isOpen=false};b.prototype.initListeners=function(){let that=this;this.$element.find(".application-menu-btn").click(function(d){d.preventDefault();d.stopImmediatePropagation();let $target=c(d.target);let displayX=$target.offset().left;let displayY=$target.offset().top;that.isEditable=c(d.target).closest("li").data("is-editable");that.displayMenu(displayX,displayY);that.$currentTab=c(d.target).closest("li");that.currentAppId=c(d.target).closest("li").data("portlet-id")});c(document).on("click",function(d){if(that.isOpen){d.preventDefault();d.stopImmediatePropagation();that.removeMenu();that.removeBackDrop()}});this.$backdrop.click(function(d){that.removeMenu()});this.$menu.find(".js-tab-menu-rename").click(function(d){d.preventDefault();d.stopImmediatePropagation();that.removeMenu();c.jalios.ui.Modal.openFromUrl("plugins/CollaborativeSpacePlugin/jsp/portal/doServiceRenameModal.jsp?id="+that.currentAppId)});this.$menu.find(".js-tab-menu-delete").click(function(d){d.preventDefault();d.stopImmediatePropagation();that.removeMenu();c.jalios.ui.Modal.confirm(that.confirmMessage,function(){c.ajax({url:"plugins/CollaborativeSpacePlugin/jsp/portal/collaborativeSpaceActions.jsp",traditional:true,method:"post",data:{appId:that.currentAppId,opRemoveApp:true,csId:that.cspId},success:function(e){let activeTab=that.$element.find("li.active").first();if(!activeTab){return}c.jalios.Browser.redirect(that.redirectHomeUrl)}})})})};b.prototype.displayMenu=function(e,d){this.isOpen=true;if(!this.isEditable){this.$menu.find(".js-tab-menu-rename").hide()}else{this.$menu.find(".js-tab-menu-rename").show()}this.$menu.css({display:"block",left:e,top:d});this.displayBackDrop()};b.prototype.displayBackDrop=function(){};b.prototype.removeBackDrop=function(){};b.prototype.removeMenu=function(){this.$menu.css("display","none");this.isOpen=false;this.removeBackDrop()};c(document).ready(function(){a()})})(window.jQuery);