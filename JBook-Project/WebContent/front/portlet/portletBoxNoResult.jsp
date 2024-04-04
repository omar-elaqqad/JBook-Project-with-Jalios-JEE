<%@ include file="/jcore/doInitPage.jspf" %><%
String text = getIncludeString("text", "ui.com.lbl.portlet-box-no-result");
String icon = getIncludeString("icon", "portlet-box-no-result");
jcmsContext.addCSSHeader("css/jalios/core/portlet/jalios-portlet-no-result.css");
%>
<div class="box-no-result">
  <%= getIncludeString("PORTLET_BOX_NORESULT_CONTENT_TOP", "") %>
  <jalios:icon css="no-result-icon" src='<%= icon %>' />
  <p><%= glp(text) %></p>
  <%= getIncludeString("PORTLET_BOX_NORESULT_CONTENT_BOTTOM", "") %>
</div>