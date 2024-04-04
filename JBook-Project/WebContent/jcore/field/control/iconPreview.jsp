<%@ include file='/jcore/doInitPage.jspf' %><%
String iconPreviewValue = (String) request.getAttribute("iconPreviewValue");
if (Util.isEmpty(iconPreviewValue)) {
  iconPreviewValue = getUntrustedStringParameter("iconPreviewValue", "");
}
%>
<span class="icon-preview"><jalios:icon src="<%= encodeForHTMLAttribute(iconPreviewValue) %>" /></span>