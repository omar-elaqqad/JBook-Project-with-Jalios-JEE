<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doInitMobileDataListItem.jspf" %><%
css = Util.notEmpty(css.trim()) ? (" " + css.trim() + " large-abstract") : "";
jcmsContext.addJavaScript("js/lib/clamp/clamp.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-truncate.js");
String dataImage = data.getDataImage(userLang);
%>
<div data-icon="false" data-enhance="false" class="itemlist-item-detailed itemlist-item-detailed-image itemlist-item-detailed-image-abstract<%= css %>"<%
    %><%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>><%

  %><a class="itemlist-item-link js-ripple<%= Util.getString(" " + linkCss, "") %>"<%
      %><%= Util.notEmpty(link) ? " href=\"" + link + "\"" : "" %><%
      %><%= linkDataAttribute != null ? " " + linkDataAttribute.toString() : "" %>><%
    if (Util.isEmpty(getIncludeString(ListItemTag.BUFFER_LIST_ITEM_IMAGE, ""))) {
      %><span class="itemlist-item-image"><%
      if (data instanceof FileDocument) {
        %><jalios:thumbnail css="is-object-fit" fileDoc="<%= (FileDocument) data %>" square="true"  width="60" height="60" /><%
      } else if (Util.notEmpty(data.getDataImage())) {
        %><jalios:thumbnail css="is-object-fit" path="<%= dataImage %>" square="true"  width="200" height="200" /><%
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
      %><div class="itemlist-item-meta">
        <%@ include file="/front/list/doDataListItemDate.jspf" %>
        &middot; <%= data.getAuthor() != null && data.getAuthor().canBeReadBy(loggedMember) ? data.getAuthor().getFullName() : glp("ui.com.lbl.restricted-mbr")  %>
      </div>
    </div>
  </a>            
</div>