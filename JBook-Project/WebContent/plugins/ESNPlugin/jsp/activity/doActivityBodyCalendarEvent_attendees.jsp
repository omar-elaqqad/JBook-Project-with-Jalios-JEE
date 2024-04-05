<%@page import="com.jalios.jcmsplugin.calendar.external.*"%><%
%><%@page import="com.jalios.jcmsplugin.calendar.*"%><%
%><%@page import="com.jalios.jcms.calendar.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

CalendarEventInterface event = (CalendarEventInterface) request.getAttribute("jcmsplugin.esn-activity.calendar-event");
if (event == null) {
  event = (CalendarEventInterface) getDataParameter("eventId");
}
if (event == null) {
  return;
}

CalendarEventInterface obj = event;
boolean isPeriodicalEvent = CalendarUtil.isPeriodicEvent(event);
Date startDate = event.getStartDate();
Date endDate = event.getEndDate();

boolean showAttendees = getBooleanParameter("showAttendees", false);
String calId = ((Data) event).getId();
if (calId == null) {
  calId = ((Data) ((Data)event).getExtraInfo(CalendarUtil.PERIODIC_PARENT)).getId();
}

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

String refreshUrl = "plugins/ESNPlugin/jsp/activity/doActivityBodyCalendarEvent_attendees.jsp";
%>
<% if (!isPrivate &&  !isExternal && Util.notEmpty(obj.getAllAttendingMembersSet())) { %>
  <div class="activity-event-attendees activity-event-item ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
    <% if (!showAttendees) { %>
    <a href="#" title="<%= glp("jcmsplugin.esn.activity-card.event.show-attendees") %>" onclick="return false" 
        data-jalios-action="ajax-refresh" 
        data-jalios-options='{ "params" : { "showAttendees" : true , "eventId" : "<%= calId %>" }}'>
    <% } %>
      <jalios:icon src="jcmsplugin-esn-activity-calendar-attendees" />
      <span class="activity-event-attendees-attending"><%= glp("jcmsplugin.esn.activity-card.event-attending", Util.getSize(acceptedSet)) %></span>
      <span class="activity-event-attendees-all"><%= glp("jcmsplugin.esn.activity-card.event-invited", Util.getSize(obj.getAllAttendingMembersSet())) %></span>
    <% if (!showAttendees) { %>
    </a>
    <% } %>
  </div>
  
  <% if (showAttendees) { %>
  <div class="activity-event-attendees activity-event-item">
    <ul class="list-inline attendeesWrapper"><li>
      <% if (isAccepted || Util.notEmpty(pendingSet)) { %>
      <table class="attendees-table">       
        <% if (isAccepted) { %>
        <tr  class="last-line">
          <td class='nowrap'><%=glp("jcmsplugin.calendar.confirmed-title")%> </td>      
          <td class='data'>         
            <%
            if (Util.notEmpty(acceptedSet)) {
              for (Member mbr : acceptedSet) {
                %><div class="attendee-div">
                <jalios:memberphoto member="<%= mbr %>" size="<%= PhotoSize.ICON %>"/>
                </div>
                <%
              }
            }
            %>
          </td>
        </tr>
        <% } %>
        <%if(Util.notEmpty(pendingSet)){%>
        <tr class="<%= isAccepted ? "" : "last-line" %>">
          <td class='nowrap'><%= isAccepted ? glp("jcmsplugin.calendar.pending-title") : "" %> </td>     
          <td class='data'>
            <%
            if (Util.notEmpty(pendingSet)) {
              for (Member mbr : pendingSet) {
                %><div class="attendee-div">
                  <jalios:memberphoto member="<%= mbr %>" size="<%= PhotoSize.ICON %>"/>
                </div>
              <%
              }
            }
            %>
          </td>
        </tr>
        <% } %>
      </table>
      <% } %>      
    </li>
  </ul>
  </div>
  <% } %>
<% } %>
