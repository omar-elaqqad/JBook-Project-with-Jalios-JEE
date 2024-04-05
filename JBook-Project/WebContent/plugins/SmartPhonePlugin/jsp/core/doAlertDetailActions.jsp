<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ page import='com.jalios.jcms.alert.*' %><%

Alert alert = (Alert) channel.getData(getDataIdParameter("alertId"));
if (alert == null) {
  return;
}

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.AlertHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name="formHandler" property="alerts" value="<%= new String[]{alert.getId()} %>" /><%
%></jsp:useBean><%

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

if (formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
  if(hasParameter("opRead") || hasParameter("opReadAll") || hasParameter("opUnread")) {
    %>
  <script>
    // Trigger refresh of alert badge
    jQuery.jalios.smartPhone.Alerts.updateAlertCount();
  </script>
  <%
  }
}
%>
<% if (channel.isDataWriteEnabled()) { %>
<div class="ajax-refresh-wrapper">
  <% if (!alert.isRead()) {
    Map<String, String> markAlertReadParams = new HashMap<String, String>();
    markAlertReadParams.put("alertId", alert.getId());
    markAlertReadParams.put(AlertAppHandler.OP_READ, "true");
    %><a data-role="button" data-theme="f" href="#" class="ajax-refresh" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/core/doAlertDetailActions.jsp" data-jalios-ajax-params='<%= smartPhoneManager.getJsonString(markAlertReadParams) %>'>
      <%= glp("alert.list.lbl.mark-as-read") %>
    </a>
  <% } else {
    Map<String, String> markAlertReadParams = new HashMap<String, String>();
    markAlertReadParams.put("alertId", alert.getId());
    markAlertReadParams.put(AlertAppHandler.OP_UNREAD, "true");
    %><a data-role="button" data-theme="f" href="#" class="ajax-refresh" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/core/doAlertDetailActions.jsp" data-jalios-ajax-params='<%= smartPhoneManager.getJsonString(markAlertReadParams) %>'>
      <%= glp("alert.list.lbl.mark-as-not-read") %>
    </a>
  <% } %>
</div>
<% } %>
