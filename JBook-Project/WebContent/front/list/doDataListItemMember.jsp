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
    template="default"
    text="<%= text %>"><%
  %><jalios:buffer name='LIST_ITEM_IMAGE'><%
    Member listItemMemberImage = (Member) data;
    %><%@ include file="/front/list/doListItemIconMemberPhoto.jspf" %><%
  %></jalios:buffer><%
  %><%@ include file="/front/list/doDataListItemActions.jspf" %><%
%></jalios:listItem>