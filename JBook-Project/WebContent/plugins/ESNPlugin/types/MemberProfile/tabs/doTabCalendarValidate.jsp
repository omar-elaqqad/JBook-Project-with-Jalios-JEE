<%@page import="com.jalios.jcmsplugin.esn.calendar.LegacyCalendarHelper"%><%
%><%@page import="com.jalios.jcms.calendar.CalendarEventInterface"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%

if (!LegacyCalendarHelper.isLegacyEsnCalendarMode()) {
  // No longer provide legacy calendar oriented UIs
  uiTab.disable(request);
  return;  
}

// Provide calendar legacy UIs...

// If my profile, or if I am connected with
boolean showCalendar = esnProfileDisplayHandler.isMyProfile() || esnProfileDisplayHandler.isConnected();

if (showCalendar) {
  // Then only, and the calendar has something to display
  Set<CalendarEventInterface> eventSet = esnProfileDisplayHandler.getCalendarEventSet();
  showCalendar = Util.notEmpty(eventSet);
}

if (!showCalendar) {
  uiTab.disable(request);
}
%>