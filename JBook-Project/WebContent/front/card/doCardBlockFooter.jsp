<%@ include file="/jcore/doInitPage.jspf" %><% 
String css = "card-block card-block-footer " + getIncludeString("css", "");
DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);
%>
<div class="<%= css.trim() %>"<%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>>
  <%= getIncludeBody() %>
</div>