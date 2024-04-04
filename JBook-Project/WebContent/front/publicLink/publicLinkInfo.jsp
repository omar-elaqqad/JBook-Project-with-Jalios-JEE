<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.publiclink.*" %><%
%><%

PublicLink publicLink = getDataParameter("id", PublicLink.class);
if (publicLink == null || !publicLink.canBeReadBy(loggedMember)) {
  sendForbidden(request, response);
  return;
}
String tab = getStringEnumParameter("tab", "content", "content", "downloads");
boolean isDownloadsTab = "downloads".equals(tab);
boolean isContentTab = !isDownloadsTab;

String accessUrl = publicLink.getAccessUrl();
String linkName = publicLink.getLinkName(userLang);
String expiryDateStr = publicLink.getExpiryDateAsString(userLocale);
%>

<jalios:modal title="ui.fo.public-link-info.title"
              url="front/publicLink/publicLinkInfo.jsp"
              css="modal-lg public-link-info">
  
  <%-- Nav tabs --%>
  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
    <li class='<%= isContentTab ? "active" : "" %>'><a href="#content" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.fo.public-link.info.tab.content") %></a></li>
    <li class='<%= isDownloadsTab ? "active" : "" %>'><a href="#downloads" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.fo.public-link.info.tab.downloads") %> (<%= publicLink.getDownloadCount() %>)</a></li>
  </ul>
  
  <%-- Tab panes --%>
  <div class="tab-content">
    <%@ include file='/front/publicLink/publicLinkInfo_content.jspf' %>
    <%@ include file='/front/publicLink/publicLinkInfo_downloads.jspf' %>
  </div>


  <%-- Buttons --%>
  <jalios:buffer name="MODAL_BUTTONS">
  
    <%@ include file='/front/publicLink/doPublicLinkCopy.jspf' %>

    <a class="btn btn-default" role=button" href="mailto:?subject=<%= publicLink.getMailSubject(userLang) %>&amp;body=<%=  publicLink.getMailBody(userLang, userLocale) %>"><%= glp("ui.fo.public-link.btn.send-mail") %></a>
    <button class="btn btn-primary" data-dismiss="modal"><%= glp("ui.com.btn.close") %></button>
  </jalios:buffer>

</jalios:modal>






