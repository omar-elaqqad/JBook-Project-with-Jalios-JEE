<%@ include file="/front/card/data/layout/doInitCardsData.jspf" %><%
  css += " card-columns";
%>
<jalios:cards css="<%= css %>" mode="<%= CardsDisplayMode.COLUMNS %>">
  <jalios:foreach name="itCardData" type="Data" collection="<%= collection %>">
    <jalios:cardData titleTag="<%= titleTag %>" template="<%= cardTemplate %>" data="<%= itCardData %>" />
  </jalios:foreach>
</jalios:cards>