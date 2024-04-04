<%@ include file="/jcore/doInitPage.jspf" %><%

jcmsContext.addJavaScript("js/jalios/core/components/jalios-card-flipper.js");

String src = getIncludeString("src", "");
String css = "card-flipper " + getIncludeString("css", "");
DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);
%>
<span title="<%= encodeForHTMLAttribute(glp("ui.card.flipper.title")) %>" class="<%= css.trim() %>"<%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>><jalios:icon src="<%= src %>"/></span>