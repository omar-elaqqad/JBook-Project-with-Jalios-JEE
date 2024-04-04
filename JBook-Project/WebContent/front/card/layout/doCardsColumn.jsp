<%@ include file="/front/card/layout/doInitCards.jspf" %><%
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-layout-masonry.css");
%>
<div class='<%= css + " card-columns" %>'>
  <%= getIncludeBody() %>
</div>