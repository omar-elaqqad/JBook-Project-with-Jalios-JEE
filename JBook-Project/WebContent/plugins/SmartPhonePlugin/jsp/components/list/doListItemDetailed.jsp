<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file="/front/list/doInitListItem.jspf" %><%
css = Util.notEmpty(css) ? (" " + css) : "";
String actionsHtml = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_ACTIONS, "");
%>
<div class="itemlist-item-detailed<%= css %>"<%
    %><%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>><%

  if (Util.notEmpty(getIncludeString(ListItemTag.BUFFER_LIST_ITEM_ACTIONS, ""))) {
    %><%= actionsHtml %><%
  }
  %><a data-enhance="false" data-role="none" class="itemlist-item-link js-ripple<%= Util.getString(" " + linkCss, "") %>"<%
      %><%= Util.notEmpty(link) ? " href=\"" + link + "\"" : "" %><%
      %><%= linkTarget != null ? " " + linkTarget.getHtmlAttribute() : "" %><%
      %><%= linkDataAttribute != null ? " " + linkDataAttribute.toString() : "" %>><%

    if (Util.notEmpty(getIncludeString(ListItemTag.BUFFER_LIST_ITEM_IMAGE, ""))) {
      %><%= getIncludeString(ListItemTag.BUFFER_LIST_ITEM_IMAGE, "") %><%
    } else {
      if (Util.notEmpty(icon)) {
        %><span class="itemlist-item-icon"><jalios:icon src="<%= icon %>" /></span><%
      }
    }
    %>
    <div class="itemlist-item-body">
      <div class="itemlist-item-text"><%= getIncludeString("LIST_ITEM_TEXT_PREPEND", "") %><%= text %><%= getIncludeString("LIST_ITEM_TEXT_APPEND", "") %></div>
      <% if (Util.notEmpty(getIncludeString(ListItemTag.BUFFER_LIST_ITEM_META, ""))) { %>
        <div class="itemlist-item-meta" >
          <%= getIncludeString("LIST_ITEM_META_PREPEND", "") %><%= getIncludeString(ListItemTag.BUFFER_LIST_ITEM_META, "") %><%= getIncludeString("LIST_ITEM_META_APPEND", "") %>
        </div>
      <% } %>
    </div>
  </a>
</div>