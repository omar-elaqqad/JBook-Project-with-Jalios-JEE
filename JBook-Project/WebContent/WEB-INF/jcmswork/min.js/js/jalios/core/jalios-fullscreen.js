(function(e){function c(q){var n,l,o;var m={state:null,src:null,use_window:false};var q=jQuery.extend(m,q);var j=q.state;var i=q.src;var p=q.use_window;var k;if(p&&i){k=e(window.open(i,"_blank","width="+screen.availWidth+",height="+screen.availHeight+",left=0,top=0,channelmode=no,fullscreen=no,location=no,titlebar=no,status=no,menubar=no,toolbar=no"));try{k[0].moveTo(0,0);k.resize(screen.width,screen.height)}catch(n){e.console.log(n)}return k}if(!this.length){return this}n=(this[0]);if(n instanceof Document){o=n;n=o.documentElement}else{o=n.ownerDocument}if(j==null){if(!d(o,"CancelFullScreen")){return null}j=!!d(o,"FullScreen")||!!d(o,"IsFullScreen");if(!j){return j}return d(o,"FullScreenElement")||d(o,"CurrentFullScreenElement")||j}if(j){d(n,"RequestFullScreen");return this}else{d(o,"CancelFullScreen");return this}}function g(){return(c.call(this,!c.call(this)))}function b(i){jQuery(document).trigger(new jQuery.Event("fullscreenchange"))}function f(i){jQuery(document).trigger(new jQuery.Event("fullscreenerror"))}function a(){var n,q,j;n=document;var l=0,o="CancelFullScreen",i,k;while(l<h.length&&!n[i]){i=o;if(h[l]==""){i=i.substr(0,1).toLowerCase()+i.substr(1)}i=h[l]+i;k=typeof n[i];if(k!="undefined"&&n[i]){q=h[l]+"fullscreenchange";j=h[l]+"fullscreenerror";break}l++}jQuery(document).bind(q,b);jQuery(document).bind(j,f)}var h=["","webkit","moz","ms","o"];function d(l,o){var k=0,i,j;while(k<h.length&&!l[i]){i=o;if(h[k]==""){i=i.substr(0,1).toLowerCase()+i.substr(1)}i=h[k]+i;j=typeof l[i];if(j!="undefined"){h=[h[k]];var n=(j=="function"?l[i]():l[i]);return n||true}k++}return false}jQuery.fn.fullScreen=c;jQuery.fn.toggleFullScreen=g;a()})(jQuery);