<%@ include file="/jcore/doInitPage.jspf" %>
<%
WebAssetsUtils.addScrollbarWebAssets(jcmsContext);
jcmsContext.addJavaScript("js/jalios/core/scrollbar/jalios-scrollbar.js");
jcmsContext.addJavaScript("js/jalios/core/scrollbar/jalios-scrollbar-init.js");

DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);
%>
<div class="jalios-scrollbar <%= getIncludeString("css", "") %>" <%= dataAttribute != null ? dataAttribute.toString() : "" %>>
  <%= getIncludeBody() %>
</div>