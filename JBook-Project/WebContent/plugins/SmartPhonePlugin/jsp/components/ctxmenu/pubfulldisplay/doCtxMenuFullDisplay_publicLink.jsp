<%@ include file='/plugins/SmartPhonePlugin/jsp/components/ctxmenu/pubfulldisplay/doInitCtxMenuFullDisplay.jspf' %><%

if (!isPubFileDocument) {
  return;
}

if (!channel.getBooleanProperty("channel.public-link.enabled", true)) {
  return;
}

FileDocument doc = (FileDocument)pub;
%>
<li class="action-public-link">
  <a href="<%= HttpUtil.getUrlWithCSRFToken("plugins/SmartPhonePlugin/jsp/core/publicLink.jsp?docId=" + doc.getId(), request, true) %>"><jalios:icon src="permalink" /> <%= glp("ui.fo.ui.public-link") %></a>
</li>
