!function(g){let displayLoadingDelay=1000;const d=function(i){let validateProfileTabLink=i&&i.hasClass("js-tab-link");validateProfileTabLink=validateProfileTabLink&&i.parents(".member-profile-full-display").length>0;let d=validateProfileTabLink;return d};const b=function(i){let $loadingHolder=g(".profile-body-inner");let $trigger=g(i.refresh.options.trigger);if(d($trigger)){$trigger.ripple();setTimeout(function(){$loadingHolder.displayLoading()},displayLoadingDelay)}};const f=function(i){let refreshBefore=g.jalios.Event.match(i,"refresh","before");if(refreshBefore){b(i)}};const c=function(){let $profile=g("#member-profile");if(!$profile.length){return}if(!$profile.closest("MAIN").length){a($profile,"MAIN");g("#member-profile").attr("role","main");return}};const h=function(i){if(i.type==="click"){return true}else{if(i.type==="keydown"){let code=i.charCode||i.keyCode;if((code===32)||(code===13)){return true}}else{return false}}};const a=function(j,i){let attrs={};g.each(j[0].attributes,function(l,k){attrs[k.nodeName]=k.nodeValue});let content=j.contents();j.replaceWith(function(){let $newElt=g("<"+i+"/>",attrs);$newElt.append(content);return $newElt})};const e=function(){g(document).on("jalios:refresh",f);if(g(".photo-lightbox-img").exists()&&g.jalios.Lightbox&&typeof g.jalios.Lightbox.launchLightbox==="function"){g(document).on("click keydown",".member-profile-photo",function(i){if(h(i)){g.jalios.Lightbox.launchLightbox(g(".photo-lightbox-img"))}})}else{g(".member-profile-photo").removeAttr("role").removeAttr("tabindex").removeAttr("title").removeAttr("aria-label")}c()};g(document).on("jalios:ready",function(){e()})}(window.jQuery);