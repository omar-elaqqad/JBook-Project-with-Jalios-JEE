<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doInitMobileDataListItem.jspf" %><%
css += " itemlist-item-detailed-image";
%><jalios:listItem
    css="<%= css %>"
    dataAttribute="<%= dataAttribute %>"
    icon="<%= icon %>"
    link="<%= link %>"
    linkCss="<%= linkCss %>"
    linkDataAttribute="<%= linkDataAttribute %>"
    template="jmobile-detailed"
    text="<%= text %>"><%
  %><jalios:buffer name="LIST_ITEM_IMAGE"><%
    %><span class="itemlist-item-image"><%
      String image = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_META, "");
      if (Util.isEmpty(image)) {
        if (data instanceof FileDocument) {
          %><jalios:thumbnail css="is-object-fit" fileDoc="<%= (FileDocument) data %>" square="true"  width="60" height="60" /><%
        } else if (Util.notEmpty(data.getDataImage())) {
          %><jalios:thumbnail css="is-object-fit" path="<%= data.getDataImage() %>" square="true"  width="60" height="60" /><%
        } else {
          %><jalios:thumbnail css="is-object-fit" path="images/jalios/layout/defaultDataListItemImage.png" square="true"  width="60" height="60" /><% 
        }
      } else { 
        %><%= image %><%
      } 
    %></span><%
  %></jalios:buffer><%
  %><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doDataListItemText.jspf" %><%
  %><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doDataListItemMeta.jspf" %><%
  %><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doDataListItemActions.jspf" %><%
%></jalios:listItem>