(function(){var u=0,p=[],n={},r={},z={"<":"lt",">":"gt","&":"amp",'"':"quot","'":"#39"},o=/[<>&\"\']/g,y,x=window.setTimeout,w={},v;function s(){this.returnValue=false}function q(){this.cancelBubble=true}(function(e){var d=e.split(/,/),c,a,b;for(c=0;c<d.length;c+=2){b=d[c+1].split(/ /);for(a=0;a<b.length;a++){r[b[a]]=d[c]}}})("application/msword,doc dot,application/pdf,pdf,application/pgp-signature,pgp,application/postscript,ps ai eps,application/rtf,rtf,application/vnd.ms-excel,xls xlb,application/vnd.ms-powerpoint,ppt pps pot,application/zip,zip,application/x-shockwave-flash,swf swfl,application/vnd.openxmlformats-officedocument.wordprocessingml.document,docx,application/vnd.openxmlformats-officedocument.wordprocessingml.template,dotx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,xlsx,application/vnd.openxmlformats-officedocument.presentationml.presentation,pptx,application/vnd.openxmlformats-officedocument.presentationml.template,potx,application/vnd.openxmlformats-officedocument.presentationml.slideshow,ppsx,application/x-javascript,js,application/json,json,audio/mpeg,mpga mpega mp2 mp3,audio/x-wav,wav,audio/mp4,m4a,image/bmp,bmp,image/gif,gif,image/jpeg,jpeg jpg jpe,image/photoshop,psd,image/png,png,image/svg+xml,svg svgz,image/tiff,tiff tif,text/plain,asc txt text diff log,text/html,htm html xhtml,text/css,css,text/csv,csv,text/rtf,rtf,video/mpeg,mpeg mpg mpe m2v,video/quicktime,qt mov,video/mp4,mp4,video/x-m4v,m4v,video/x-flv,flv,video/x-ms-wmv,wmv,video/avi,avi,video/webm,webm,video/3gpp,3gp,video/3gpp2,3g2,video/vnd.rn-realvideo,rv,application/vnd.oasis.opendocument.formula-template,otf,application/octet-stream,exe");var t={VERSION:"@@version@@",STOPPED:1,STARTED:2,QUEUED:1,UPLOADING:2,FAILED:4,DONE:5,GENERIC_ERROR:-100,HTTP_ERROR:-200,IO_ERROR:-300,SECURITY_ERROR:-400,INIT_ERROR:-500,FILE_SIZE_ERROR:-600,FILE_EXTENSION_ERROR:-601,IMAGE_FORMAT_ERROR:-700,IMAGE_MEMORY_ERROR:-701,IMAGE_DIMENSIONS_ERROR:-702,mimeTypes:r,ua:(function(){var b=navigator,c=b.userAgent,a=b.vendor,e,f,d;e=/WebKit/.test(c);d=e&&a.indexOf("Apple")!==-1;f=window.opera&&window.opera.buildNumber;return{windows:navigator.platform.indexOf("Win")!==-1,android:/Android/.test(c),ie:!e&&!f&&(/MSIE/gi).test(c)&&(/Explorer/gi).test(b.appName),webkit:e,gecko:!e&&/Gecko/.test(c),safari:d,opera:!!f}}()),typeOf:function(a){return({}).toString.call(a).match(/\s([a-z|A-Z]+)/)[1].toLowerCase()},extend:function(a){t.each(arguments,function(c,b){if(b>0){t.each(c,function(d,e){a[e]=d})}});return a},cleanName:function(c){var b,a;a=[/[\300-\306]/g,"A",/[\340-\346]/g,"a",/\307/g,"C",/\347/g,"c",/[\310-\313]/g,"E",/[\350-\353]/g,"e",/[\314-\317]/g,"I",/[\354-\357]/g,"i",/\321/g,"N",/\361/g,"n",/[\322-\330]/g,"O",/[\362-\370]/g,"o",/[\331-\334]/g,"U",/[\371-\374]/g,"u"];for(b=0;b<a.length;b+=2){c=c.replace(a[b],a[b+1])}c=c.replace(/\s+/g,"_");c=c.replace(/[^a-z0-9_\-\.]+/gi,"");return c},addRuntime:function(b,a){a.name=b;p[b]=a;p.push(a);return a},guid:function(){var b=new Date().getTime().toString(32),a;for(a=0;a<5;a++){b+=Math.floor(Math.random()*65535).toString(32)}return(t.guidPrefix||"p")+b+(u++).toString(32)},buildUrl:function(b,c){var a="";t.each(c,function(d,e){a+=(a?"&":"")+encodeURIComponent(e)+"="+encodeURIComponent(d)});if(a){b+=(b.indexOf("?")>0?"&":"?")+a}return b},each:function(b,a){var c,d,e;if(b){c=b.length;if(c===y){for(d in b){if(b.hasOwnProperty(d)){if(a(b[d],d)===false){return}}}}else{for(e=0;e<c;e++){if(a(b[e],e)===false){return}}}}},formatSize:function(a){if(a===y||/\D/.test(a)){return t.translate("N/A")}if(a>1073741824){return Math.round(a/1073741824,1)+" GB"}if(a>1048576){return Math.round(a/1048576,1)+" MB"}if(a>1024){return Math.round(a/1024,1)+" KB"}return a+" b"},getPos:function(d,i){var h=0,a=0,f,g=document,c,b;d=d;i=i||g.body;function e(D){var m,j,k=0,l=0;if(D){j=D.getBoundingClientRect();m=g.compatMode==="CSS1Compat"?g.documentElement:g.body;k=j.left+m.scrollLeft;l=j.top+m.scrollTop}return{x:k,y:l}}if(d&&d.getBoundingClientRect&&t.ua.ie&&(!g.documentMode||g.documentMode<8)){c=e(d);b=e(i);return{x:c.x-b.x,y:c.y-b.y}}f=d;while(f&&f!=i&&f.nodeType){h+=f.offsetLeft||0;a+=f.offsetTop||0;f=f.offsetParent}f=d.parentNode;while(f&&f!=i&&f.nodeType){h-=f.scrollLeft||0;a-=f.scrollTop||0;f=f.parentNode}return{x:h,y:a}},getSize:function(a){return{w:a.offsetWidth||a.clientWidth,h:a.offsetHeight||a.clientHeight}},parseSize:function(b){var a;if(typeof(b)=="string"){b=/^([0-9]+)([mgk]?)$/.exec(b.toLowerCase().replace(/[^0-9mkg]/g,""));a=b[2];b=+b[1];if(a=="g"){b*=1073741824}if(a=="m"){b*=1048576}if(a=="k"){b*=1024}}return b},xmlEncode:function(a){return a?(""+a).replace(o,function(b){return z[b]?"&"+z[b]+";":b}):a},toArray:function(a){var b,c=[];for(b=0;b<a.length;b++){c[b]=a[b]}return c},inArray:function(b,a){if(a){if(Array.prototype.indexOf){return Array.prototype.indexOf.call(a,b)}for(var d=0,c=a.length;d<c;d++){if(a[d]===b){return d}}}return -1},addI18n:function(a){return t.extend(n,a)},translate:function(a){return n[a]||a},isEmptyObj:function(b){if(b===y){return true}for(var a in b){return false}return true},hasClass:function(a,b){var c;if(a.className==""){return false}c=new RegExp("(^|\\s+)"+b+"(\\s+|$)");return c.test(a.className)},addClass:function(a,b){if(!t.hasClass(a,b)){a.className=a.className==""?b:a.className.replace(/\s+$/,"")+" "+b}},removeClass:function(a,b){var c=new RegExp("(^|\\s+)"+b+"(\\s+|$)");a.className=a.className.replace(c,function(e,f,d){return f===" "&&d===" "?" ":""})},getStyle:function(a,b){if(a.currentStyle){return a.currentStyle[b]}else{if(window.getComputedStyle){return window.getComputedStyle(a,null)[b]}}},addEvent:function(b,g,a){var c,d,e,f;f=arguments[3];g=g.toLowerCase();if(v===y){v="Plupload_"+t.guid()}if(b.addEventListener){c=a;b.addEventListener(g,c,false)}else{if(b.attachEvent){c=function(){var h=window.event;if(!h.target){h.target=h.srcElement}h.preventDefault=s;h.stopPropagation=q;a(h)};b.attachEvent("on"+g,c)}}if(b[v]===y){b[v]=t.guid()}if(!w.hasOwnProperty(b[v])){w[b[v]]={}}d=w[b[v]];if(!d.hasOwnProperty(g)){d[g]=[]}d[g].push({func:c,orig:a,key:f})},removeEvent:function(b,g){var d,a,e;if(typeof(arguments[2])=="function"){a=arguments[2]}else{e=arguments[2]}g=g.toLowerCase();if(b[v]&&w[b[v]]&&w[b[v]][g]){d=w[b[v]][g]}else{return}for(var f=d.length-1;f>=0;f--){if(d[f].key===e||d[f].orig===a){if(b.removeEventListener){b.removeEventListener(g,d[f].func,false)}else{if(b.detachEvent){b.detachEvent("on"+g,d[f].func)}}d[f].orig=null;d[f].func=null;d.splice(f,1);if(a!==y){break}}}if(!d.length){delete w[b[v]][g]}if(t.isEmptyObj(w[b[v]])){delete w[b[v]];try{delete b[v]}catch(c){b[v]=y}}},removeAllEvents:function(a){var b=arguments[1];if(a[v]===y||!a[v]){return}t.each(w[a[v]],function(c,d){t.removeEvent(a,d,b)})}};t.Uploader=function(d){var g={},a,b=[],e,f=false;a=new t.QueueProgress();d=t.extend({chunk_size:0,multipart:true,multi_selection:true,file_data_name:"file",filters:[]},d);function c(){var j,i=0,k;if(this.state==t.STARTED){for(k=0;k<b.length;k++){if(!j&&b[k].status==t.QUEUED){j=b[k];j.status=t.UPLOADING;if(this.trigger("BeforeUpload",j)){this.trigger("UploadFile",j)}}else{i++}}if(i==b.length){this.stop();this.trigger("UploadComplete",b)}}}function h(){var i,j;a.reset();for(i=0;i<b.length;i++){j=b[i];if(j.size!==y){a.size+=j.size;a.loaded+=j.loaded}else{a.size=y}if(j.status==t.DONE){a.uploaded++}else{if(j.status==t.FAILED){a.failed++}else{a.queued++}}}if(a.size===y){a.percent=b.length>0?Math.ceil(a.uploaded/b.length*100):0}else{a.bytesPerSec=Math.ceil(a.loaded/((+new Date()-e||1)/1000));a.percent=a.size>0?Math.ceil(a.loaded/a.size*100):0}}t.extend(this,{state:t.STOPPED,runtime:"",features:{},files:b,settings:d,total:a,id:t.guid(),init:function(){var j=this,D,i,k,m=0,C;if(typeof(d.preinit)=="function"){d.preinit(j)}else{t.each(d.preinit,function(A,B){j.bind(B,A)})}d.page_url=d.page_url||document.location.pathname.replace(/\/[^\/]+$/g,"/");if(!/^(\w+:\/\/|\/)/.test(d.url)){d.url=d.page_url+d.url}d.chunk_size=t.parseSize(d.chunk_size);d.max_file_size=t.parseSize(d.max_file_size);j.bind("FilesAdded",function(N,K){var L,M,B=0,A,J=d.filters;if(J&&J.length){A=[];t.each(J,function(E){t.each(E.extensions.split(/,/),function(F){if(/^\s*\*\s*$/.test(F)){A.push("\\.*")}else{A.push("\\."+F.replace(new RegExp("["+("/^$.*+?|()[]{}\\".replace(/./g,"\\$&"))+"]","g"),"\\$&"))}})});A=new RegExp(A.join("|")+"$","i")}for(L=0;L<K.length;L++){M=K[L];M.loaded=0;M.percent=0;M.status=t.QUEUED;if(A&&!A.test(M.name)){N.trigger("Error",{code:t.FILE_EXTENSION_ERROR,message:t.translate("File extension error."),file:M});continue}if(M.size!==y&&M.size>d.max_file_size){N.trigger("Error",{code:t.FILE_SIZE_ERROR,message:t.translate("File size error."),file:M});continue}b.push(M);B++}if(B){x(function(){j.trigger("QueueChanged");j.refresh()},1)}else{return false}});if(d.unique_names){j.bind("UploadFile",function(H,G){var A=G.name.match(/\.([^.]+)$/),B="tmp";if(A){B=A[1]}G.target_name=G.id+"."+B})}j.bind("UploadProgress",function(B,A){A.percent=A.size>0?Math.ceil(A.loaded/A.size*100):100;h()});j.bind("StateChanged",function(A){if(A.state==t.STARTED){e=(+new Date())}else{if(A.state==t.STOPPED){for(D=A.files.length-1;D>=0;D--){if(A.files[D].status==t.UPLOADING){A.files[D].status=t.QUEUED;h()}}}}});j.bind("QueueChanged",h);j.bind("Error",function(B,A){if(A.file){A.file.status=t.FAILED;h();if(B.state==t.STARTED){x(function(){c.call(j)},1)}}});j.bind("FileUploaded",function(B,A){A.status=t.DONE;A.loaded=A.size;B.trigger("UploadProgress",A);x(function(){c.call(j)},1)});if(d.runtimes){i=[];C=d.runtimes.split(/\s?,\s?/);for(D=0;D<C.length;D++){if(p[C[D]]){i.push(p[C[D]])}}}else{i=p}function l(){var A=i[m++],B,H,G;if(A){B=A.getFeatures();H=j.settings.required_features;if(H){H=H.split(",");for(G=0;G<H.length;G++){if(!B[H[G]]){l();return}}}A.init(j,function(E){if(E&&E.success){j.features=B;j.runtime=A.name;j.trigger("Init",{runtime:A.name});j.trigger("PostInit");j.refresh()}else{l()}})}else{j.trigger("Error",{code:t.INIT_ERROR,message:t.translate("Init error.")})}}l();if(typeof(d.init)=="function"){d.init(j)}else{t.each(d.init,function(A,B){j.bind(B,A)})}},refresh:function(){this.trigger("Refresh")},start:function(){if(b.length&&this.state!=t.STARTED){this.state=t.STARTED;this.trigger("StateChanged");c.call(this)}},stop:function(){if(this.state!=t.STOPPED){this.state=t.STOPPED;this.trigger("CancelUpload");this.trigger("StateChanged")}},disableBrowse:function(){f=arguments[0]!==y?arguments[0]:true;this.trigger("DisableBrowse",f)},getFile:function(i){var j;for(j=b.length-1;j>=0;j--){if(b[j].id===i){return b[j]}}},removeFile:function(i){var j;for(j=b.length-1;j>=0;j--){if(b[j].id===i.id){return this.splice(j,1)[0]}}},splice:function(i,k){var j;j=b.splice(i===y?0:i,k===y?b.length:k);this.trigger("FilesRemoved",j);this.trigger("QueueChanged");return j},trigger:function(j){var l=g[j.toLowerCase()],i,k;if(l){k=Array.prototype.slice.call(arguments);k[0]=this;for(i=0;i<l.length;i++){if(l[i].func.apply(l[i].scope,k)===false){return false}}}return true},hasEventListener:function(i){return !!g[i.toLowerCase()]},bind:function(k,i,j){var l;k=k.toLowerCase();l=g[k]||[];l.push({func:i,scope:j||this});g[k]=l},unbind:function(k){k=k.toLowerCase();var l=g[k],j,i=arguments[1];if(l){if(i!==y){for(j=l.length-1;j>=0;j--){if(l[j].func===i){l.splice(j,1);break}}}else{l=[]}if(!l.length){delete g[k]}}},unbindAll:function(){var i=this;t.each(g,function(j,k){i.unbind(k)})},destroy:function(){this.stop();this.trigger("Destroy");this.unbindAll()}})};t.File=function(a,c,b){var d=this;d.id=a;d.name=c;d.size=b;d.loaded=0;d.percent=0;d.status=0};t.Runtime=function(){this.getFeatures=function(){};this.init=function(b,a){}};t.QueueProgress=function(){var a=this;a.size=0;a.loaded=0;a.uploaded=0;a.failed=0;a.queued=0;a.percent=0;a.bytesPerSec=0;a.reset=function(){a.size=a.loaded=a.uploaded=a.failed=a.queued=a.percent=a.bytesPerSec=0}};t.runtimes={};window.plupload=t})();