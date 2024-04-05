<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

Member member = getMemberParameter("id");

if (member == null) {
  member = (Member) request.getAttribute("com.jalios.jcmsplugin.smartphone.member");
}
boolean isContact = member.isContact();
String display = getUntrustedStringParameter("display","activity");
boolean displayActivity = display.equals("activity");
boolean displayAgenda = display.equals("agenda");

boolean isCalendarActive = PluginManager.getInstance().isPluginActive("CalendarPlugin");

if (!isContact && isCalendarActive) { %>
  <div data-role="navbar" data-inset="false">
    <ul>
      <li><a data-transition="none" href="plugins/SmartPhonePlugin/jsp/core/member.jsp?id=<%= member.getId() %>&amp;display=activity"<%= displayActivity ?  " class=\"ui-btn-active\"" : "" %>><%= glp("jcmsplugin.esn.smartphone.lbl.member.activity") %></a></li>
      <li><a data-transition="none" href="plugins/SmartPhonePlugin/jsp/core/member.jsp?id=<%= member.getId() %>&amp;display=agenda"<%= displayAgenda ?  " class=\"ui-btn-active\"" : "" %>><%= glp("jcmsplugin.smartphone.lbl.member.agenda") %></a></li>
    </ul>
  </div><!-- /navbar -->
<% } %>
