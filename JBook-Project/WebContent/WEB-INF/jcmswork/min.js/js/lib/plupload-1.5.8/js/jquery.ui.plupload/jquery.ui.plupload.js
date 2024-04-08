(function(m,j,p,l,n){var k={};function i(a){return p.translate(a)||a}function o(a){a.html('<div class="plupload_wrapper"><div class="ui-widget-content plupload_container"><div class="plupload"><div class="ui-state-default ui-widget-header plupload_header"><div class="plupload_header_content"><div class="plupload_header_title">'+i("Select files")+'</div><div class="plupload_header_text">'+i("Add files to the upload queue and click the start button.")+'</div></div></div><div class="plupload_content"><table class="plupload_filelist"><tr class="ui-widget-header plupload_filelist_header"><td class="plupload_cell plupload_file_name">'+i("Filename")+'</td><td class="plupload_cell plupload_file_status">'+i("Status")+'</td><td class="plupload_cell plupload_file_size">'+i("Size")+'</td><td class="plupload_cell plupload_file_action">&nbsp;</td></tr></table><div class="plupload_scroll"><table class="plupload_filelist_content"></table></div><table class="plupload_filelist"><tr class="ui-widget-header ui-widget-content plupload_filelist_footer"><td class="plupload_cell plupload_file_name"><div class="plupload_buttons"><!-- Visible --><a class="plupload_button plupload_add">'+i("Add Files")+'</a>&nbsp;<a class="plupload_button plupload_start">'+i("Start Upload")+'</a>&nbsp;<a class="plupload_button plupload_stop plupload_hidden">'+i("Stop Upload")+'</a>&nbsp;</div><div class="plupload_started plupload_hidden"><!-- Hidden --><div class="plupload_progress plupload_right"><div class="plupload_progress_container"></div></div><div class="plupload_cell plupload_upload_status"></div><div class="plupload_clearer">&nbsp;</div></div></td><td class="plupload_file_status"><span class="plupload_total_status">0%</span></td><td class="plupload_file_size"><span class="plupload_total_file_size">0 kb</span></td><td class="plupload_file_action"></td></tr></table></div></div></div><input class="plupload_count" value="0" type="hidden"></div>')}l.widget("ui.plupload",{contents_bak:"",runtime:null,options:{browse_button_hover:"ui-state-hover",browse_button_active:"ui-state-active",dragdrop:true,multiple_queues:true,buttons:{browse:true,start:true,stop:true},autostart:false,sortable:false,rename:false,max_file_count:0},FILE_COUNT_ERROR:-9001,_create:function(){var c=this,a,b;a=this.element.attr("id");if(!a){a=p.guid();this.element.attr("id",a)}this.id=a;this.contents_bak=this.element.html();o(this.element);this.container=l(".plupload_container",this.element).attr("id",a+"_container");this.filelist=l(".plupload_filelist_content",this.container).attr({id:a+"_filelist",unselectable:"on"});this.browse_button=l(".plupload_add",this.container).attr("id",a+"_browse");this.start_button=l(".plupload_start",this.container).attr("id",a+"_start");this.stop_button=l(".plupload_stop",this.container).attr("id",a+"_stop");if(l.ui.button){this.browse_button.button({icons:{primary:"ui-icon-circle-plus"}});this.start_button.button({icons:{primary:"ui-icon-circle-arrow-e"},disabled:true});this.stop_button.button({icons:{primary:"ui-icon-circle-close"}})}this.progressbar=l(".plupload_progress_container",this.container);if(l.ui.progressbar){this.progressbar.progressbar()}this.counter=l(".plupload_count",this.element).attr({id:a+"_count",name:a+"_count"});b=this.uploader=k[a]=new p.Uploader(l.extend({container:a,browse_button:a+"_browse"},this.options));b.bind("Error",function(e,d){if(d.code===p.INIT_ERROR){c.destroy()}});b.bind("Init",function(e,d){if(!c.options.buttons.browse){c.browse_button.button("disable").hide();e.disableBrowse(true)}if(!c.options.buttons.start){c.start_button.button("disable").hide()}if(!c.options.buttons.stop){c.stop_button.button("disable").hide()}if(!c.options.unique_names&&c.options.rename){c._enableRenaming()}if(b.features.dragdrop&&c.options.dragdrop){c._enableDragAndDrop()}c.container.attr("title",i("Using runtime: ")+(c.runtime=d.runtime));c.start_button.click(function(f){if(!l(this).button("option","disabled")){c.start()}f.preventDefault()});c.stop_button.click(function(f){c.stop();f.preventDefault()})});if(c.options.max_file_count){b.bind("FilesAdded",function(e,h){var g=[],d=h.length;var f=e.files.length+d-c.options.max_file_count;if(f>0){g=h.splice(d-f,f);e.trigger("Error",{code:c.FILE_COUNT_ERROR,message:i("File count error."),file:g})}})}b.init();b.bind("FilesAdded",function(e,d){c._trigger("selected",null,{up:e,files:d});if(c.options.autostart){setTimeout(function(){c.start()},10)}});b.bind("FilesRemoved",function(e,d){c._trigger("removed",null,{up:e,files:d})});b.bind("QueueChanged",function(){c._updateFileList()});b.bind("StateChanged",function(){c._handleState()});b.bind("UploadFile",function(e,d){c._handleFileStatus(d)});b.bind("FileUploaded",function(e,d){c._handleFileStatus(d);c._trigger("uploaded",null,{up:e,file:d})});b.bind("UploadProgress",function(e,d){l("#"+d.id).find(".plupload_file_status").html(d.percent+"%").end().find(".plupload_file_size").html(p.formatSize(d.size));c._handleFileStatus(d);c._updateTotalProgress();c._trigger("progress",null,{up:e,file:d})});b.bind("UploadComplete",function(e,d){c._trigger("complete",null,{up:e,files:d})});b.bind("Error",function(e,f){var h=f.file,g,d;if(h){g="<strong>"+f.message+"</strong>";d=f.details;if(d){g+=" <br /><i>"+f.details+"</i>"}else{switch(f.code){case p.FILE_EXTENSION_ERROR:d=i("File: %s").replace("%s",h.name);break;case p.FILE_SIZE_ERROR:d=i("File: %f, size: %s, max file size: %m").replace(/%([fsm])/g,function(s,t){switch(t){case"f":return h.name;case"s":return h.size;case"m":return p.parseSize(c.options.max_file_size)}});break;case c.FILE_COUNT_ERROR:d=i("Upload element accepts only %d file(s) at a time. Extra files were stripped.").replace("%d",c.options.max_file_count);break;case p.IMAGE_FORMAT_ERROR:d=p.translate("Image format either wrong or not supported.");break;case p.IMAGE_MEMORY_ERROR:d=p.translate("Runtime ran out of available memory.");break;case p.IMAGE_DIMENSIONS_ERROR:d=p.translate("Resoultion out of boundaries! <b>%s</b> runtime supports images only up to %wx%hpx.").replace(/%([swh])/g,function(s,t){switch(t){case"s":return e.runtime;case"w":return e.features.maxWidth;case"h":return e.features.maxHeight}});break;case p.HTTP_ERROR:d=i("Upload URL might be wrong or doesn't exist");break}g+=" <br /><i>"+d+"</i>"}c.notify("error",g);c._trigger("error",null,{up:e,file:h,error:g})}})},_setOption:function(b,a){var c=this;if(b=="buttons"&&typeof(a)=="object"){a=l.extend(c.options.buttons,a);if(!a.browse){c.browse_button.button("disable").hide();up.disableBrowse(true)}else{c.browse_button.button("enable").show();up.disableBrowse(false)}if(!a.start){c.start_button.button("disable").hide()}else{c.start_button.button("enable").show()}if(!a.stop){c.stop_button.button("disable").hide()}else{c.start_button.button("enable").show()}}c.uploader.settings[b]=a},start:function(){this.uploader.start();this._trigger("start",null)},stop:function(){this.uploader.stop();this._trigger("stop",null)},getFile:function(a){var b;if(typeof a==="number"){b=this.uploader.files[a]}else{b=this.uploader.getFile(a)}return b},removeFile:function(a){var b=this.getFile(a);if(b){this.uploader.removeFile(b)}},clearQueue:function(){this.uploader.splice()},getUploader:function(){return this.uploader},refresh:function(){this.uploader.refresh()},_handleState:function(){var a=this,b=this.uploader;if(b.state===p.STARTED){l(a.start_button).button("disable");l([]).add(a.stop_button).add(".plupload_started").removeClass("plupload_hidden");l(".plupload_upload_status",a.element).html(i("Uploaded %d/%d files").replace("%d/%d",b.total.uploaded+"/"+b.files.length));l(".plupload_header_content",a.element).addClass("plupload_header_content_bw")}else{l([]).add(a.stop_button).add(".plupload_started").addClass("plupload_hidden");if(a.options.multiple_queues){l(a.start_button).button("enable");l(".plupload_header_content",a.element).removeClass("plupload_header_content_bw")}a._updateFileList()}},_handleFileStatus:function(b){var g,d;if(!l("#"+b.id).length){return}switch(b.status){case p.DONE:g="plupload_done";d="ui-icon ui-icon-circle-check";break;case p.FAILED:g="ui-state-error plupload_failed";d="ui-icon ui-icon-alert";break;case p.QUEUED:g="plupload_delete";d="ui-icon ui-icon-circle-minus";break;case p.UPLOADING:g="ui-state-highlight plupload_uploading";d="ui-icon ui-icon-circle-arrow-w";var e=l(".plupload_scroll",this.container),a=e.scrollTop(),f=e.height(),c=l("#"+b.id).position().top+l("#"+b.id).height();if(f<c){e.scrollTop(a+c-f)}break}g+=" ui-state-default plupload_file";l("#"+b.id).attr("class",g).find(".ui-icon").attr("class",d)},_updateTotalProgress:function(){var a=this.uploader;this.progressbar.progressbar("value",a.total.percent);this.element.find(".plupload_total_status").html(a.total.percent+"%").end().find(".plupload_total_file_size").html(p.formatSize(a.total.size)).end().find(".plupload_upload_status").html(i("Uploaded %d/%d files").replace("%d/%d",a.total.uploaded+"/"+a.files.length))},_updateFileList:function(){var c=this,d=this.uploader,a=this.filelist,b=0,f,g=this.id+"_",e;if(l.ui.sortable&&this.options.sortable){l("tbody.ui-sortable",a).sortable("destroy")}a.empty();l.each(d.files,function(h,r){e="";f=g+b;if(r.status===p.DONE){if(r.target_name){e+='<input type="hidden" name="'+f+'_tmpname" value="'+p.xmlEncode(r.target_name)+'" />'}e+='<input type="hidden" name="'+f+'_name" value="'+p.xmlEncode(r.name)+'" />';e+='<input type="hidden" name="'+f+'_status" value="'+(r.status===p.DONE?"done":"failed")+'" />';b++;c.counter.val(b)}a.append('<tr class="ui-state-default plupload_file" id="'+r.id+'"><td class="plupload_cell plupload_file_name"><span>'+r.name+'</span></td><td class="plupload_cell plupload_file_status">'+r.percent+'%</td><td class="plupload_cell plupload_file_size">'+p.formatSize(r.size)+'</td><td class="plupload_cell plupload_file_action"><div class="ui-icon"></div>'+e+"</td></tr>");c._handleFileStatus(r);l("#"+r.id+".plupload_delete .ui-icon, #"+r.id+".plupload_done .ui-icon").click(function(q){l("#"+r.id).remove();d.removeFile(r);q.preventDefault()});c._trigger("updatelist",null,a)});if(d.total.queued===0){l(".ui-button-text",c.browse_button).html(i("Add Files"))}else{l(".ui-button-text",c.browse_button).html(i("%d files queued").replace("%d",d.total.queued))}if(d.files.length===(d.total.uploaded+d.total.failed)){c.start_button.button("disable")}else{c.start_button.button("enable")}a[0].scrollTop=a[0].scrollHeight;c._updateTotalProgress();if(!d.files.length&&d.features.dragdrop&&d.settings.dragdrop){l("#"+f+"_filelist").append('<tr><td class="plupload_droptext">'+i("Drag files here.")+"</td></tr>")}else{if(c.options.sortable&&l.ui.sortable){c._enableSortingList()}}},_enableRenaming:function(){var a=this;this.filelist.on("click",".plupload_delete .plupload_file_name span",function(f){var b=l(f.target),d,g,e,c="";d=a.uploader.getFile(b.parents("tr")[0].id);e=d.name;g=/^(.+)(\.[^.]+)$/.exec(e);if(g){e=g[1];c=g[2]}b.hide().after('<input class="plupload_file_rename" type="text" />');b.next().val(e).focus().blur(function(){b.show().next().remove()}).keydown(function(h){var r=l(this);if(l.inArray(h.keyCode,[13,27])!==-1){h.preventDefault();if(h.keyCode===13){d.name=r.val()+c;b.html(d.name)}r.blur()}})})},_enableDragAndDrop:function(){this.filelist.append('<tr><td class="plupload_droptext">'+i("Drag files here.")+"</td></tr>");this.filelist.parent().attr("id",this.id+"_dropbox");this.uploader.settings.drop_element=this.options.drop_element=this.id+"_dropbox"},_enableSortingList:function(){var a,b=this;if(l("tbody tr",this.filelist).length<2){return}l("tbody",this.filelist).sortable({containment:"parent",items:".plupload_delete",helper:function(c,d){return d.clone(true).find("td:not(.plupload_file_name)").remove().end().css("width","100%")},stop:function(f,g){var d,h,e,c=[];l.each(l(this).sortable("toArray"),function(t,s){c[c.length]=b.uploader.getFile(s)});c.unshift(c.length);c.unshift(0);Array.prototype.splice.apply(b.uploader.files,c)}})},notify:function(b,a){var c=l('<div class="plupload_message"><span class="plupload_message_close ui-icon ui-icon-circle-close" title="'+i("Close")+'"></span><p><span class="ui-icon"></span>'+a+"</p></div>");c.addClass("ui-state-"+(b==="error"?"error":"highlight")).find("p .ui-icon").addClass("ui-icon-"+(b==="error"?"alert":"info")).end().find(".plupload_message_close").click(function(){c.remove()}).end();l(".plupload_header_content",this.container).append(c)},destroy:function(){l(".plupload_button",this.element).unbind();if(l.ui.button){l(".plupload_add, .plupload_start, .plupload_stop",this.container).button("destroy")}if(l.ui.progressbar){this.progressbar.progressbar("destroy")}if(l.ui.sortable&&this.options.sortable){l("tbody",this.filelist).sortable("destroy")}this.uploader.destroy();this.element.empty().html(this.contents_bak);this.contents_bak="";l.Widget.prototype.destroy.apply(this)}})}(window,document,plupload,jQuery));