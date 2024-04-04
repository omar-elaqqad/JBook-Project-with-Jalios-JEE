<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/front/list/doInitDataListItem.jspf" %><%
%><jalios:listItem 
    css="<%= css %>"
    dataAttribute="<%= dataAttribute %>"
    icon="<%= icon %>"
    link="<%= link %>"
    linkCss="<%= linkCss %>"
    linkDataAttribute="<%= linkDataAttribute %>"
    linkHtmlAttributes="<%= htmlAttributes %>"
    linkTarget="<%= linkTarget %>"
    template="detailed"
    text="<%= text %>"><%
  %><%@ include file="/front/list/doDataListItemImage.jspf" %><%
  %><%@ include file="/front/list/doDataListItemDetailedMeta.jspf" %><%
  %><%@ include file="/front/list/doDataListItemActions.jspf" %><%
%></jalios:listItem>