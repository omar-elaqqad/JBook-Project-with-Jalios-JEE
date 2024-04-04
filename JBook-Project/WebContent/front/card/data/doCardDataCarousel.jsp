<%@ include file="/front/card/data/doInitCardData.jspf" %><% 
jcmsContext.addJavaScript("js/lib/clamp/clamp.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-truncate.js");
Publication pub = (Publication) data;
String imagePath = pub.getDataImage(); 
int defaultTruncate = channel.getIntegerProperty("jcms.carousel.title.truncate",3);
int truncate = Util.notEmpty(request.getAttribute("carouselTruncate")) ? (int) request.getAttribute("carouselTruncate") : defaultTruncate ;
boolean showTitle = Util.toBoolean(request.getAttribute("showTitle"), true);
boolean showDate = Util.toBoolean(request.getAttribute("showDate"), true);
boolean showAuthor = Util.toBoolean(request.getAttribute("showAuthor"), true);
%>
<a href="<%= link %>" <%= pub.getDisplayLinkHtmlAttributes() %>>
  <div class="slick-pub">
    <% 
      int thumbnailWidth = channel.getIntegerProperty(CarouselDataTag.THUMBNAIL_DEFAULT_WIDTH_PROP, CarouselDataTag.THUMBNAIL_DEFAUT_WIDTH);
      int thumbnailHeight = channel.getIntegerProperty(CarouselDataTag.THUMBNAIL_DEFAULT_HEIGHT_PROP, CarouselDataTag.THUMBNAIL_DEFAUT_HEIGHT);
    %>
    <% if (Util.isEmpty(imagePath)) { %>
      <jalios:thumbnail path="images/jalios/layout/article.png" width='<%= thumbnailWidth %>' height='<%= thumbnailHeight %>' />
    <% } else { %>
      <jalios:thumbnail data='<%= pub %>' width='<%= thumbnailWidth %>' height='<%= thumbnailHeight %>' />
    <% } %>
    <% if (showTitle || showDate || showAuthor) { %>
      <div class="slick-carousel-caption">
        <% if (showTitle) { %>
        <<%= titleTag %> class="slick-carousel-caption-content" data-jalios-truncate='{ "value" : <%= truncate %> }'> 
          <%= pub.getTitle(userLang, true) %>
        </<%= titleTag %>>
        <% } %>
        <% if (showDate || showAuthor) { %>
	        <div class="metadata">
            <% if (showDate) { %><span class="metadata-item metadata-item-date"><jalios:date date="<%= pub.getPdate() %>" format="dateOrTime" /></span><% } %>
            <% if (showAuthor) { %><span class="metadata-item metadata-item-author"><%= pub.getAuthor().getFullName() %></span><% } %>
	        </div>
        <% } %>
      </div>
    <% } %>  
  </div>
</a> 