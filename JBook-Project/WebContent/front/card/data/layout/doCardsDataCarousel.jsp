<%@page import="com.jalios.jcms.slick.SlickManager"%><% 
%><%@page import="com.jalios.jcms.slick.SlickConfiguration"%><%
%><%@ include file="/front/card/data/layout/doInitCardsData.jspf" %><%
long autoplayCarousel = (long) getIncludeObject("autoplayCarousel", 0L);
boolean arrows = (boolean) getIncludeObject("arrows", true);
boolean dots = (boolean) getIncludeObject("dots", true);
boolean showTitle = (boolean) getIncludeObject("showTitle", true);
boolean showDate = (boolean) getIncludeObject("showDate", true);
boolean showAuthor = (boolean) getIncludeObject("showAuthor", true);

int slidesToShow = (int) getIncludeObject("slidesToShow", 1);

SlickConfiguration configuration = request.getAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE) != null ? (SlickConfiguration) request.getAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE) : new SlickConfiguration();

if ( autoplayCarousel > 0 ) {
  configuration.setAutoplay(true);
  configuration.setAutoplaySpeed((int)autoplayCarousel * 1000);
  request.setAttribute("carousel-autoplay", true);
}
else {
  configuration.setAutoplay(false);
}

configuration.setArrows(arrows);
configuration.setDots(dots);
configuration.setSlidesToShow(slidesToShow);

request.setAttribute("showTitle",showTitle);
request.setAttribute("showDate",showDate);
request.setAttribute("showAuthor",showAuthor);

request.setAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE, configuration);

String cssArrowExt = "";
if ( slidesToShow > 1 && arrows ) {
  cssArrowExt = "slick-arrow-ext";
}

if (slidesToShow > 1) {
  css += "is-multiple-slides";
}

request.setAttribute("cssArrowExt",cssArrowExt);

List<Map<String, String[]>> displayUrlParamsMapList = (List<Map<String, String[]>>) request.getAttribute("displayUrlParamsMapList");
int index = 0;
boolean hasParamsMapList = Util.notEmpty(displayUrlParamsMapList);
int size = hasParamsMapList ? displayUrlParamsMapList.size() : 0;
if ( Util.notEmpty(collection) && slidesToShow > 0 ) { %>
  <jalios:cards css="<%= css %>" mode="<%= CardsDisplayMode.CAROUSEL %>">
    <jalios:foreach name="itCardData" type="Data" collection="<%= collection %>">
      <% 
        Map<String, String[]> displayUrlParamsMap = new HashMap<String, String[]>();
        if (hasParamsMapList && index < size) { 
          displayUrlParamsMap = displayUrlParamsMapList.get(0);
        } 
      %>
      <jalios:cardData titleTag="<%= titleTag %>" data="<%= itCardData %>" linkParams="<%= displayUrlParamsMap %>" template="carousel" />
      <% index++; %>
    </jalios:foreach>
  </jalios:cards>
<% } 
request.removeAttribute(SlickManager.SLICK_CONFIGURATION_JSON_ATTRIBUTE);
request.removeAttribute("carousel-autoplay");
%>