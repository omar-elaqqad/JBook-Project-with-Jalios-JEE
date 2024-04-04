<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file="/front/list/doInitDataListItem.jspf" %><%
css = Util.notEmpty(css.trim()) ? (" " + css.trim() + " large-abstract") : " large-abstract";
jcmsContext.addJavaScript("js/lib/clamp/clamp.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-truncate.js");
String dataImage = data.getDataImage(userLang);
%>
<div class="itemlist-item-detailed itemlist-item-detailed-image itemlist-item-detailed-image-abstract<%= css %>"<%
    %><%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>><%

  %><a class="itemlist-item-link js-ripple<%= Util.getString(" " + linkCss, "") %>"<%
      %><%= Util.notEmpty(link) ? " href=\"" + link + "\"" : "" %><%
      %><%= Util.notEmpty(htmlAttributes) ? " " + htmlAttributes : "" %><%
      %><%= linkTarget != null ? " " + linkTarget.getHtmlAttribute() : "" %><%
      %><%= linkDataAttribute != null ? " " + linkDataAttribute.toString() : "" %>><%
      boolean useThumbnail = Util.toBoolean(request.getAttribute(DataListItemTag.USE_THUMBNAIL_REQUEST_ATTR), true);

    if (Util.isEmpty(getIncludeString(ListItemTag.BUFFER_LIST_ITEM_IMAGE, ""))) {
      %><span class="itemlist-item-image itemlist-item-image-large"><%
      if (Util.notEmpty(dataImage) && useThumbnail) {
        %><jalios:thumbnail css="is-object-fit" path="<%= dataImage %>" square="true"  width="200" height="200" /><%
      } else if (Util.notEmpty(dataImage) && useThumbnail) {
        %><img src="<%= data.getDataImage() %>" alt="" /><% 
      } else {
        %><jalios:thumbnail css="is-object-fit" path="images/jalios/layout/defaultDataListItemImage.png" square="true" width="200" height="200" /><%
      }
      %></span><%
    } else {
      %><%= getIncludeString(ListItemTag.BUFFER_LIST_ITEM_IMAGE, "") %><%
    }
    %><div class="itemlist-item-body">
      <div class="itemlist-item-text"><%= text %></div><%
        if (data instanceof Publication) {
        String pubAbstract = ((Publication)data).getAbstractAsText(userLocale);
        if (Util.notEmpty(pubAbstract)) {
          %><div class="itemlist-item-abstract" data-jalios-truncate='{"value":2}'>
           <jalios:truncate advancedHtml="<%= true %>" length="200"><%= encodeForHTML(pubAbstract) %></jalios:truncate>
	       </div><%
        }
      }
      %><% if (Util.toBoolean(request.getAttribute(DataListItemTag.DISPLAY_META_REQUEST_ATTR), true)) { %><div class="itemlist-item-meta">
        <%@ include file="/front/list/doDataListItemDate.jspf" %>
        <% if (Util.toBoolean(getIncludeObject("showDate", null),true)) { %>&middot;<% } %> <%= data.getAuthor() != null && data.getAuthor().canBeReadBy(loggedMember) ? data.getAuthor().getFullName() : glp("ui.com.lbl.restricted-mbr")  %>
      </div><% } %>
    </div>
  </a>
  <% if (canWorkOn && showActions) { %>
    <jalios:edit css="itemlist-item-actions ctx-caret-white" data="<%= data %>" ctxEdit="true"><jalios:icon src="itemlist-action" /></jalios:edit>
  <% } %>             
</div>