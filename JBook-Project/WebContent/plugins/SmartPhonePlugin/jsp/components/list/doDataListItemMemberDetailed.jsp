<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file="/front/list/doInitDataListItem.jspf" %><%

if (Util.isEmpty(((Member)data).getPhoto())) {
  icon = "images/jalios/layout/silhouette.jpg";
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
    template="jmobile-detailed"
    text="<%= text %>"><%
  %><jalios:buffer name='LIST_ITEM_IMAGE'><%
    Member listItemMemberImage = (Member) data;
    %><jalios:memberphoto resource="memberphoto-phone" member="<%= listItemMemberImage %>" showStatus="<%= true %>" size="<%= PhotoSize.SMALL %>" link="<%= false %>" /><%
  %></jalios:buffer><%
  %><%@ include file="/front/list/doDataListItemMemberMeta.jspf" %><%
	%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doDataListItemText.jspf" %><%
  %><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doDataListItemActions.jspf" %><%
%></jalios:listItem>