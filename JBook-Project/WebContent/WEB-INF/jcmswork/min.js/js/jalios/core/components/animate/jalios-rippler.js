!function(a){if(!a.jalios){a.jalios={}}a.jalios.Rippler={ripple:function(g,f){var c=a(f);if(c.find(".ripple").length==0){c.append("<span class='ripple'></span>")}var e=c.find(".ripple");e.removeClass("animate");if(!e.height()&&!e.width()){var h=Math.max(c.outerWidth(),c.outerHeight());e.css({height:h,width:h})}var b=0;var i=0;if(g&&g.type==="click"){b=g.pageX-c.offset().left-e.width()/2;i=g.pageY-c.offset().top-e.height()/2}else{e.addClass("is-centered")}e.css({top:i+"px",left:b+"px"}).addClass("animate")}};a.fn.ripple=function(b){return this.each(function(){a.jalios.Rippler.ripple(null,this)})};a(document).ready(function(){a(document).on("click",".js-ripple",function(b){a.jalios.Rippler.ripple(b,b.currentTarget)})})}(window.jQuery);