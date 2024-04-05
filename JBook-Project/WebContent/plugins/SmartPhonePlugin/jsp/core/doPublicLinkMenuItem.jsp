<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><% 
Publication pub = (Publication)request.getAttribute("jcms.plugin.smartphone.fulldisplay.pub"); 

if (pub != null && pub.canBeReadBy(loggedMember) && channel.getBooleanProperty("channel.public-link.enabled", true) && pub instanceof FileDocument) {
  FileDocument doc = (FileDocument)pub;
%>
  <li>
    <a href="<%= HttpUtil.getUrlWithCSRFToken("plugins/SmartPhonePlugin/jsp/core/publicLink.jsp?docId=" + doc.getId(), request, true) %>"><jalios:icon src="permalink" /> <%= glp("ui.fo.ui.public-link") %></a>
  </li>
<% } %>
