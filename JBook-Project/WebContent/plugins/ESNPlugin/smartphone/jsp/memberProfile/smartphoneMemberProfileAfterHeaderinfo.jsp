<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@page import="com.jalios.jcms.calendar.CalendarEventInterface"%><%
boolean isCalendarActive = PluginManager.getInstance().isPluginActive("CalendarPlugin");

if (!isCalendarActive) {
  return;
}

Member member = getMemberParameter("id");
CalendarEventInterface currEvent = ESNManager.getInstance().getCurrentCalendarEvent(member, loggedMember);

if (currEvent != null) {
  CalendarEventInterface parentCalendarEvent = currEvent;
  if (((Data)parentCalendarEvent).getId() == null) {
    parentCalendarEvent = (CalendarEventInterface) ((Data)currEvent).getExtraInfo("PeriodicParent");
  }
  
  %><p class="info-calendar"><a href="<%= SmartPhoneManager.getInstance().getDataUrl((Data)parentCalendarEvent) %>"><jalios:icon src="jcmsplugin-esn-date" /> <%= ((Publication)currEvent).getTitle(userLang) %></a></p>
<% } %>
