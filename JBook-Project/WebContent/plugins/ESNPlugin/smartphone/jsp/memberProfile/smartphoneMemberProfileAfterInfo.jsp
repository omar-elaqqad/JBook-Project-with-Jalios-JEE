<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

String display = getUntrustedStringParameter("display","activity");
boolean displayActivity = display.equals("activity");
boolean displayAgenda = display.equals("agenda");
Member member = getMemberParameter("id");

if (displayActivity) { %>
  <div class="member-profile-container member-profile-activity">
    <jalios:include jsp="plugins/ESNPlugin/smartphone/jsp/service/member-esn-activity.jsp"/>
  </div>
<% } else if (displayAgenda) { %>
  <%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/member-esn-agenda.jspf' %>
<% } %>
