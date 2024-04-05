<%@page import="com.jalios.jcms.calendar.CalendarEventInterface"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

// inspired from "/plugins/ESNPlugin/jsp/activity/doActivityBodyCalendarEvent_date.jspf"
CalendarEventInterface event = esnProfileDisplayHandler.getCurrentCalendarEvent();
if (event == null) {
  return;
}

boolean displayMemberEvent = esnProfileDisplayHandler.displayMemberEvent();
if (!displayMemberEvent) {
  return;
}

CalendarEventInterface currEvent = esnProfileDisplayHandler.getCurrentCalendarEvent();
CalendarEventInterface parentCalendarEvent = esnProfileDisplayHandler.getCurrentCalendarParentEvent();
String introProp = "jcmsplugin.esn.member-profile.event-intro" + (isMyProfile ? ".me" : "");
String intro = glp(introProp, member.getFriendlyName());
%>
<div class="profile-header-item profile-event-wrapper">
  <div class="profile-event">
    <span class="profile-event-intro">
      <jalios:icon src="jcmsplugin-esn-profile-event" />
      <%= intro %>
    </span>
    
    <jalios:link data="<%= (Data) parentCalendarEvent %>" css="event-link">
      <%= ((Publication)currEvent).getTitle(userLang) %>
    </jalios:link>
  
    <jalios:buffer name="dateDetailBuffer">
    <% CalendarEventInterface obj = event; %>
    <%@ include file='/plugins/ESNPlugin/jsp/common/doESNEventDate.jspf' %>
    </jalios:buffer>
    <% if (Util.notEmpty(dateDetailBuffer.toString().trim())) { %>
      <div class="profile-event-dates">
        <%= dateDetailBuffer.toString().trim() %>
      </div>
    <% } %>
  </div>
</div>
