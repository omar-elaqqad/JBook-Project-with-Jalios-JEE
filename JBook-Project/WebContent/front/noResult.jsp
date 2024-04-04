<%@ include file="/jcore/doInitPage.jspf" %><%
String text = getIncludeString("text", "ui.com.lbl.no-result");
String icon = getIncludeString("icon", "no-result");
jcmsContext.addCSSHeader("css/jalios/core/components/jalios-no-result.css");
%>
<div class="no-result">
  <%= getIncludeString("NORESULT_CONTENT_TOP", "") %>
  <jalios:icon css="no-result-icon" src='<%= icon %>' />
  <p><%= glp(text) %></p>
  <%= getIncludeString("NORESULT_CONTENT_BOTTOM", "") %>
</div>