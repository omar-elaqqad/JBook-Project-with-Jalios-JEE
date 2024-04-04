<%@ include file="/front/card/data/layout/doInitCardsData.jspf" %><%
  css += " card-inline-layout";
%>
<jalios:cards css="<%= css %>" mode="<%= CardsDisplayMode.INLINE %>">
  <jalios:foreach name="itCardData" type="Data" collection="<%= collection %>">
    <jalios:cardData titleTag="<%= titleTag %>" template="<%= cardTemplate %>" data="<%= itCardData %>" />
  </jalios:foreach>
</jalios:cards>