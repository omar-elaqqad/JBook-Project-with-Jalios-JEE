<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file="/front/list/doInitDataListItem.jspf" %><%
css += " ";
%><jalios:listItem
    css="<%= css %>"
    dataAttribute="<%= dataAttribute %>"
    icon="<%= icon %>"
    link="<%= link %>"
    linkCss="<%= linkCss %>"
    linkDataAttribute="<%= linkDataAttribute %>"
    template="default"
    linkHtmlAttributes="<%= htmlAttributes %>"
    text="<%= text %>"><%
  %><jalios:buffer name="LIST_ITEM_IMAGE"><%
    %><span class="itemlist-item-image"><%
      String image = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_META, "");
      boolean useThumbnail = Util.toBoolean(request.getAttribute(DataListItemTag.USE_THUMBNAIL_REQUEST_ATTR), true);
      if (Util.isEmpty(image)) {
        if (Util.notEmpty(data.getDataImage()) && useThumbnail) {
          %><jalios:thumbnail css="is-object-fit" path="<%= data.getDataImage() %>" square="true"  width="60" height="60" /><%
        } else if (Util.notEmpty(data.getDataImage()) ) { 
          %><img src="<%= data.getDataImage() %>" alt="" /><% 
        } else {
          %><jalios:thumbnail css="is-object-fit" path="images/jalios/layout/defaultDataListItemImage.png" square="true"  width="60" height="60" /><% 
        }
      } else { 
        %><%= image %><%
      } 
    %></span><%
  %></jalios:buffer><%
  %><%@ include file="/front/list/doDataListItemMeta.jspf" %><%
  %><%@ include file="/front/list/doDataListItemActions.jspf" %><%
%></jalios:listItem>