<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%

Member itMember = (Member) data;
if (!canRead(loggedMember, itMember)) {
  return;
}
String cardCss = "card-member-guest-proposition ";
%>
<jalios:cardData data='<%= itMember %>' 
    template="small" 
    link='<%= link %>' 
    linkOptions='<%= linkOptions %>' 
    css='<%= cardCss %>' />