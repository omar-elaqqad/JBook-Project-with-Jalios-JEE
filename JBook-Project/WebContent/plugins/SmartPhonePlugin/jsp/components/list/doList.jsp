<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
String css = getIncludeString("css", "");
%>
<ul class="itemlist-wrapper <%= Util.getString(" " + css, "") %>" data-role="listview">
	<%= getIncludeBody() %>
</ul>