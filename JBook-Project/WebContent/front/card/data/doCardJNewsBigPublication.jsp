<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;
Boolean enableDropdown = (Boolean) request.getAttribute("enableDropdown");
int thumbnailWidth = channel.getIntegerProperty("jcms.jnews.image.default-thumbnail-width", 575);
int thumbnailHeight = channel.getIntegerProperty("jcms.jnews.image.default-thumbnail-height", 575);
Boolean canUseDefaultImage = (Boolean) request.getAttribute("canUseDefaultImage");
String defaultImage = channel.getProperty("jcms.jnews.image.default.article-placeholder-large", "images/jalios/layout/articlePlaceholderLarge.png");
String img = Boolean.TRUE.equals(canUseDefaultImage) ? defaultImage : pub.getDataImage(userLang, true);
%>
<jalios:card css='<%= css + " card-publication" %>' dataAttribute="<%= dataAttribute %>">
  <%= getIncludeString("CARD_TOP", "") %>
  <div class="item big-item">
    <% 
      if (Util.notEmpty(enableDropdown) && enableDropdown.booleanValue()) { 
        %><div class="dropdown-big-item"><jalios:include jsp="/front/card/data/layout/jnews/doDropdownMenuIcons.jsp" /></div><% 
      } 
    %>
    <a class="nounderline-jnews" href="<%= link %>">
      <jalios:thumbnail css='img-big-item' path='<%= img %>' width='<%= thumbnailWidth %>' height='<%= thumbnailHeight %>' alt=''>
        <jalios:thumbnail css='img-big-item' path='<%= defaultImage %>' width='<%= thumbnailWidth %>' height='<%= thumbnailHeight %>' alt='' />
      </jalios:thumbnail>
      <div class="content-big-item">
        <div class="title-item"><%=pub.getTitle(userLang, true)%></div>
        <span class="meta-color-jnews2"><jalios:date date="<%= pub.getPdate() != null ? pub.getPdate() : pub.getCdate() %>" format="short" /></span>      
      </div>
    </a>
  </div>   
  <%= getIncludeString("CARD_BOTTOM", "") %>          
</jalios:card>