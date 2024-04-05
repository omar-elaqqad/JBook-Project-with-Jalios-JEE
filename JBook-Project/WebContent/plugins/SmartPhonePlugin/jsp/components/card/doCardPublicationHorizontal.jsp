<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;
%>
<jalios:card css='<%= css + " card-publication is-image-squared card-publication is-horizontal" %>' link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>" resource="card.jmobile.horizontal">
  <div class="card-img-wrapper">
    <figure class="image is-squared">
      <% 
        if (Util.isEmpty(cardImage)) { 
          cardImage = "plugins/SmartPhonePlugin/images/defaultCardImage.png"; 
        }
      %>
      <img src="<%= cardImage %>" alt="" />
    </figure>
  </div>

  <jalios:cardBlock>
    <div class="card-title"><%= pub.getTitle(userLang,true) %></div>
  </jalios:cardBlock>
  <%= getIncludeString("CARD_BOTTOM", "") %>
</jalios:card>



  
