!function(e){var b;var a;var d=function(){$tinymceIframe=e(".mce-edit-area IFRAME");if(!$tinymceIframe.exists()){return}var g=e("body").height()-(e("form[name=editForm]").height()-e(".mce-edit-area").height())-20;e(".mce-edit-area IFRAME").css("height",g+"px")};var f=function(){if(!b){return}var g=window.opener.jQuery("#"+a).val();document.editForm.content.value=g;b.setContent(document.editForm.content.value)};var c=function(){if(!b){return}b.save();window.opener.jQuery("#"+a).val(document.editForm.content.value);var g=window.opener.jQuery("#"+a+"_preview_iframe");if(g.exists()){g.attr("src",g.attr("data-src"))}};e(document).on("wysiwyg:ready",function(g){b=g.editor;a=e(document.editForm).data("target-input-id");d();e(window).on("resize",d);f(b);e("#validate-btn").on("click",function(h){h.preventDefault();c();window.close()});e("#close-btn").on("click",function(h){h.preventDefault();window.close()})})}(window.jQuery);