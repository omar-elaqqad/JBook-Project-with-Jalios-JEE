<%@page import="com.jalios.io.ImageUtil"%>
<%@page import="java.awt.Dimension"%>
<%@page import="javax.imageio.ImageIO"%>
<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;
File imageFile = cardImage != null ? new File(channel.getRealPath(cardImage)) : null;
boolean isImage = ImageUtil.isImage(imageFile);

boolean isSmallImage = false;
if (isImage) {
  Dimension imageDimension =  ImageUtil.getDimension(imageFile);
  isSmallImage |= (imageDimension != null) && imageDimension.getWidth() < 360;
}
%>
<jalios:card css='<%= css + " card-publication" %>' link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>">
  <%= getIncludeString("CARD_TOP", "") %>
  <% if (!isSmallImage) { %>  
	  <div class="card-img-wrapper">
	    <figure class="image">
	      <% 
	        if (Util.isEmpty(cardImage) || !isImage) { 
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
  <jalios:cardBlock css="card-detailed-footer">
    <span class="card-detailed-author"><jalios:memberphoto size="<%= PhotoSize.ICON %>" member="<%= pub.getAuthor() %>" resource="memberphoto-phone"/><span class="author-name"><%= pub.getAuthor().getFullName() %></span></span><span class="card-detailed-date"><jalios:date date="<%= pub.getPdate() %>" format="dateOrTime"/></span>
  </jalios:cardBlock>  
  <%= getIncludeString("CARD_BOTTOM", "") %>
</jalios:card>