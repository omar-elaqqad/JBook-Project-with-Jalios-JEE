<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhonePublicationManager.PublicationActionItem"%><%
%><%@page import="com.jalios.jcms.alert.AlertQueryBuilder.ReadMode"%><%
%><%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
%><%@ page import='com.jalios.jcms.alert.*' %><%

Alert alert = (Alert) channel.getData(getDataIdParameter("alertId"));
MemberAlertSettings memberAlertSettings = AlertManager.getInstance().getMemberAlertSettings(loggedMember);
if (alert == null) {
  return;
}

if (!JcmsUtil.isSameId(loggedMember, alert.getRecipient())) {
  sendRedirect("plugins/SmartPhonePlugin/jsp/core/forbidden.jsp");
  return;
}

if(memberAlertSettings.isTopbarAutoRead(alert.getLevel())){
  alert.setRead(true);
  alert.performUpdate(loggedMember);
}
%>
<div id="alert-detail" data-role="page">
  <div data-role="navbar">
    <ul> 
      <li><a data-transition="none" href="plugins/SmartPhonePlugin/jsp/core/alert.jsp?<%= AlertAppHandler.PARAM_ALERT_READ_MODE %>=<%= ReadMode.NOT_READ.getValue() %>"><%= glp("jcmsplugin.smartphone.lbl.alert.unread") %></a></li>
      <li><a data-transition="none" href="plugins/SmartPhonePlugin/jsp/core/alert.jsp?<%= AlertAppHandler.PARAM_ALERT_READ_MODE %>=<%= ReadMode.READ.getValue() %>"><%= glp("jcmsplugin.smartphone.lbl.alert.read") %></a></li>
    </ul>
  </div><!-- /navbar -->
  <div data-role="content">
    <div class="card alert-full level-<%= alert.getLevel() %>">
      <div class="card-item alert-header media">
        <div class="alert-header-meta">
        
          <% if (alert.getAuthor() != null) { %>
            <div class="clickable media-left" data-jalios-link="<%= "plugins/SmartPhonePlugin/jsp/core/data.jsp?id=" + alert.getAuthor().getId() %>">
              <jalios:memberphoto resource="memberphoto-phone" member="<%= alert.getAuthor() %>" size="<%= PhotoSize.TINY %>" />
            </div>
          <% } %>
          <div class="alert-meta media-body">
            <div class="alert-description"><%= smartPhoneManager.replaceDesktopUrls(alert.getDescription()) %></div>
          </div>
        </div>
        <% if (alert.hasMessage()) { %>
          <div class="message-content alert-message">
            <span class="tail"></span>
            <span class="tail-border"></span>
            <% String messageMarkup = alert.getMessageMarkup(); %>
            <% if (AlertBuilder.HTML_MARKUP.equals(messageMarkup)) { %>
              <jalios:wysiwyg><%= alert.getMessage() %></jalios:wysiwyg>
            <% } else if (AlertBuilder.WIKI_MARKUP.equals(messageMarkup)) { %>
                <jalios:wiki attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>"><%= alert.getMessage() %></jalios:wiki>
            <% } %>
            <div class="text-info">
              <%= JcmsUtil.getFriendlyDate(alert.getCdate(), DateFormat.SHORT, true, userLocale) %>
            </div>
          </div>
        <% } %>
      </div>
    </div>
    <%
    boolean isPublicationAlert = alert.getData() instanceof Publication;
    isPublicationAlert  = false;
    if (isPublicationAlert) {
      Publication pub = (Publication) alert.getData();
      SmartPhonePublicationManager pubManager = SmartPhonePublicationManager.getInstance();
      Set<PublicationActionItem> actionItems = pubManager.getActionItems(pub, "jcmplugin.smartphone.alert-publication.action-item.");
      request.setAttribute("jcms.plugin.smartphone.pub", pub);
      %>
      <div class="actions-wrapper" data-jalios-data-id="<%= pub.getId() %>">
        <% for (PublicationActionItem item : actionItems) { %>
          <jalios:include jsp="<%= item.getUrl() %>" />
        <% } %>
      </div>
    <% } %><%-- EOF.isPublicationAlert --%>
    <div class="alert-detail-actions">
      <% if (channel.isDataWriteEnabled()) { %>
        <jalios:include jsp='plugins/SmartPhonePlugin/jsp/core/doAlertDetailActions.jsp' />
      <% } %>
      <% if (isPublicationAlert) { %>
        <% Publication pub = (Publication) alert.getData(); %>
        <a data-role="button" data-theme="f" href="<%= smartPhoneManager.getDataUrl(pub)%>"><%
          %><%= glp("jcmsplugin.smartphone.lbl.alert.access-publication") %><%
        %></a>
      <% } %><%-- EOF.isPublicationAlert --%>
    </div>
  </div><%-- EOF .alert- --%>
</div><!-- /page -->
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>