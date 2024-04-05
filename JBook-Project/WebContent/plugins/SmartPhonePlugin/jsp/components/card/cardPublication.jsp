<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;
%>
<jalios:cardData data="<%= pub  %>" css="card-old" template="jmobile" />