(function(b,a){typeof exports==="object"&&typeof module!=="undefined"?module.exports=a():typeof define==="function"&&define.amd?define(a):(b.ptrAnimatesMaterial2=a())}(this,(function(){var b={pulling:function a(j,h){if(!h.elControl){h.elControl=h.container.querySelector(".pull-to-refresh-material2__control")}var f=h.container,e=h.threshold,g=h.elControl;if(!f||!g){return}var i=j/e;if(i>1){i=1}else{i=i*i*i}var k=j/2.5;f.style.transform=k?"translate3d(0, "+k+"px, 0)":"";g.style.opacity=i;g.style.transform="translate3d(-20%, 0, 0) rotate("+360*i+"deg)"},refreshing:function d(g){var f=g.container,e=g.threshold;f.style.transition="transform 0.2s";f.style.transform="translate3d(0, "+e/2.5+"px, 0)"},restoring:function c(f){var e=f.container;return new Promise(function(g){if(e.style.transform){e.style.transition="transform 0.3s";e.style.transform="translate3d(0, 0, 0)";e.addEventListener("transitionend",function(){e.style.transition="";g()})}else{g()}})}};b.aborting=b.restoring;return b})));(function(b,a){typeof exports==="object"&&typeof module!=="undefined"?module.exports=a():typeof define==="function"&&define.amd?define(a):(b.pullToRefresh=a())}(this,(function(){function b(d){var f=d.element,l=d.onpanstart,j=d.onpanmove,e=d.onpanend;var o=void 0,k=void 0,g=void 0,n=void 0;function i(p){var q=Array.prototype.slice.call(p.changedTouches).filter(function(r){return r.identifier===o})[0];if(!q){return false}p.deltaX=q.screenX-k;p.deltaY=q.screenY-g;return true}function h(p){var q=p.changedTouches[0];o=q.identifier;k=q.screenX;g=q.screenY}function c(p){if(i(p)){if(l&&!n){l(p);n=true}j(p)}}function m(p){if(i(p)){e(p)}}if(f){f.addEventListener("touchstart",h);if(j){f.addEventListener("touchmove",c)}if(e){f.addEventListener("touchend",m)}}return function(){if(f){f.removeEventListener("touchstart",h);if(j){f.removeEventListener("touchmove",c)}if(e){f.removeEventListener("touchend",m)}}}}function a(c){c=Object.assign({scrollable:document.body,threshold:500,onStateChange:function h(){}},c);var q=c,f=q.container,o=q.scrollable,l=q.threshold,n=q.refresh,h=q.onStateChange,p=q.animates;var e=void 0,i=void 0,d=void 0;function m(s){f.classList.add("pull-to-refresh--"+s)}function r(s){f.classList.remove("pull-to-refresh--"+s)}function g(){if(!o||[window,document,document.body,document.documentElement].includes(o)){return document.documentElement.scrollTop||document.body.scrollTop}else{return o.scrollTop}}return b({element:f,onpanmove:function k(s){var t=s.deltaY;if(g()>0||t<0&&!d||d in {aborting:1,refreshing:1,restoring:1}){return}if(typeof q.shouldPull==="function"){let ret=q.shouldPull(s);h("manual",{shouldPull:ret});if(ret==false){return}}if(s.cancelable){s.preventDefault()}if(e==null){i=t;d="pulling";m(d);h(d,c)}t=t-i;if(t<0){t=0}e=t;if(t>=l&&d!=="reached"||t<l&&d!=="pulling"){r(d);d=d==="reached"?"pulling":"reached";m(d);h(d,c)}p.pulling(t,c)},onpanend:function j(){if(d==null){return}if(d==="pulling"){r(d);d="aborting";h(d);m(d);p.aborting(c).then(function(){r(d);e=d=i=null;h(d)})}else{if(d==="reached"){r(d);d="refreshing";m(d);h(d,c);p.refreshing(c);n().then(function(){r(d);d="restoring";m(d);h(d);p.restoring(c).then(function(){r(d);e=d=i=null;h(d)})})}}}})}return a})));