(function(c){var a;var e=function(){var f=c('.emoji-search INPUT[name="search"]').val().toLowerCase();c(".emoji-category").each(function(){var g=c(this);g.show();var h=false;g.find("BUTTON").each(function(){var j=c(this);var i=j.attr("title").toLowerCase().indexOf(f)!=-1||j.attr("data-emoji-keywords").toLowerCase().indexOf(f)!=-1;j.toggle(i);if(i){h=true}});g.toggle(h)})};var b=function(){var f=c('.emoji-search INPUT[name="search"]');var g=f.val();if(g!==""){e()}f.on("keyup",function(h){if(a){clearTimeout(a)}a=setTimeout(function(){e();a=false},500)});f.keypress(function(h){if(h.keyCode===10||h.keyCode===13){h.preventDefault()}});c(document).on("click","A.category-link",function(i){i.preventDefault();var h=c(this.hash);var j=c(".emoji-categories");j.animate({scrollTop:h.offset().top-j.offset().top+j.scrollTop()},500);return false});c(document).on("click",".emoji-skin-tone INPUT",function(h){h.stopImmediatePropagation();c(this).closest("form").submit();return false});c(document).on("click",".emoji-category BUTTON",function(h){var j=c(c(h.target).closest("BUTTON")[0]);var i=j?j.attr("data-emoji-codepoints"):null;if(parent&&parent.jQuery&&frameElement){var h=parent.jQuery.Event("emoji-selected");h.emoji=i;parent.jQuery(frameElement).trigger(h);h.stopImmediatePropagation();return false}})};var d=function(){var g=[];var h=[];c("IMG.emoji").each(function(){var i=c(this);var j=i.attr("data-emoji-src");if(j&&j!==""){g.push(i[0]);h.push(j)}});function f(j){j=j||0;if(g.length<=j){return}var i=new Image();i.onload=function(){g[j].src=i.src;f(j+4)};i.src=h[j]}f(0);f(1);f(2);f(3)};c(document).ready(function(){b();d()})}(jQuery));