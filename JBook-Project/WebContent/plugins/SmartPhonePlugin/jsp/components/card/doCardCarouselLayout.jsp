<%@page import="com.jalios.jcmsplugin.smartphone.slick.SlickManager"%>
<%@ include file="/front/card/layout/doInitCards.jspf" %>
<div class='<%= css + " card-layout-carousel" %>'
  <% if(Util.notEmpty(request.getAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE))){ %> data-slick-config=<%= request.getAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE)%> <% } %>>
  <%= getIncludeBody() %>
</div>