!function(f){var b=function(){q();m();h()};var a=false;var d=false;var t=false;var j=false;var p=false;var q=function(){a='<img alt="" src="images/jalios/icons/editSmall.gif" class="icon">';a='<button class="wiki-action wiki-edit-section hidden-print btn btn-link">'+a+"</button>";d='<button class="wiki-action wiki-save-section btn btn-primary btn-xs">'+f.jalios.I18N.glp("wiki.section.save")+"</button>";t='<button class="wiki-action wiki-cancel-section btn btn-default btn-xs">'+f.jalios.I18N.glp("wiki.section.cancel")+"</button>";f(document).on("click",".wiki-edit-section",g);f(document).on("click",".wiki-save-section",g);f(document).on("click",".wiki-cancel-section",g);j=f('<div id="edit-widget" class="edit-widget" ></div>').appendTo(document.body);f(document).on("jalios:refresh",h)};var g=function(w){w.preventDefault();var v=f(w.currentTarget);if(v.hasClass("wiki-edit-section")){o(v)}else{if(v.hasClass("wiki-save-section")){s(v)}else{if(v.hasClass("wiki-cancel-section")){c(v)}}}};var o=function(x){c();f(x.eq(0)).closest(".wiki-edit").addClass("wiki-edit-enabled");var C=n(x);if(!C.id||!C.field){return}var v=i(C);if(!v){return}var A=window.scrollY!==undefined;var z=window.pageXOffset!==undefined;var B;if(A){B=window.scrollY}else{if(z){B=window.pageYOffset}else{var D=((document.compatMode||"")==="CSS1Compat");B=D?document.documentElement.scrollTop:document.body.scrollTop}}var y=Math.max(Math.min(f(window).height()-(v.top-B)-40,v.height),200);j.css("left",v.left+"px").css("top",v.top+"px").css("width",v.width+"px").css("height",y+"px").show();var w="jcore/wiki/wikiSection.jsp?";w+="id="+C.id+"&field="+C.field+"&section="+C.index+"&mdate="+C.mdate;x.refresh({url:w,target:j,noscroll:true,nohistory:true})};var s=function(x){var v=n(x);if(!v.id||!v.field){return}var y=j.find("TEXTAREA");var w="jcore/wiki/wikiSection.jsp?";w+="id="+v.id+"&field="+v.field+"&section="+v.index+"&mdate="+v.mdate;w+="&update="+encodeURIComponent(y.val());x.refresh({url:w,noresponse:true,callback:function(){c();x.refresh({noscroll:true,nohistory:true})}})};var c=function(w){if(!p){return}p.removeClass("wiki-editing");j.hide();if(!w){return}f(w.eq(0)).closest(".wiki-edit").removeClass("wiki-edit-enabled");var x=w.closest(".wiki-edit").getJcmsId();var v="jcore/wiki/wikiSection.jsp?id="+x+"&unlock=true";w.refresh({url:v,noresponse:true})};var h=function(x){var v=f(document);var w=f.jalios.Event.match(x,"refresh","after");if(w&&w.target){v=w.target}v.find(".wiki-edit").each(function(){var y=f(this);if(!y.hasClass("wiki-edit-upgrade")){y.addClass("wiki-edit-upgrade");y.append(a).append(d).append(t)}y.find(".wiki-section").not(".wiki-section-upgrade").each(function(){f(this).addClass("wiki-section-upgrade").append(a).append(d).append(t)})})};var n=function(v){var x=v.closest(".wiki-section");var w=v.closest(".wiki-edit");return{section:x,index:k(x),wrapper:w,id:w.getJcmsId(),field:w.matchClass(/wiki-field-(\S+)/g),mdate:w.matchClass(/wiki-mdate-(\d+)/g)}};var k=function(y){if(!y.exists()){return 0}var v="";var w=parseInt(y.prop("tagName").match(/\d/));var x=1;y.prevUntil(false,".wiki-section").each(function(){var z=parseInt(f(this).prop("tagName").match(/\d/));if(z==w){x++}if(z<w){w=z;v=x+"-"+v;x=1}});v=x+"-"+v;return v.substring(0,v.length-1)};var u=function(x){var w=parseInt(x.prop("tagName").match(/\d/));var v=false;x.nextUntil(false,".wiki-section").each(function(){var y=parseInt(f(this).prop("tagName").match(/\d/));if(y<=w){v=f(this);return false}});return v};var i=function(w){var y=w.section.exists()?w.section:w.wrapper;if(!y.exists()){return false}p=y;y.addClass("wiki-editing");if(!w.section.exists()){return w.wrapper.bounds()}var y=w.section;var x=y.bounds();var v=u(y);x.top+=x.height;x.height=v?v.bounds().top-x.bottom:w.wrapper.bounds().bottom-x.bottom;return x};var m=function(){f(document).on("focusin","TEXTAREA.wikiarea",function(){f.jalios.Wiki.showWikiToolbar(this)});f(document).on("jalios:refresh",function(w){var v=f.jalios.Event.match(w,"refresh","before");if(!v){return}e(v.target)})};var r=function(v){var y=f(v);var x=y.getWidget();if(!x.exists()){return}if(x.hasClass("disabled")){return}var w=f("#wikitoolbar");if(!w.exists()){return}y.after(w);WikiToolbar.hidePreview(null,v);w.show()};var e=function(v){l(f("#wikitoolbar"),v)};var l=function(v,w){if(!v.exists()){return}if(w.exists()&&!v.closest(w).exists()){return}v.appendTo(f(document.body));v.hide()};if(!f.jalios){f.jalios={}}f.jalios.Wiki={showWikiToolbar:r,hideWikiToolbar:e};f.jalios.Wiki.Edit={edit:o,save:s,cancel:c};f(document).ready(function(v){b()})}(window.jQuery);