!(function(a){if(!a.jalios){a.jalios={}}if(!a.jalios.smartPhone){a.jalios.smartPhone={}}a.jalios.smartPhone.Forms={dataURLtoFile:function(d,e){var b=d.split(","),g=b[0].match(/:(.*?);/)[1],c=atob(b[1]),h=c.length,f=new Uint8Array(h);while(h--){f[h]=c.charCodeAt(h)}return new File([f],e,{type:g})},getFormData:function(c){if(!window.FileReader){return new FormData(c)}var d=new FormData();a(c).find(":input").each(function(h,e){if(a(e).attr("type")==="button"||a(e).attr("type")==="submit"){return}else{if(a(e).attr("type")==="file"){if(a(e).data("image-data-content")){d.append(a(e).attr("name"),a(e).data("image-data-content"),a(e).data("image-data-filename"));d.append("resized","true")}else{d.append(a(e).attr("name"),e.files[0])}}else{var g=a(e).attr("type")==="checkbox";var f=a(e).attr("type")==="radio";var i=((g||f)&&a(e).is(":checked"))||(!g&&!f);if(i){d.append(a(e).attr("name"),a(e).val())}}}});var b=a(c).data("jalios-form-file");if(b){d.append("documents",b)}return d},changeToDate:function(b){b.each(function(d,e){var c=b.find(".dateChooser-wrapper");var g=b.find(".timeChooser-wrapper");var f=b.find(".dateTime");a(e).find(".date-time-wrapper").removeClass("ui-grid-a");f.val(b.find(".dateChooser").val());c.removeClass("ui-block-a");g.addClass("timeChooser-wrapper-hidden").removeClass("ui-block-b")})},changeToDateTime:function(b){b.each(function(d,e){var c=b.find(".dateChooser-wrapper");var g=b.find(".timeChooser-wrapper");var f=b.find(".dateTime");a(e).find(".date-time-wrapper").addClass("ui-grid-a");c.addClass("ui-block-a");g.val("");f.val("");g.removeClass("timeChooser-wrapper-hidden").addClass("ui-block-b")})}}})(window.jQuery);