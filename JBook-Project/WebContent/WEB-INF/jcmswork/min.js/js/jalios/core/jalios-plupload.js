!function(g){var o="html5,flash,silverlight,gears,browserplus";var p=g.jalios.Http.getContextPath()+"/js/lib/plupload-1.5.8/js/plupload.flash.swf";var d=g.jalios.Http.getContextPath()+"/js/lib/plupload-1.5.8/js/plupload.silverlight.xap";var h=g.jalios.Http.getContextPath()+"/jcore/plupload.jsp";var c=g.jalios.Properties.get("plupload-filters");for(filterName in c){var a=c[filterName];a.title=g.jalios.I18N.glp("plupload-filters."+filterName)+" ("+a.extensions+")"}var k=false;var m=function(){if(k){return}k=true;g(document).on("jalios:refresh",function(s){var r=g.jalios.Event.match(s,"refresh","after");if(!r){return}e()});e()};var e=function(){if(typeof(plupload)!=="undefined"&&plupload.mimeTypes){plupload.mimeTypes.ico="image/x-icon";plupload.mimeTypes.webp="image/webp";plupload.mimeTypes.mpd="application/dash+xml";plupload.mimeTypes.m3u8="application/x-mpegurl";plupload.mimeTypes.ts="video/mp2t"}g("DIV.plupload").jcmsPlupload()};g.fn.jcmsPlupload=function(){this.each(function(){var x=g(this);var u=x.attr("class");if(x.data("plupload")){return}if(x.parent().closest("DIV.plupload").exists()){return}if(!x.hasClass("plupload-single")){x.hide()}var t={url:h,runtimes:o,multipart:true,required_features:"multipart",multipart_params:{},headers:{"X-Jcms-Plupload":"true"},preinit:function(y){y.bind("PostInit",g.proxy(b,x[0]))},init:function(z){x.data("plupload",z);z.bind("FileUploaded",g.proxy(f,x[0]));z.bind("FilesAdded",g.proxy(j,x[0]));z.bind("FilesRemoved",g.proxy(l,x[0]));var y=g.Event("jalios:plupload");y.plupload={};y.plupload.type="init";y.plupload.target=x;g(document).trigger(y)},flash_swf_url:p,silverlight_xap_url:d};for(filterName in c){if(x.hasClass("plupload-filter-"+filterName)){t.filters=[c[filterName]]}}if(x.hasClass("plupload-single")){t.multi_selection=false;t.max_file_count=1}var s=u.match(/plupload-resize-(\d+)x(\d+)x(\d+)/);if(s&&s.length>1){t.resize={width:s[1],height:s[2],quality:s[3]}}var w=u.match(/plupload-field-(\w+)/);if(w){t.multipart_params.field=w[1]}var r=document.body.id;var v=u.match(/plupload-token-(\w+)/);t.multipart_params.token=v||r;x.closest("FORM").append('<input name="plupload-token" type="hidden" value="'+(v||r)+'"/>');x.closest("FORM").find(".plupload-submit").on("click",q);x.pluploadQueue(t);g(".plupload_add",x).prepend("<span class='jalios-icon plupload_add-icon'></span>");g(window).on("beforeunload",function(){var z=x.data("plupload");if(!z){return}g.console.log("Plupload state: ",z);var y=z&&z.state&&plupload.STOPPED!==z.state;if(y){return"Are you sure you want to leave?"}return})})};var b=function(){var r=g(this);if(!r.hasClass("plupload-single")){if(!r.is(":visible")){r.slideDown()}}if(r.hasClass("plupload-single")&&r.hasClass("plupload-multivalued")){r.find(".plupload_filelist_footer .plupload_file_action").append('<a href="#" data-jalios-action="widget:clear" class="action-remove jalios-icon remove glyphicons-remove-2"></a>')}};var n=function(t,r){var u=r.files.length>1;var s=t.closest("form");s.find(".widget-name-title").toggleClass("disabled",u);s.find('input[name="title"][type="text"]').prop("disabled",u)};var f=function(r,t,s){g(this).append('<input name="'+r.settings.multipart_params.field+'" type="hidden" value="MultipartUpload"/>')};var j=function(s,t){var u=g(this);var r=s.settings.max_file_count;while(s.files.length>r){if(s.files.length>r){s.removeFile(s.files[r])}}if(r==1){g.each(t,function(w,v){var x=u.find(".plupload_filelist_footer");var y=x.find(".plupload_filename");if(y.length==0){y=g('<div class="plupload_filename"></div>').insertAfter(x.find(".plupload_file_size"))}y.html("<span>"+v.name+"</span>");x.find(".plupload_file_action .action-remove").css("display","block")})}n(u,s);g(".plupload-submit").show()};var l=function(s,t){var v=g(this);var r=s.settings.max_file_count;if(r==1){var u=v.find(".plupload_filelist_footer");var w=u.find(".plupload_filename");w.remove();u.find(".plupload_file_action .action-remove").css("display","")}n(v,s);if(s.files.length==0){g(".plupload-submit").hide()}};var q=function(s){var r=s.currentTarget;var t=g(r).closest("FORM").find("DIV.plupload");t.each(function(){var v=g(this);var u=v.data("plupload");if(!u){return}if(!v.data("p-init")){v.data("p-init",true);u.bind("UploadComplete",function(w,x){if(w.total.queued==0){g.jalios.DOM.follow(r)}})}if(u.total.queued!=0){u.start();s.preventDefault();s.stopPropagation();return false}})};var i=function(r){var s=jQuery.jalios.Event.match(r,"refresh","serialize");if(s){g('#plupload-inline INPUT[name^="plupload-inline"]').remove();g('#plupload-inline INPUT[name="filename"]').remove()}};jQuery(document).on("jalios:refresh",i);g(document).on("jalios:ready",m)}(window.jQuery);