!function(c){var d=function(){setTimeout(function(){b();c(".layout-jnews").css("visibility","visible")},250);setTimeout(function(){a()},500)};var a=function(){var n=c(".layout-jnews .card.pub-jnews .height-item-jnews .gradient-jnews.abstract-publication");var f=n.closest(".layout-jnews .card.pub-jnews .height-item-jnews");for(var g=0;g<f.length;g++){var o=f[g].querySelector(".gradient-jnews.abstract-publication");var j=f[g].querySelector(".nounderline-jnews .card-block");var m=f[g].querySelector(".card-block-footer.footer-publication");if(o!=null){var e=o.offsetHeight;var k=j.offsetHeight;var h=m.offsetHeight;var l=f[g].offsetHeight;if(l-k-e-h>20){o.classList.remove("gradient-jnews")}}}};var b=function(){var r=c(".layout-jnews .card.pub-jnews .height-item-jnews .add-abstract.abstract-publication");var f=r.closest(".layout-jnews .card.pub-jnews .height-item-jnews");var l=16;for(var j=0;j<f.length;j++){var g=f[j].querySelector(".card-img");var o=f[j].querySelector(".nounderline-jnews .card-block");var q=f[j].querySelector(".card-block-footer.footer-publication");var h=0;if(g!=null){h=g.offsetHeight+l}var n=o.offsetHeight;var k=q.offsetHeight;var p=f[j].offsetHeight;var m=p-h-n-k;var s=f[j].querySelector(".add-abstract.abstract-publication");s.style.display="block";var e=s.offsetHeight;s.style.display="none";if(e<m){s.style.display="block";o.classList.remove("title-publication");s.classList.remove("add-abstract")}}};c(window).ready(function(){d()});c(document).on("jalios:refresh",function(e){if(e.refresh.type=="after"){d()}})}(window.jQuery);