<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;
%>
<jalios:card css='<%= css + " card-publication is-horizontal" %>' link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>">
  <jalios:cardImage squareImage="<%= true %>" src="<%= cardImage %>" alt="" thumbnailWidth="<%= channel.getIntegerProperty(CardDataTag.THUMBNAIL_DEFAULT_WIDTH_PROP, CardImageTag.THUMBNAIL_DEFAUT_WIDTH) %>" thumbnailHeight="<%= channel.getIntegerProperty(CardDataTag.THUMBNAIL_DEFAULT_WIDTH_PROP, CardImageTag.THUMBNAIL_DEFAUT_WIDTH) %>"/>
  <div class="card-content">
	  <jalios:cardBlock>
	    <<%= titleTag %> class="card-title card-publication-title"><%= pub.getTitle(userLang,true) %></<%= titleTag %>>
	    <% if (Util.notEmpty(pub.getAbstract())) { %>
	      <%@ include file="/front/card/data/doCardPublicationAbstract.jspf" %>
	    <% } %>
	  </jalios:cardBlock>
	  <%= getIncludeString("CARD_BOTTOM", "") %>
  </div>
</jalios:card>