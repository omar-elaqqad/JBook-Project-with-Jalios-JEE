<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file="/front/list/doInitDataListItem.jspf" %><%

if (Util.isEmpty(((Member)data).getPhoto())) {
  icon = channel.getProperty(JcmsConstants.DEFAULT_PHOTO_PROP);
} else {
  icon = ((Member)data).getPhoto();
}
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
  %><jalios:buffer name='LIST_ITEM_IMAGE'><%
    Member listItemMemberImage = (Member) data;
    %><%@ include file="/front/list/doListItemIconMemberPhoto.jspf" %><%
  %></jalios:buffer><%
  %><%@ include file="/front/list/doDataListItemMemberMeta.jspf" %><%
  %><%@ include file="/front/list/doDataListItemActions.jspf" %><%
%></jalios:listItem>