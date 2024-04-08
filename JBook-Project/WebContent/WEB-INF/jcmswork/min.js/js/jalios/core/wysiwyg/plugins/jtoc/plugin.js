!function(a){tinymce.PluginManager.add("jtoc",function(f,h){const w=true;const s=3;const c=true;const y=6;const l=tinymce.i18n;var z="jalios:toc";var r="div";var v="jalios-toc";var x=f.getParam("toc_template","<"+z+"@attributes@ />");var k=f.getParam("toc_placeholder","<"+r+'@attributes@ class="'+v+'" contenteditable="false"><div class="jalios-toc-title">@title@</div><div class="jalios-toc-body"><ul><li>@autonumber@</li><li>@level@</li></ul></div></'+r+">");var u="<"+z+"[^>]*>(</"+z+">)?";var q=("<"+r+'[^>]*class="'+v+'[^"]*"[^>]*><div class="jalios-toc-title">([^<]+)</div><div class="jalios-toc-body"><ul><li>([^<]+)</li><li>([^<]+)</li></ul></div></'+r+">").replace(/></g,">[\\r\\n\\t\\s]*<");f.addButton("jtoc",{tooltip:tinymce.i18n.translate("jtoc.btn.tooltip"),icon:"icomoon icomoon-file-text",onclick:o,onpostrender:m});function m(){var A=this;f.on("NodeChange",function(B){A.active(b(B.element))})}function j(){var A=p();var B=f.$(A);return B.length}function p(){var B,A=[];for(B=1;B<=s;B++){A.push("h"+B)}return A.join(",")}f.on("ResolveName",function(B){var A=B.target;if(b(A)){B.name="jalios:toc"}});f.on("Click",function(B){var A=B.target;if(b(A)){f.selection.select(A)}});function b(A){return A.nodeName.toUpperCase()===r.toUpperCase()&&f.dom.hasClass(A,v)}f.on("BeforeSetContent",function(A){A.content=e(A.content)});f.on("PostProcess",function(A){if(A.get){A.content=n(A.content)}});function o(){var D=f.selection.getNode();var B=b(D);var A=w;var E=s;if(B){var C=a(D);A=i(C);E=d(C)}f.windowManager.open({title:"jtoc.form.title",body:[{type:"checkbox",name:"autonumber",label:"jtoc.form.label.autonumber",checked:A},{type:"textbox",name:"level",label:"jtoc.form.label.level",value:E}],onsubmit:function(H){var F=H.data.autonumber;var I=H.data.level;if(a.wysiwyg.utils.validation.isEmpty(F)){H.preventDefault();f.windowManager.alert(l.translate(["jtoc.form.error.required",l.translate("jtoc.form.label.autonumber")]));return}if(!a.wysiwyg.utils.validation.isBoolean(F)){H.preventDefault();f.windowManager.alert(l.translate(["jtoc.form.error.invalid-boolean",l.translate("jtoc.form.label.autonumber")]));return}if(a.wysiwyg.utils.validation.isEmpty(I)){H.preventDefault();f.windowManager.alert(l.translate(["jtoc.form.error.required",l.translate("jtoc.form.label.level")]));return}if(!a.wysiwyg.utils.validation.isInteger(I)){H.preventDefault();f.windowManager.alert(l.translate(["jtoc.form.error.invalid-integer",l.translate("jtoc.form.label.level")]));return}var G=t({autonumber:F,level:I});f.insertContent(G)}})}function e(B){var A=new RegExp(u,"gi");return B.replace(A,function(C){var D=a(C);return g({autonumber:i(D),level:d(D)})})}function n(B){var A=new RegExp(q,"gi");return B.replace(A,function(C){var D=a(C);return t({autonumber:i(D),level:d(D)})})}function t(B){var A="";A+=' data-jalios-autonumber="'+B.autonumber+'"';A+=B.level?' data-jalios-level="'+B.level+'"':"";return x.replace(/@attributes@/g,A).replace(/@content@/g,B.content)}function g(B){var A="";A+=' data-jalios-autonumber="'+B.autonumber+'"';A+=B.level?' data-jalios-level="'+B.level+'"':"";return k.replace(/@attributes@/g,A).replace("@title@",l.translate("jtoc.title")).replace(/@autonumber@/g,l.translate(["jtoc.autonumber",l.translate("jtoc.autonumber."+B.autonumber)])).replace(/@level@/g,l.translate(["jtoc.level",B.level]))}function i(B){var A=B.data("jalios-autonumber");if(A==undefined||A===""){A=c}return A}function d(A){var B=A.data("jalios-level");if(B==undefined||B===""){B=y}return B}})}(window.jQuery);