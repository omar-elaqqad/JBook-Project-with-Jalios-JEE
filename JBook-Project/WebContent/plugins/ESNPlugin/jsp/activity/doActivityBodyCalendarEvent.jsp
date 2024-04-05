<%@page import="com.jalios.jcmsplugin.calendar.external.ExternalCalendarEvent"%>
<%@page import="com.jalios.jcmsplugin.calendar.CalendarUtil"%>
<%@page import="com.jalios.jcms.calendar.CalendarEventInterface"%>
<%@page import="com.jalios.jcmsplugin.esn.activity.ActivityEntry"%>
<%@ include file='/jcore/doInitPage.jspf' %><% 
ActivityEntry activityEntry = (ActivityEntry) request.getAttribute("jcmsplugin.esn.activity.activity-entry");
CalendarEventInterface event = null;

if (activityEntry == null) {
  event = (CalendarEventInterface) getDataParameter("eventId");
} else {
  event = (CalendarEventInterface) activityEntry.getActivityData();
}

if (event == null) {
  return;
}

CalendarEventInterface obj = event;

boolean isDirectAttendee = (loggedMember == null || event.getAttendingMemberSet() == null) ?false : event.getAttendingMemberSet().contains(loggedMember);
boolean isDataWriteEnabled = channel.isDataWriteEnabled();
boolean isPeriodicalEvent = CalendarUtil.isPeriodicEvent(event);
boolean isAction = false;

DateFormat dayFormat = new SimpleDateFormat(glp("jcmsplugin.calendar.day-format"),userLocale);
DateFormat hourFormat = new SimpleDateFormat(glp("jcmsplugin.calendar.time-format"),userLocale);

Date startDate = event.getStartDate();
Date endDate = event.getEndDate();

//manage participate action
CalendarUtil.manageAction(request, event, loggedMember, isDirectAttendee);

CalendarEventInterface parentCalendarEvent = event;
if(((Data)event).getId() == null){
  parentCalendarEvent = (CalendarEventInterface) ((Data)event).getExtraInfo(CalendarUtil.PERIODIC_PARENT);
}

boolean oldEvent = (!isPeriodicalEvent) &&  startDate!= null && startDate.getTime() < System.currentTimeMillis();
oldEvent &= endDate!= null && endDate.getTime() < System.currentTimeMillis();


Set<Member> acceptedSet = CalendarUtil.getAcceptedAttendees(parentCalendarEvent, false);
Set<Member> declinedSet = CalendarUtil.getDeclinedAttendees(parentCalendarEvent, false);
Set<Member> pendingSet = CalendarUtil.getPendingAttendees(parentCalendarEvent, false);
Set<Member> contactSet = CalendarUtil.getContactAttendees(parentCalendarEvent);

boolean isExternalEvent = event instanceof ExternalCalendarEvent || !(event instanceof CalendarEvent);

boolean isPrivate = false;
if ((Publication)obj == null || !((Publication)obj).canBeReadBy(loggedMember)){
  isPrivate = true;
}

boolean isExternal = obj instanceof ExternalCalendarEvent;
boolean isAccepted = Util.notEmpty(acceptedSet);

boolean isTodayPub = obj instanceof CalendarEvent ? DateUtil.isSameDay(((CalendarEvent)obj).getPdate(), new Date()) : false;
boolean isActionActivity = activityEntry != null ? activityEntry.getLastActivity().isActionActivity() : false;
boolean isUpdateActivity = activityEntry != null ? activityEntry.getLastActivity().isUpdateActivity() : false;
boolean hasTodayComments = activityEntry != null ? activityEntry.hasTodayComments() : false;

boolean showAttendees = getBooleanParameter("showAttendees", false);

String calId = ((Data) event).getId();
if(calId == null){
  calId = ((Data) ((Data)event).getExtraInfo(CalendarUtil.PERIODIC_PARENT)).getId();
}
String refreshUrl = "plugins/ESNPlugin/jsp/activity/doActivityBodyCalendarEvent.jsp";
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="media activity-event-body activity-body-item activity-toggler<%= !isTodayPub && (isActionActivity && !hasTodayComments) ? " hide" : ""%>">
    <div class="pull-left">
      <jalios:link data="<%= (Data) event %>" css="activity-event-date-link">
        <div class="activity-event-date activity-event-item<%= oldEvent ? " activity-event-date-old" : "" %>">
          <div class="activity-event-date-header">
            <%= new SimpleDateFormat("EEEEE", userLocale).format(event.getStartDate()) %>
          </div>
          <div class="activity-event-date-body">
            <div class="activity-event-date-day">
              <%= new SimpleDateFormat("dd", userLocale).format(event.getStartDate()) %>
            </div>
            <div class="activity-event-date-day-name">
              <%= new SimpleDateFormat("MMMM", userLocale).format(event.getStartDate()) %>
            </div>
          </div>
        </div>
      </jalios:link>
    </div>
    <div class="media-body">
      <%@ include file='/plugins/ESNPlugin/jsp/activity/doActivityBodyCalendarEvent_metas.jspf' %>
      <jalios:wiki css="activity-abstract activity-event-item"><%= event.getDescription(userLang) %></jalios:wiki>
      <%@ include file='/plugins/ESNPlugin/jsp/activity/doActivityBodyCalendarEvent_participate.jspf' %>
    </div>
  </div>
</div>