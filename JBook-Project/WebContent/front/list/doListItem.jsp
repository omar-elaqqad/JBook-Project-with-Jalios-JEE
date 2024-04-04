<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file="/front/list/doInitListItem.jspf" %><%
css = Util.notEmpty(css) ? (" " + css) : "";
%><div class="itemlist-item<%= css %>"<%
    %><%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>><%

  String actions = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_ACTIONS, "");
  if (Util.notEmpty(actions)) {
    %><%= actions %><%
  } 
  %><a class="itemlist-item-link js-ripple<%= Util.getString(" " + linkCss, "") %>"<%
      %><%= Util.notEmpty(link) ? " href=\"" + link + "\"" : "" %><%
      %><%= linkTarget != null ? " " + linkTarget.getHtmlAttribute() : "" %><%
      %><%= Util.notEmpty(linkHtmlAttributes) ? " " + linkHtmlAttributes : "" %><%
      %><%= linkDataAttribute != null ? " " + linkDataAttribute.toString() : "" %>><%
    String image = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_IMAGE, "");
    if (Util.notEmpty(image)) {
      %><%= image %><%
    } else if (Util.notEmpty(icon)) {
      %><span class="itemlist-item-icon"><jalios:icon alt="<%= iconAlt %>" src="<%= icon %>" /></span><% 
    }
    %><span class="itemlist-item-text"><%= text %></span><%
    String meta = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_META, "");
    if (Util.notEmpty(meta)) {
      %><div class="itemlist-item-right" ><%= meta %></div><%
    }
  %></a>
</div>