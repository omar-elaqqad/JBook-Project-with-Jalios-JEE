!function(f){if(!f.jalios){f.jalios={}}var l=/ID_([^ ]+)/;var g=/USAGE_([^ ]+)/;var a=f.Callbacks();var k=function(){f(document).idleTimer(8000,{name:"Notifier"});f(document).on("Notifier.idle",function(){f.jalios.Common.idle=true});f(document).on("Notifier.active",function(){f.jalios.Common.idle=false;a.fire();a.empty()})};var h=function(){f(document).on("focusin",function(){f.jalios.DOM.hasFocus=true});f(document).on("focusout",function(){f.jalios.DOM.hasFocus=false})};var j=false;var c=false;var e=function(){if(typeof(elementQuery)==="undefined"){return}f(document).on("jalios:refresh",function(o){var n=f.jalios.Event.match(o,"refresh","after");if(!n){return}if(!n.target){return}elementQuery()});f(document).on("show.bs.collapse",function(n){setTimeout(elementQuery,200)});f(document).on("shown.bs.tab",function(n){setTimeout(elementQuery,200)});f(document).on("shown.bs.modal",function(n){setTimeout(elementQuery,200)});f(document).on("jalios:broker",function(o){var n=f.jalios.Event.match(o,"broker",/toggle/i,true);if(!n){return}var p=n.source.currentTarget;if(f(p).is(":visible")){setTimeout(elementQuery,200)}});elementQuery()};var i=function(){f(document).on("click","A",function(p){var o=f(p.currentTarget);var n=o.attr("href");if(n&&n.endsWith("#")){p.preventDefault()}})};window.namespace=function(p,q,s,o){var r=o||window;p.split(s||".").forEach(function(t){if(t==="$"){t="jQuery"}r=r[t]=r[t]||{}});if(q){for(var n in q){if(q.hasOwnProperty(n)){r[n]=q[n]}}}return r};Function.prototype.defer=function(){var n=this,o=Array.prototype.slice.call(arguments,0);return window.setTimeout(function(){return n.apply(n,o)},0.01)};Function.prototype.delay=function(p){var n=this,o=Array.prototype.slice.call(arguments,1);var q=function(){return n.apply(n,o)};return window.setTimeout(q,p*1000)};Function.prototype.postpone=function(p){var n=this,o=Array.prototype.slice.call(arguments,1);var q=function(){return n.apply(n,o)};if(!f.jalios.DOM.hasFocus){a.add(q);return}if(f.jalios.Common.idle){a.add(q);return}return window.setTimeout(q,p*1000)};if(typeof String.prototype.endsWith!=="function"){String.prototype.endsWith=function(n){return this.indexOf(n,this.length-n.length)!==-1}}navigator.sendBeacon=navigator.sendBeacon||function(o,p){var n=new XMLHttpRequest();n.open("POST",o,false);n.setRequestHeader("Content-Type","text/plain;charset=UTF-8");n.send(p)};f.jalios.Common={idle:false,strip:function(o,n){o=o.replace(/^\s+|\s+$/g,"");if(!n){o=o.replace(/(\s)\s*/g,"$1")}return o},blank:function(n){return !n||!/\S/.test(n)},inject:function(o,n,p){f.each(o,function(q,r){n=p(n,r,q)});return n},toBoolean:function(o,n){if(typeof o=="boolean"){return o}if(o=="false"||o=="no"){return false}if(o=="true"||o=="yes"){return true}return n},size:function(p){var o=0;if(typeof p=="object"){if(Object.keys){o=Object.keys(p).length}else{if(jQuery){o=jQuery.map(p,function(){return 1}).length}else{if(window._){o=_.keys(p).length}else{for(var n in p){if(p.hasOwnProperty(n)){o++}}}}}}return o},shakeIE:function(){},escapeRegExp:function(n){return n.replace(/[.*+?^${}()|[\]\\]/g,"\\$&")},replaceAll:function(p,o,n){return p.replace(new RegExp(escapeRegExp(o),"g"),n)}};f.jalios.Properties={get:function(n){if(!JCMS_Properties){return null}return JCMS_Properties[n]}};f.jalios.Event={match:function(p,n,r,o,s){if(!p||!p[n]){return false}var q=p[n];if(r){if(!q.type){return false}if(!q.type.match(r)){return false}}if(o){p.stopPropagation()}if(s){p.stopImmediatePropagation()}return q}};f.jalios.Http={buildUrl:function(o,r){var w=f.jalios.Http.toQueryParams(o);if(typeof r==="string"){r=r.length>0?f.jalios.Http.toQueryParams(r):null}w=f.extend({},w,r);for(key in w){var s=w[key];if(!s){delete w[key]}}var q=(o!=null?o:"");var v;var t;var n=q.indexOf("?");var p=q.indexOf("#");if(p>=0){t=q.substring(p+1)}if(n>=0){v=q.substring(0,n)}else{if(p>=0){v=q.substring(0,p)}else{v=q}}var u=w?f.param(w,true):null;if(u!=null&&u.length>0){v+="?"+u}if(t!=null){v+="#"+t}return v},decode:function(n){return decodeURIComponent(n.replace(/\+/g," "))},encode:function(n){return encodeURIComponent(n)},toQueryParams:function(p,o){if(!p){return{}}p=f.jalios.Common.strip(p);if(p.indexOf("=")<0){return{}}var n=p.match(/([^?#]*)(#.*)?$/);if(!n){return{}}return f.jalios.Common.inject(n[1].split(o||"&"),{},function(s,t){if((t=t.split("="))[0]){var q=decodeURIComponent(t.shift()),r=t.length>1?t.join("="):t[0];if(r!=undefined){r=f.jalios.Http.decode(r)}if(q in s){if(!f.isArray(s[q])){s[q]=[s[q]]}s[q].push(r)}else{s[q]=r}}return s})},getBaseUrl:function(){if(!j){j=f("BASE").prop("href")}return j||""},getContextPath:function(){if(!c){c=document._contextPath}return c||""},getUrlWithUpdatedParam:function(p,r,q){var o=p.toString();re1=new RegExp("([^?]*\\?.*)("+r+"=[^&]*&?)(.*)","i");re2=new RegExp("([^?]*\\?)(.*)","i");re3=new RegExp("([^?]*)","i");var n=q;if(n){n=f.jalios.Http.encode(n)}if(o.search(re1)!=-1){if(q){o=o.replace(re1,"$1"+r+"="+n+"&$3")}else{o=o.replace(re1,"$1$3")}}else{if(o.search(re2)!=-1){if(q){o=o.replace(re2,"$1"+r+"="+n+"&$2")}else{o=o.replace(re2,"$1$2")}}else{if(q){o=o.replace(re3,"$1?"+r+"="+n)}else{o=o.replace(re3,"$1")}}}return o}};f.jalios.Ajax={_fixHeader:function(o){o.headers=o.headers||{};var n=document.body.id;if(n){o.headers["X-Jcms-Ajax-Id"]=n}var q=f("#AjaxCtxtDeflate");if(q.exists()&&!f.jalios.Browser.isMobileSafari()){o.headers["X-Jcms-Ajax-Deflate"]=q.html()}var p=f("#CSRFTokenElm");if(p.exists()){o.headers["X-Jcms-CSRF-Token"]=p.html()}},_fixWait:function(n,q,o){var p=n.beforeSend;var r=n.complete;n.beforeSend=function(){f.jalios.Ajax.wait(true);if(p){p.apply(this,arguments)}};n.complete=function(){f.jalios.Ajax.wait(false);if(r){r.apply(this,arguments)}}},wait:function(u,n){var o=parent?parent:window;var t="";var q="";var p=f("BODY");var s=f("#ajax-wait");if(!s.exists()){var v=f("#ajaxWaitIconWrapper").html();f("#ajaxWaitIconWrapper").remove();s=f('<div id="ajax-wait" class="hide">'+v+"</div>").appendTo(p)}if(u){t="wait";q=I18N.glp("info.msg.loading");s.removeClass("hide")}else{s.addClass("hide")}try{if(o.status){o.status=q}}catch(r){}if(n){f(n).css("cursor",t)}p.css("cursor",t)},_history:function(){if(typeof(History)=="undefined"||typeof(History.getState)=="undefined"){return}if(typeof(window.history)=="undefined"||typeof(window.history.pushState)=="undefined"){f.console.debug("[Common] [History] No History. Stop using outdated browser without modern feature.");return}f.console.debug("[Common] [History] Initializing History");f.jalios.Ajax._histIntercept=true;f.jalios.Ajax._histIdx=0;var o=function(s){if(!s){f.console.debug("[Common] [History] Skip statechange missing state data");return}if(!f.jalios.Ajax._histIntercept){f.console.debug("[Common] [History] Skip statechange we triggered",s);f.jalios.Ajax._histIntercept=true;return}if(!s.data||!s.data.url||!s.data.target){let initialState=History.getStateByIndex(0);var q=f(initialState.data.target);if(q.exists()){f.console.debug("[Common] [History] Revert to initial state, by refreshing target",q,s);let initialUrl=initialState.url;let params={historyRevertToInitialState:true};if(initialUrl){const p=f.jalios.Http.toQueryParams(initialUrl);params=f.extend({},params,p)}q.refresh({params:params,nohistory:true,noscroll:true});return}f.console.debug("[Common] [History] Skip statechange without original first history target",s);return}var r=jQuery.Event("jalios:history");r.history={};r.history.data=s.data;f(document).trigger(r);f.console.debug("[Common] [History] Revert to state by refreshing target",s.data.target,s);f.jalios.AjaxRefresh.refresh(s.data.url,s.data.target,f.extend({},s.data.options,{nohistory:true,noscroll:true}))};var n=History.getState();if(n&&n.data&&n.data.target){f.console.debug("[Common] [History] Revert to last state in previous page",n);o(n)}History.Adapter.bind(window,"statechange",function(){var p=History.getState();o(p)});f(document).on("jalios:refresh",function(r){var q=f.jalios.Event.match(r,"refresh","success");if(!q){return}if(q.options.nohistory){return}if(q.callback){return}q.options.nohistory=true;q.options.target=false;var s={url:q.url,target:q.target.identify().map(function(){return"#"+f(this).attr("id")}).get().join(","),options:q.options};var p=History.getStateByIndex(0);if(p&&p.data&&!p.data.target){f.console.debug("[Common] [History] Update initial state with first portlet being modified",s.target);p.data.target=s.target}f.jalios.Ajax.addHistory(s)})},addHistory:function(o){if(typeof(History)=="undefined"||typeof(History.getState)=="undefined"){return}f.jalios.Ajax._histIdx++;var n=document.location.href.replace(document.location.hash,"");var p=f.jalios.Http.getUrlWithUpdatedParam(n,"histstate",f.jalios.Ajax._histIdx);f.jalios.Ajax._histIntercept=false;f.console.debug("[Common] [History] Adding History Entry",o,p);o&&o.options&&delete o.options.brokerTrigger;History.pushState(o,document.title,p)}};var d=/^\W*return\W*false\W*$/i;var m=function(p,q){q=q||"all";f.console.info("Load CSS with DOM injection...",p,q);var n=document.getElementsByTagName("head")[0];var o=document.createElement("link");o.href=p;if(q=="prefetch"){o.rel="prerender prefetch"}else{o.type="text/css";o.rel="stylesheet";o.media=q}n.appendChild(o)};f.jalios.DOM={_resources:{},markResource:function(n){if(f.jalios.DOM._resources[n]){return false}f.jalios.DOM._resources[n]=true;return true},markResources:function(){f.each(arguments,function(n,o){f.jalios.DOM.markResource(o)})},loadStyleSheets:function(A,p,o,r){var t={all:[],print:[],screen:[],speech:[]};var C={all:[],print:[],screen:[],speech:[]};for(var B=0;B<A.length;B++){var y=A[B];var q=p[B]||"all";if(!f.jalios.DOM.markResource(y)){f.console.debug("StyleSheet already imported: ",y)}else{var z=(y.indexOf("http")==0);(z?C:t)[q].push(y)}}for(q in C){var n=C[q];if(n.length!=0){f.console.info("Import StyleSheets (absolute URL)",q,n,o);for(var B=0;B<n.length;B++){var v=n[B];jQuery.jalios.DOM.loadStyleSheet(v,q,o)}}}var F=r||1800;var w=JcmsJsContext.getBaseUrl()+"css/csspacker.jsp?v="+o+"&css=";var G=function(I,J){if(I.length==0){return}var H=w+I.join("&css=");m(H,J)};for(q in t){var D=t[q];if(D.length!=0){f.console.info("Import StyleSheets",q,D,o);var u=[];var x=0;while((relativePath=D.shift())!==undefined){var E=encodeURIComponent(relativePath);var s=w.length+x+E.length+((u.length+1)*"&css=".length);if(s>=F){G(u,q);u=[];x=0}u.push(E);x+=E.length}G(u,q)}}return true},loadStyleSheet:function(p,o,n){if(!f.jalios.DOM.markResource(p)){f.console.info("StyleSheet already imported: ",p);return false}f.console.info("Import StyleSheet",p,n);p+=n?("?v="+n):"";m(p,o);return true},loadJavaScripts:function(C,y,q){f.jalios.DOM._loaded++;var r=[];var s=[];for(var v=0;v<C.length;v++){var D=C[v];if(!f.jalios.DOM.markResource(D)){f.console.debug("JavaScript already imported: ",D)}else{var x=(D.indexOf("http")==0);(x?s:r).push(D)}}var p=false;if(s.length!=0){f.console.info("Import JavaScripts (absolute URL)",s,y);for(var v=0;v<s.length;v++){var n=s[v];p|=jQuery.jalios.DOM.loadJavaScript(n,y)}}var z=q||1800;var o=JcmsJsContext.getBaseUrl()+"js/jspacker.jsp";var w=function(E){f.console.info("Load JS with jQuery...",E);f.ajaxQueue({url:o,traditional:true,data:{v:y,js:E},dataType:"script",cache:true}).always(function(F){f.jalios.DOM._loadReady.defer(E)})};if(r.length!=0){f.jalios.DOM._loaded++;f.console.info("Import JavaScripts",r,y);var t=[];var B=0;while((relativePath=r.shift())!==undefined){var u=encodeURIComponent(relativePath);var A=o.length+B+u.length+((t.length+1)*"&js=".length);if(A>=z){w(t);t=[];B=0}t.push(relativePath);B+=u.length}w(t);p|=true}f.jalios.DOM._loadReady.defer(r);return p},loadJavaScript:function(o,n){f.jalios.DOM._loaded++;if(!f.jalios.DOM.markResource(o)){f.console.info("JavaScript already imported: ",o);f.jalios.DOM._loadReady.defer(o);return false}f.console.info("Import JavaScript",o,n);f.ajaxQueue({url:o,data:{v:n},dataType:"script",cache:true}).always(function(p){f.jalios.DOM._loadReady.defer(o)});return true},_loaded:0,_loadTrigger:f.Callbacks(),_loadReady:function(o){f.jalios.DOM._loaded--;if(f.jalios.DOM._loaded>0){return}f.jalios.DOM._loadTrigger.fire();f.jalios.DOM._loadTrigger.empty();var n=jQuery.Event("jalios:ready");f(document).trigger(n)},_loadRegister:function(n){f.jalios.DOM._loadTrigger.add(n)},hasFocus:true,follow:function(q,s,u,r){if(!q){return}var o=f(q);if(!o.exists()){return}var v=f.Event("click");v.which=1;v.skip=s;var t=o.attr("onclick");if(t&&d.test(t)){o.prop("onclick",null)}if(!u||!r){o.trigger(v);if(v.isDefaultPrevented()){return}}var n=o.prop("href");if(n&&u&&r){o.attr("href",f.jalios.Http.getUrlWithUpdatedParam(n,u,r))}var w=o.closest("FORM");if(w.exists()){}o.trigger(v);if(v.isDefaultPrevented()){return}var n=o.prop("href");if(n){var p=o.attr("target");if(p){f.jalios.Browser.popup(n,o.attr("title"))}else{f.jalios.Browser.redirect(n)}return}if(o.attr("type")=="submit"){var w=o.closest("FORM");w.append('<input type="hidden" name="'+o.attr("name")+'" value="'+o.attr("value")+'" />');w.submit()}},isInIFrame:function(){return window!=top},registerIFrame:function(){f.jalios.DOM.setupIFrame();f(document).on("jalios:refresh",f.jalios.DOM.setupIFrame)},setupIFrame:function(p){var n=f(document);if(p){var o=f.jalios.Event.match(p,"refresh","after");if(!o||!o.$target){return}n=o.$target}n.find('IFRAME[height="100%"]').each(function(){f.jalios.DOM.resizeIframeToViewport.defer(f(this))}).on("load",function(){f.jalios.DOM.resizeIframeToViewport.defer(f(this))})},resizeIframeToViewport:function(p,o){if(!p||!p.exists()){return}var r=o||400;var n=r;try{n=p.contents().find("BODY").css("height","auto").outerHeight()+20}catch(q){}n=r!==-1?Math.min(r,n):n;p.css("height",n+"px")}};f.fn.exists=function(){return this.length>0};f.fn.identify=function(p,o){var n=0;p=p||"jq";return this.each(function(){if(f(this).attr("id")){if(o){var q=new Date().getTime();f(this).attr("id",p+"_"+q)}return}do{n++;var r=p+"_"+n}while(f("#"+r).length>0);f(this).attr("id",r)})};f.fn.findNext=function(n){return this.nextAll().find(n)};f.fn.findPrev=function(n){return this.prevAll().find(n)};f.fn.matchClass=function(o,p){var p=p||1;var n=[];this.each(function(){var r=f(this).attr("class");if(!r){return}var t=r.split(/\s+/);for(var s=0;s<t.length;s++){o.compile(o);var q=o.exec(t[s]);if(q&&q.length>p){n.push(q[p])}}});return n};f.fn.updateClass=function(n){if(!n){return}var n=n.split(" ");return this.each(function(){var s=f(this);var p=s.attr("class");for(var q=0;q<n.length;q++){if(b.test(n[q])){var o=b.exec(n[q]);var r=new RegExp(o[1]+"\\d+");var t=p.match(r);s.removeClass(""+t)}s.addClass(n[q])}})};var b=/(([\w_-])+(-+))(\d)+/;f.fn.serializeObject=function(p){var q={};var n=this.serializeArray();f.each(n,function(){if(p&&p[this.name]===undefined){return}if(q[this.name]!==undefined){if(!q[this.name].push){q[this.name]=[q[this.name]]}q[this.name].push(this.value||"")}else{q[this.name]=this.value||""}});return f.extend(true,{},p,q)};f.fn.populate=function(n){var o=f(this);f.each(n,function(p,q){f("[name="+p+"]",o).val(q)})};f.fn.named=function(o){var n="[name="+o.join("],[name=")+"]";return f(this).find(n)};f.fn.isPortlet=function(){if(!f(this).hasClass("Portlet")&&!f(this).hasClass("PortalJspCollection")&&!f(this).hasClass("JPortal")){return false}var o=0,n=this.length;for(;o<n;o++){if(this[o].className=="Portlet"||this[o].className=="PortalJspCollection"||this[o].className=="JPortal"){continue}if(this[o].className.match(l)){return true}}return false};f.fn.getJcmsId=function(n){var r=0,o=this.length;for(;r<o;r++){var s=f(this[r]);if(s.attr("data-jalios-id")){return s.attr("data-jalios-id")}if(n){return}var q=s.attr("class");if(!q){continue}var p=q.match(l);if(p){return p[1]}}return false};f.fn.getUsage=function(){var q=0,n=this.length;for(;q<n;q++){var p=this[q].className;if(!p){continue}var o=p.match(g);if(o){return o[1]}}return false};f.fn.bounds=function(){var n=this,o=n[0];if(!o){return}var p=n.offset(),q={width:o.offsetWidth,height:o.offsetHeight,left:0,top:0,right:0,bottom:0,x:0,y:0};q.left=p.left;q.top=p.top;q.right=(q.left+q.width);q.bottom=(q.top+q.height);q.x=q.left;q.y=q.top;q.inner={width:n.width(),height:n.height()};f.extend(q,{toString:function(){var r=this;return"x: "+r.x+" y: "+r.y+" width: "+r.width+" height: "+r.height+" right: "+r.right+" bottom: "+r.bottom}});return q};f.fn.max=function(n){return Math.max.apply(null,this.map(function(o,p){return n.apply(p)}).get())};f.fn.getOriginalContext=function(){var o;var n=this;while(n){var o=n.context;n=n.prevObject}return o};f(document).ready(function(n){k();h();e();n.ajaxPrefilter(n.jalios.Ajax._fixHeader);n.ajaxPrefilter(n.jalios.Ajax._fixWait);i();n.jalios.DOM.registerIFrame();n.jalios.Ajax._history()})}(window.jQuery);