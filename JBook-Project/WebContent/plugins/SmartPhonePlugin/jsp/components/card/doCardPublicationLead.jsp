<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;
%>
<jalios:card resource="card.jmobile.lead" css='<%= css + " card-publication" %>' link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>">
  <%= getIncludeString("CARD_TOP", "") %>
  <div class="card-img-wrapper">
    <figure class="image">
      <% 
        if (Util.isEmpty(cardImage)) { 
          cardImage = "plugins/SmartPhonePlugin/images/defaultCardImage.png"; 
        }
      %>
      <img src="<%= cardImage %>" alt="" />
    </figure>
  </div>
  <%= getIncludeString("CARD_MIDDLE", "") %>
  <jalios:cardBlock css="card-block-title">
    <div class="card-title card-publication-title"><%= pub.getTitle(userLang,true) %></div>
  </jalios:cardBlock>
  <%= getIncludeString("CARD_BOTTOM", "") %>
</jalios:card>