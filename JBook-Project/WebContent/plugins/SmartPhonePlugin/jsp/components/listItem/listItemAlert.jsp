<%@page import="com.jalios.jcms.alert.AlertAppHandler"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--
--%><%@ page import="com.jalios.jcms.alert.Alert" %><%--
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><% 

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

Data data = (Data) getIncludeObject("data", null);
Alert alert = (Alert) data;
Member author = alert.getAuthor();
String css = getIncludeString("css", "");
String cssClasses = Util.notEmpty(css) ? css + " " : "";
cssClasses += " alert-entry media list-item list-item-alert";
cssClasses += " level-" + alert.getLevel();

%>
<li class="<%= cssClasses %>">
  <a class="link" data-role="none" href="plugins/SmartPhonePlugin/jsp/core/alertDetail.jsp?alertId=<%= alert.getId() %>">
    <div class="alert-entry-wrapper">
      <% if(author != null) { %>
        <h2><jalios:memberphoto resource="memberphoto-phone" member="<%= author %>" size="<%= PhotoSize.ICON %>" />
          <%= author %>
        </h2>
      <% } %>
      <% if (Util.notEmpty((alert.getDescription()))) { %>
        <p class="abstract">
          <%= encodeForHTML(HtmlUtil.html2text(alert.getDescription())) %>
        </p>
      <% } %>
      <div class="txt-info"><jalios:date format="timeDateOrTime" date="<%= alert.getCdate() %>"/></div>
    </div>
  </a>
  <% if (channel.isDataWriteEnabled() && request.getAttribute("displayMarkReadAlertAction") != null) {
    // Button to mark the action as read. Can only be used from alertBody.jsp (list of alerts)
    Map<String, String> markAlertReadParams = new HashMap<String, String>();
    markAlertReadParams.put(AlertAppHandler.PARAM_ALERTS, alert.getId());
    markAlertReadParams.put(AlertAppHandler.OP_READ, "true");
    %><a href="#" class="ajax-refresh alert-entry-action" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/core/alertBody.jsp" data-jalios-ajax-params='<%= smartPhoneManager.getJsonString(markAlertReadParams) %>'>
      <%= glp("jcmsplugin.smartphone.lbl.alert.mark-read") %>
    </a>
  <% } else {
    Map<String, String> markAlertReadParams = new HashMap<String, String>();
    markAlertReadParams.put(AlertAppHandler.PARAM_ALERTS, alert.getId());
    markAlertReadParams.put(AlertAppHandler.OP_UNREAD, "true");
    markAlertReadParams.put("alertReadMode", "read");
  	%>
  	  <a href="#" class="ajax-refresh alert-entry-action" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/core/alertBody.jsp" data-jalios-ajax-params='<%= smartPhoneManager.getJsonString(markAlertReadParams) %>'>
      <%= glp("jcmsplugin.smartphone.lbl.alert.unread") %>
    </a>
  <% } %>
</li>