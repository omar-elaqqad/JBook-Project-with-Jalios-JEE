+function(c){var h=["sanitize","whiteList","sanitizeFn"];var j=["background","cite","href","itemtype","longdesc","poster","src","xlink:href"];var l=/^aria-[\w-]*$/i;var d={"*":["class","dir","id","lang","role",l],a:["target","href","title","rel"],area:[],b:[],br:[],col:[],code:[],div:[],em:[],hr:[],h1:[],h2:[],h3:[],h4:[],h5:[],h6:[],i:[],img:["src","alt","title","width","height"],li:[],ol:[],p:[],pre:[],s:[],small:[],span:[],sub:[],sup:[],strong:[],u:[],ul:[]};var e=/^(?:(?:https?|mailto|ftp|tel|file):|[^&:/?#]*(?:[/?#]|$))/gi;var f=/^data:(?:image\/(?:bmp|gif|jpeg|jpg|png|tiff|webp)|video\/(?:mpeg|mp4|ogg|webm)|audio\/(?:mp3|oga|ogg|opus));base64,[a-z0-9+/]+=*$/i;function b(m,o){var r=m.nodeName.toLowerCase();if(c.inArray(r,o)!==-1){if(c.inArray(r,j)!==-1){return Boolean(m.nodeValue.match(e)||m.nodeValue.match(f))}return true}var p=c(o).filter(function(s,t){return t instanceof RegExp});for(var q=0,n=p.length;q<n;q++){if(r.match(p[q])){return true}}return false}function g(y,u,z){if(y.length===0){return y}if(z&&typeof z==="function"){return z(y)}if(!document.implementation||!document.implementation.createHTMLDocument){return y}var x=document.implementation.createHTMLDocument("sanitization");x.body.innerHTML=y;var v=c.map(u,function(B,A){return A});var n=c(x.body).find("*");for(var s=0,t=n.length;s<t;s++){var o=n[s];var m=o.nodeName.toLowerCase();if(c.inArray(m,v)===-1){o.parentNode.removeChild(o);continue}var p=c.map(o.attributes,function(A){return A});var w=[].concat(u["*"]||[],u[m]||[]);for(var r=0,q=p.length;r<q;r++){if(!b(p[r],w)){o.removeAttribute(p[r].nodeName)}}}return x.body.innerHTML}var i=function(n,m){this.type=null;this.options=null;this.enabled=null;this.timeout=null;this.hoverState=null;this.$element=null;this.inState=null;this.init("tooltip",n,m)};i.VERSION="3.4.1";i.TRANSITION_DURATION=150;i.DEFAULTS={animation:true,placement:"top",selector:false,template:'<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:false,container:false,viewport:{selector:"body",padding:0},sanitize:true,sanitizeFn:null,whiteList:d};i.prototype.init=function(s,q,o){this.enabled=true;this.type=s;this.$element=c(q);this.options=this.getOptions(o);this.$viewport=this.options.viewport&&c(document).find(c.isFunction(this.options.viewport)?this.options.viewport.call(this,this.$element):(this.options.viewport.selector||this.options.viewport));this.inState={click:false,hover:false,focus:false};if(this.$element[0] instanceof document.constructor&&!this.options.selector){throw new Error("`selector` option must be specified when initializing "+this.type+" on the window.document object!")}var r=this.options.trigger.split(" ");for(var p=r.length;p--;){var n=r[p];if(n=="click"){this.$element.on("click."+this.type,this.options.selector,c.proxy(this.toggle,this))}else{if(n!="manual"){var t=n=="hover"?"mouseenter":"focusin";var m=n=="hover"?"mouseleave":"focusout";this.$element.on(t+"."+this.type,this.options.selector,c.proxy(this.enter,this));this.$element.on(m+"."+this.type,this.options.selector,c.proxy(this.leave,this))}}}this.options.selector?(this._options=c.extend({},this.options,{trigger:"manual",selector:""})):this.fixTitle()};i.prototype.getDefaults=function(){return i.DEFAULTS};i.prototype.getOptions=function(m){var n=this.$element.data();for(var o in n){if(n.hasOwnProperty(o)&&c.inArray(o,h)!==-1){delete n[o]}}m=c.extend({},this.getDefaults(),n,m);if(m.delay&&typeof m.delay=="number"){m.delay={show:m.delay,hide:m.delay}}if(m.sanitize){m.template=g(m.template,m.whiteList,m.sanitizeFn)}return m};i.prototype.getDelegateOptions=function(){var m={};var n=this.getDefaults();this._options&&c.each(this._options,function(o,p){if(n[o]!=p){m[o]=p}});return m};i.prototype.enter=function(n){var m=n instanceof this.constructor?n:c(n.currentTarget).data("bs."+this.type);if(!m){m=new this.constructor(n.currentTarget,this.getDelegateOptions());c(n.currentTarget).data("bs."+this.type,m)}if(n instanceof c.Event){m.inState[n.type=="focusin"?"focus":"hover"]=true}if(m.tip().hasClass("in")||m.hoverState=="in"){m.hoverState="in";return}clearTimeout(m.timeout);m.hoverState="in";if(!m.options.delay||!m.options.delay.show){return m.show()}m.timeout=setTimeout(function(){if(m.hoverState=="in"){m.show()}},m.options.delay.show)};i.prototype.isInStateTrue=function(){for(var m in this.inState){if(this.inState[m]){return true}}return false};i.prototype.leave=function(n){var m=n instanceof this.constructor?n:c(n.currentTarget).data("bs."+this.type);if(!m){m=new this.constructor(n.currentTarget,this.getDelegateOptions());c(n.currentTarget).data("bs."+this.type,m)}if(n instanceof c.Event){m.inState[n.type=="focusout"?"focus":"hover"]=false}if(m.isInStateTrue()){return}clearTimeout(m.timeout);m.hoverState="out";if(!m.options.delay||!m.options.delay.hide){return m.hide()}m.timeout=setTimeout(function(){if(m.hoverState=="out"){m.hide()}},m.options.delay.hide)};i.prototype.show=function(){var v=c.Event("show.bs."+this.type);if(this.hasContent()&&this.enabled){this.$element.trigger(v);var w=c.contains(this.$element[0].ownerDocument.documentElement,this.$element[0]);if(v.isDefaultPrevented()||!w){return}var u=this;var s=this.tip();var o=this.getUID(this.type);this.setContent();s.attr("id",o);this.$element.attr("aria-describedby",o);if(this.options.animation){s.addClass("fade")}var r=typeof this.options.placement=="function"?this.options.placement.call(this,s[0],this.$element[0]):this.options.placement;var z=/\s?auto?\s?/i;var A=z.test(r);if(A){r=r.replace(z,"")||"top"}s.detach().css({top:0,left:0,display:"block"}).addClass(r).data("bs."+this.type,this);this.options.container?s.appendTo(c(document).find(this.options.container)):s.insertAfter(this.$element);this.$element.trigger("inserted.bs."+this.type);var x=this.getPosition();var m=s[0].offsetWidth;var t=s[0].offsetHeight;if(A){var q=r;var y=this.getPosition(this.$viewport);r=r=="bottom"&&x.bottom+t>y.bottom?"top":r=="top"&&x.top-t<y.top?"bottom":r=="right"&&x.right+m>y.width?"left":r=="left"&&x.left-m<y.left?"right":r;s.removeClass(q).addClass(r)}var p=this.getCalculatedOffset(r,x,m,t);this.applyPlacement(p,r);var n=function(){var B=u.hoverState;u.$element.trigger("shown.bs."+u.type);u.hoverState=null;if(B=="out"){u.leave(u)}};c.support.transition&&this.$tip.hasClass("fade")?s.one("bsTransitionEnd",n).emulateTransitionEnd(i.TRANSITION_DURATION):n()}};i.prototype.applyPlacement=function(r,s){var t=this.tip();var o=t[0].offsetWidth;var y=t[0].offsetHeight;var n=parseInt(t.css("margin-top"),10);var q=parseInt(t.css("margin-left"),10);if(isNaN(n)){n=0}if(isNaN(q)){q=0}r.top+=n;r.left+=q;c.offset.setOffset(t[0],c.extend({using:function(z){t.css({top:Math.round(z.top),left:Math.round(z.left)})}},r),0);t.addClass("in");var m=t[0].offsetWidth;var u=t[0].offsetHeight;if(s=="top"&&u!=y){r.top=r.top+y-u}var x=this.getViewportAdjustedDelta(s,r,m,u);if(x.left){r.left+=x.left}else{r.top+=x.top}var v=/top|bottom/.test(s);var p=v?x.left*2-o+m:x.top*2-y+u;var w=v?"offsetWidth":"offsetHeight";t.offset(r);this.replaceArrow(p,t[0][w],v)};i.prototype.replaceArrow=function(o,m,n){this.arrow().css(n?"left":"top",50*(1-o/m)+"%").css(n?"top":"left","")};i.prototype.setContent=function(){var n=this.tip();var m=this.getTitle();if(this.options.html){if(this.options.sanitize){m=g(m,this.options.whiteList,this.options.sanitizeFn)}n.find(".tooltip-inner").html(m)}else{n.find(".tooltip-inner").text(m)}n.removeClass("fade in top bottom left right")};i.prototype.hide=function(q){var n=this;var p=c(this.$tip);var o=c.Event("hide.bs."+this.type);function m(){if(n.hoverState!="in"){p.detach()}if(n.$element){n.$element.removeAttr("aria-describedby").trigger("hidden.bs."+n.type)}q&&q()}this.$element.trigger(o);if(o.isDefaultPrevented()){return}p.removeClass("in");c.support.transition&&p.hasClass("fade")?p.one("bsTransitionEnd",m).emulateTransitionEnd(i.TRANSITION_DURATION):m();this.hoverState=null;return this};i.prototype.fixTitle=function(){var m=this.$element;if(m.attr("title")||typeof m.attr("data-original-title")!="string"){m.attr("data-original-title",m.attr("title")||"").attr("title","")}};i.prototype.hasContent=function(){return this.getTitle()};i.prototype.getPosition=function(o){o=o||this.$element;var q=o[0];var n=q.tagName=="BODY";var p=q.getBoundingClientRect();if(p.width==null){p=c.extend({},p,{width:p.right-p.left,height:p.bottom-p.top})}var s=window.SVGElement&&q instanceof window.SVGElement;var t=n?{top:0,left:0}:(s?null:o.offset());var m={scroll:n?document.documentElement.scrollTop||document.body.scrollTop:o.scrollTop()};var r=n?{width:c(window).width(),height:c(window).height()}:null;return c.extend({},p,m,r,t)};i.prototype.getCalculatedOffset=function(m,p,n,o){return m=="bottom"?{top:p.top+p.height,left:p.left+p.width/2-n/2}:m=="top"?{top:p.top-o,left:p.left+p.width/2-n/2}:m=="left"?{top:p.top+p.height/2-o/2,left:p.left-n}:{top:p.top+p.height/2-o/2,left:p.left+p.width}};i.prototype.getViewportAdjustedDelta=function(p,s,m,r){var u={top:0,left:0};if(!this.$viewport){return u}var o=this.options.viewport&&this.options.viewport.padding||0;var t=this.getPosition(this.$viewport);if(/right|left/.test(p)){var v=s.top-o-t.scroll;var q=s.top+o-t.scroll+r;if(v<t.top){u.top=t.top-v}else{if(q>t.top+t.height){u.top=t.top+t.height-q}}}else{var w=s.left-o;var n=s.left+o+m;if(w<t.left){u.left=t.left-w}else{if(n>t.right){u.left=t.left+t.width-n}}}return u};i.prototype.getTitle=function(){var p;var m=this.$element;var n=this.options;p=m.attr("data-original-title")||(typeof n.title=="function"?n.title.call(m[0]):n.title);return p};i.prototype.getUID=function(m){do{m+=~~(Math.random()*1000000)}while(document.getElementById(m));return m};i.prototype.tip=function(){if(!this.$tip){this.$tip=c(this.options.template);if(this.$tip.length!=1){throw new Error(this.type+" `template` option must consist of exactly 1 top-level element!")}}return this.$tip};i.prototype.arrow=function(){return(this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow"))};i.prototype.enable=function(){this.enabled=true};i.prototype.disable=function(){this.enabled=false};i.prototype.toggleEnabled=function(){this.enabled=!this.enabled};i.prototype.toggle=function(n){var m=this;if(n){m=c(n.currentTarget).data("bs."+this.type);if(!m){m=new this.constructor(n.currentTarget,this.getDelegateOptions());c(n.currentTarget).data("bs."+this.type,m)}}if(n){m.inState.click=!m.inState.click;if(m.isInStateTrue()){m.enter(m)}else{m.leave(m)}}else{m.tip().hasClass("in")?m.leave(m):m.enter(m)}};i.prototype.destroy=function(){var m=this;clearTimeout(this.timeout);this.hide(function(){m.$element.off("."+m.type).removeData("bs."+m.type);if(m.$tip){m.$tip.detach()}m.$tip=null;m.$arrow=null;m.$viewport=null;m.$element=null})};i.prototype.sanitizeHtml=function(m){return g(m,this.options.whiteList,this.options.sanitizeFn)};function k(m){return this.each(function(){var p=c(this);var o=p.data("bs.tooltip");var n=typeof m=="object"&&m;if(!o&&/destroy|hide/.test(m)){return}if(!o){p.data("bs.tooltip",(o=new i(this,n)))}if(typeof m=="string"){o[m]()}})}var a=c.fn.tooltip;c.fn.tooltip=k;c.fn.tooltip.Constructor=i;c.fn.tooltip.noConflict=function(){c.fn.tooltip=a;return this}}(jQuery);