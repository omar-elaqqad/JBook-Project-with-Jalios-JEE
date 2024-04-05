<%@page import="com.jalios.jcmsplugin.esn.calendar.LegacyCalendarHelper"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/actions/doInitAction.jspf' %><%

if (!isLogged || !channel.isDataWriteEnabled()) {
  logger.warn("doActionCreateEventWith.jsp: Not logged? Or no data writes?");
  return;
}
if (!LegacyCalendarHelper.isLegacyEsnCalendarMode()) {
  // No CalendarPlugin available, or JCalendar is available
  // Disable the TAB
  return;  
}

jcmsContext.addJavaScript("plugins/CalendarPlugin/js/portletCalendar.js");

if (!isMyProfile) {
 boolean canPublishCalendarEvent = false;
  try{
    Class<?> calendarEventClazz = channel.getClass("generated.CalendarEvent");
    if (calendarEventClazz != null) {
      canPublishCalendarEvent = loggedMember.canPublish(calendarEventClazz, workspace);
    }
  }catch (Exception ex) {
    // silent
  }
  if (canPublishCalendarEvent && !workspace.isClosed()) {
    actionLabel = glp("jcmsplugin.esn.profile.action.create-event-with");
    %><a href="#" class="esn-profile-action esn-profile-action-create-event-with modal"<%
        %> onclick="jQuery.jcmsplugin.calendar.portletCalendar.invite('<%= member.getId()%>'); return false;"<%
        %> role="button" tabindex="0"><%
    %><%= actionLabel %></a><%
  }
} else {
  String editExternalUrl = MessageFormat.format("plugins/CalendarPlugin/jsp/external/editExternalCalendarConfiguration.jsp?{0}={1}", 
      "modalAction", 
      "member"
  );
  actionLabel = glp("jcmsplugin.calendar.external.manage-my-external-calendars");
  %><a class="esn-profile-action esn-profile-action-edit-external-calendar modal"<%
      %> href="<%= editExternalUrl %>"<%
      %> role="button" tabindex="0"><%
    %><%= actionLabel %><%
  %></a><%
} 
%>