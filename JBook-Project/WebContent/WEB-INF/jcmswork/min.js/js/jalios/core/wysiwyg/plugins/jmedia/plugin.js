!function(a){tinymce.PluginManager.add("jmedia",function(f,g){var t="jalios:media";var e="data-jalios-source";var p="iframe";var n="img";var r="data-jalios-media-source";var l="data-mce-p-"+r;var j="jcore/media/embed.jsp";var s=f.getParam("media_template","<"+t+"@attributes@ />");var i=f.getParam("media_placeholder","<"+p+'@attributes@ contenteditable="false"></'+p+">");var h=f.getParam("media_img_placeholder","<"+n+"@attributes@ />");var q=a.wysiwyg.utils.getTagRegExp(t,e);var o=a.wysiwyg.utils.getTagRegExp(p,r);var b=a.wysiwyg.utils.getTagRegExp(n,r);f.jalios.plugins.jmedia={insertTag:function(u){var v=f.jalios.plugins.jmedia.createTag(u,true);f.insertContent(v)},createTag:function(w,v){var u=" "+e+'="'+a.wysiwyg.utils.escape(w.source)+'"';u+=w.width?' data-jalios-width="'+w.width+'"':"";u+=w.height?' data-jalios-height="'+w.height+'"':"";if(!v){u+=w.title?' data-jalios-title="'+a.wysiwyg.utils.escape(w.title)+'"':""}u+=w.style?' data-jalios-style="'+a.wysiwyg.utils.escape(w.style)+'"':"";u+=w.classes?' data-jalios-class="'+a.wysiwyg.utils.escape(w.classes)+'"':"";return s.replace(/@attributes@/g,u)},createHtmlTag:function(x){var w=j+"?autoresize=true&src="+encodeURIComponent(x.source)+(x.width?"&width="+x.width:"")+(x.height?"&height="+x.height:"");if(x.type==="image"){w=x.url}var u=' src="'+a.wysiwyg.utils.escape(w)+'" '+r+'="'+a.wysiwyg.utils.escape(x.source)+'" data-mce-src="'+a.wysiwyg.utils.escape(w)+'"';if(x.width){u+=' width="'+x.width+'"';x.classes=((x.classes||"").replace(/\s*is-width-set/gi,"")+" is-width-set").trim()}if(x.height){u+=' height="'+x.height+'"';x.classes=((x.classes||"").replace(/\s*is-height-set/gi,"")+" is-height-set").trim()}u+=x.title?' title="'+a.wysiwyg.utils.escape(x.title)+'" alt="'+a.wysiwyg.utils.escape(x.title)+'"':"";u+=x.style?' style="'+a.wysiwyg.utils.escape(x.style)+'"':"";u+=x.classes?' class="'+a.wysiwyg.utils.escape(x.classes)+'"':"";var v=x.type==="image"?h:i;return v.replace(/@attributes@/g,u)}};f.addButton("jmedia",{tooltip:tinymce.i18n.translate("jmedia.btn.tooltip"),icon:"icomoon icomoon-film4",onclick:c,onpostrender:function(){var u=this;f.on("NodeChange",function(v){u.active(k(v.element))})}});f.addCommand("JaliosInsert-media",function(x,v){if(!v){return}var w=v["data-jalios-source"];var u=f.jcms.getMediaInfos(w);if(u&&u.source){f.jalios.plugins.jmedia.insertTag(u)}});f.on("ResolveName",function(v){var u=v.target;if(k(u)){v.name="jalios:media"}});f.on("BeforeSetContent",function(u){u.content=d(u.content)});f.on("PostProcess",function(u){if(u.get){u.content=m(u.content)}});function k(u){return(u.nodeName.toUpperCase()===p.toUpperCase()&&f.dom.getAttrib(u,r))||(u.nodeName.toUpperCase()===n.toUpperCase()&&f.dom.getAttrib(u,r))||(u.nodeName.toUpperCase()==="SPAN"&&f.dom.hasClass(u,"mce-object-iframe")&&f.dom.getAttrib(u,l))}function c(){a.jalios.ui.Widget.Chooser.openDataChooser("media",u,{params:{ws:f.jcms.getContext().getWorkspace()}});function u(z,B,A,x,y,w){var v={source:z,title:B,type:A,url:x,width:y,height:w};f.jcms.setMediaInfos(v);f.jalios.plugins.jmedia.insertTag(v)}}function d(u){return u.replace(q,function(x,w){var z=a(x);var A=z.attr(e);var y=f.jcms.getMediaInfos(A);var B=/^\w+_\w+$/.match(A);var C=B&&(!y||y.source===y.url);if(y&&y.source&&!C){var v={source:A,width:z.attr("data-jalios-width"),height:z.attr("data-jalios-height"),title:z.attr("data-jalios-title"),style:z.attr("data-jalios-style"),classes:z.attr("data-jalios-class")};if(!z.attr("data-jalios-title")){y.title=undefined}v=a.extend({},y,v);return f.jalios.plugins.jmedia.createHtmlTag(v)}else{return x}})}function m(u){u=u.replace(o,function(w,v){var x=a(w);return f.jalios.plugins.jmedia.createTag({source:x.attr(r),width:x.attr("width"),height:x.attr("height"),title:x.attr("title"),style:x.attr("style"),classes:x.attr("class")},false)});u=u.replace(b,function(w,v){var x=a(w);return f.jalios.plugins.jmedia.createTag({source:x.attr(r),width:x.attr("width"),height:x.attr("height"),title:x.attr("alt")||x.attr("title"),style:x.attr("style"),classes:x.attr("class")},false)});return u}})}(window.jQuery);