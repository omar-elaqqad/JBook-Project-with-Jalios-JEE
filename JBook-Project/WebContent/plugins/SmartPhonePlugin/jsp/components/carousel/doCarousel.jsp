<%@page import="com.jalios.jcmsplugin.smartphone.slick.SlickConfiguration"%>
<%@page import="com.jalios.jcmsplugin.smartphone.slick.SlickManager"%>
<%@ include file="/front/card/data/layout/doInitCardsData.jspf" %><%
long autoplayCarousel = (long) getIncludeObject("autoplayCarousel", 0L);
boolean arrows = (boolean) getIncludeObject("arrows", true);
boolean dots = (boolean) getIncludeObject("dots", true);
boolean showTitle = (boolean) getIncludeObject("showTitle", true);
int slidesToShow = (int) getIncludeObject("slidesToShow", 1);

SlickConfiguration configuration = request.getAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE) != null ? (SlickConfiguration) request.getAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE) : new SlickConfiguration();

if ( autoplayCarousel > 0 ) {
  configuration.setAutoplay(true);
  configuration.setAutoplaySpeed((int)autoplayCarousel * 1000);
}
else {
  configuration.setAutoplay(false);
}

configuration.setArrows(arrows);
configuration.setDots(dots);
configuration.setSlidesToShow(slidesToShow);

request.setAttribute("showTitle",showTitle);
request.setAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE, SlickManager.getInstance().getJsonSlickConfiguration(configuration));

css += " pqf-carousel"; 

String cssArrowExt = "";
if ( slidesToShow > 1 && arrows ) {
  cssArrowExt = "slick-arrow-ext";
}
if (slidesToShow > 1) {
  css += " is-multiple-slides slides-to-show-" + slidesToShow ;
}

request.setAttribute("cssArrowExt",cssArrowExt);
%>
<% if ( Util.notEmpty(collection) && slidesToShow > 0 ) { %>
  <jalios:cards css="<%= css %>" resource="cards.jmobile-carousel" >
    <jalios:foreach collection='<%= collection %>' type='Publication' name='itPub'>
      <% 
        String imagePath = itPub.getDataImage(); 
        if (Util.isEmpty(imagePath)) {
          imagePath = "plugins/SmartPhonePlugin/images/defaultCardImage.png"; 
        }
      %>
      <div>
        <a href="<%= itPub.getDisplayUrl(userLocale)%>">
          <img class="carousel-image" data-lazy="<%= imagePath %>" alt="" />
          <div class="carousel-title-overlay">
            <div class="carousel-overlay">
              <div class="carousel-pub-title"><%= itPub.getTitle(userLang, true) %></div>
            </div>  
          </div>
        </a>
      </div>
    </jalios:foreach>
  </jalios:cards>
<% } %>
<% request.removeAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE); %>