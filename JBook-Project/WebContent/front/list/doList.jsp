<%@ include file="/jcore/doInitPage.jspf" %><%
String css = getIncludeString("css", "");
jcmsContext.addCSSHeader("css/jalios/core/components/list/jalios-list-item.css");
%>
<div class="itemlist-wrapper<%= Util.getString(" " + css, "") %>">
  <%= getIncludeBody() %>
</div>