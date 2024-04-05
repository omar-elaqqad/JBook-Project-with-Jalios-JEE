<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;
File imageFile = new File(channel.getRealPath(cardImage));

boolean isSmallImage = false;
try {
  BufferedImage bimg = ImageIO.read(imageFile);
  int width          = bimg.getWidth();
  int height         = bimg.getHeight();
  if (width < 360) {
    isSmallImage = true;
  }
} catch (IOException e) {
  //DO nothing
}

%>
<jalios:card css='<%= css + " card-publication" %>' link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>">
  <%= getIncludeString("CARD_TOP", "") %>
  <% if (!isSmallImage) { %>  
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
  <% } %>
  <%= getIncludeString("CARD_MIDDLE", "") %>
  <jalios:cardBlock>
    <% if (isSmallImage) { %>
      <img src="<%= cardImage %>" alt="" class="floating-card-img" />
    <% } %>
    <div class="card-title card-publication-title"><%= pub.getTitle(userLang,true) %></div>
    <% if (Util.notEmpty(pub.getAbstract())) { %>
      <%@ include file="/front/card/data/doCardPublicationAbstract.jspf" %>
    <% } %>
  </jalios:cardBlock>
  <%= getIncludeString("CARD_BOTTOM", "") %>
</jalios:card>