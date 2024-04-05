<%@page import="com.jalios.jcms.calendar.CalendarEventInterface"%>
<%@page import="com.jalios.jcmsplugin.esn.calendar.LegacyCalendarHelper"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doTabCalendar.jsp: start render"); }

if (!LegacyCalendarHelper.isLegacyEsnCalendarMode()) {
  // ESN should no longer provide Calendar oriented UIs
  if (logger.isTraceEnabled()) { logger.trace("doTabCalendar.jsp: nothing to render"); }
  return;
}

// ESN should still provide Calendar oriented UIs

Set<CalendarEventInterface> eventSet = esnProfileDisplayHandler.getCalendarEventSet();
if (Util.isEmpty(eventSet)) {
  if (logger.isTraceEnabled()) { logger.trace("doTabCalendar.jsp: nothing to render"); }
  return;
}
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/tabs/doTabCalendar.jsp";
String css = "member-profile-calendar profile-body-block profile-card-deck";
css += " ajax-refresh-div";
String agendaUrl = esnProfileDisplayHandler.getAgendaURL();
%>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">

  <% if (Util.notEmpty(agendaUrl)) { %>
  <div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3">
    <a class="btn btn-default btn-xs esn-action esn-action-calendar-my-agenda" href="<%= agendaUrl %>">
      <%= glp("jcmsplugin.esn.profile.lbl.goto-calendar") %>
    </a>
  </div>
  <% } %>

  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='5' size='<%= eventSet.size() %>' paramPrefix="profileEvents_" />
  <jalios:list>
    <jalios:foreach collection="<%= eventSet %>" name="event" type="CalendarEventInterface" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>"><%
    request.setAttribute("jcmsplugin.esn-profile.calendar-event", event);
    if (logger.isTraceEnabled()) { logger.trace("doTabCalendar.jsp: start render of calendar event: " + event); }
    %><jalios:include resource="esn.profile.full.event-card" /><%
    request.removeAttribute("jcmsplugin.esn-profile.calendar-event");
    if (logger.isTraceEnabled()) { logger.trace("doTabCalendar.jsp: end render of calendar event: " + event); }
    %></jalios:foreach>
  </jalios:list>
  <jalios:pager name='pagerHandler' template="pqf"/>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabCalendar.jsp: end render"); }
%>