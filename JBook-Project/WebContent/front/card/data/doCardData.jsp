<%@ include file="/front/card/data/doInitCardData.jspf" %>
<jalios:card css='<%= css + " card-data" %>' link="<%= link %>" linkOptions="<%= linkOptions %>">
  <%= getIncludeString("CARD_TOP", "") %>
  <jalios:cardImage src="<%= cardImage %>" alt="" thumbnailWidth="<%= channel.getIntegerProperty(CardDataTag.THUMBNAIL_DEFAULT_WIDTH_PROP, CardImageTag.THUMBNAIL_DEFAUT_WIDTH) %>" thumbnailHeight="<%= channel.getIntegerProperty(CardDataTag.THUMBNAIL_DEFAULT_HEIGHT_PROP, CardImageTag.THUMBNAIL_DEFAUT_HEIGHT) %>"/>
  <jalios:cardBlock>
    <<%= titleTag %> class="card-title"><%= data.getDataName(userLang) %></<%= titleTag %>>
  </jalios:cardBlock>
  <%= getIncludeString("CARD_BOTTOM", "") %>
</jalios:card>