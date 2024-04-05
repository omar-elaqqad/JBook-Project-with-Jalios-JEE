<%@page import="com.jalios.jcmsplugin.calendar.ExcludeDeclinedAttendeeSelector"%>
<%@page import="com.jalios.jcmsplugin.calendar.InitPluginChannelListener"%>
<%@page import="com.jalios.jcmsplugin.calendar.PortletCalendarHandler"%>
<%@page import="com.jalios.jcmsplugin.calendar.CalendarUtil"%>
<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<%@ page import="com.jalios.jcms.calendar.*" %>
<% if (isMyProfile || isConnected) { %><%   
  Date startDate = new Date();
  Date endDate = new Date(startDate.getTime() + 3 * JaliosConstants.MILLIS_IN_ONE_MONTH);
  Set<CalendarEventInterface> tmpEventSet = CalendarUtil.getCalendarEventSet(member, loggedMember,startDate, endDate );   
  TreeSet<CalendarEventInterface> eventSet = new TreeSet<CalendarEventInterface>(CalendarUtil.getStartDateComparator());
  eventSet.addAll(tmpEventSet);     
  CalendarUtil.manageDummyPeriodicalEvent(startDate, endDate,eventSet, userLocale);
  
  Portlet portlet = channel.getData(Portlet.class, InitPluginChannelListener.SIDEBAR_PORTLET_VIRTUAL_ID);
  
  String fullDisplayPath = "";
 
  if (portlet != null) {
    //Retrieve calendar full display url for this member
    Calendar startCalendar = Calendar.getInstance();
    startCalendar.setTime(DateUtil.getDayStartDate(new Date(), userLocale));
    startCalendar.set(Calendar.HOUR_OF_DAY, ((PortletCalendar) portlet).getDayStartHour());
    startCalendar.set(Calendar.DAY_OF_WEEK, startCalendar.getFirstDayOfWeek());
    String[] names= {"portlet",PortalManager.getActionParam(portlet, PortletCalendarHandler.CAL_DATE), PortalManager.getActionParam(portlet, PortletCalendarHandler.CAL_MODE), PortalManager.getActionParam(portlet, PortletCalendarHandler.CAL_DAY_NUMBER), CalendarUtil.DISPLAY_FILTER_ATTRIBUTE, CalendarUtil.DISPLAY_FILTER_ADD_SCHEDULE, "portal", CalendarUtil.DISPLAY_FILTER_MEMBER};
    String[] values = {portlet.getId(), Long.toString(startCalendar.getTimeInMillis()) ,PortletCalendarHandler.WORK_WEEK_MODE_STR, "5", CalendarUtil.DISPLAY_EVENTS_OF, "on", PortalManager.getDefaultPortal().getId(), member.getId()};
    fullDisplayPath = ServletUtil.getUrlWithUpdatedParams(channel.getUrl(), ServletUtil.getOrderedParameterMap(request) , names, values, new String[] {"jsp"}, false);
  }
  
  JcmsUtil.applyDataSelector(eventSet, new ExcludeDeclinedAttendeeSelector(member));
  
%><% if (Util.notEmpty(eventSet)) { %>
    <div class="esn-component esn-component-calendar">
    <h2 class="esn-component-header" id="profile-calendar">
      <% if (isMyProfile && loggedMember.canPublish(CalendarEvent.class, workspace)) { %>
      <span class="right">
        <a href="plugins/CalendarPlugin/jsp/editCalendarEvent.jsp" class="modal"><jalios:icon src="add" /></a>
      </span>
      <% } %>
      <% if (Util.notEmpty(fullDisplayPath)) { %>
        <a href="<%= encodeForHTMLAttribute(fullDisplayPath) %>"><%= glp("jcmsplugin.esn.lbl.calendar") %></a>
      <% } else { %>
        <%= glp("jcmsplugin.esn.lbl.calendar") %>
      <% } %>
    </h2>
    <div class="esn-component-body">
    <ul class="item-box">
      <jalios:pager name='eventPagerHandler' declare='true' action='init' pageSize='5' size='<%= eventSet.size() %>'/>
      <jalios:foreach collection="<%= eventSet %>" name="event" type="CalendarEventInterface" max="<%= eventPagerHandler.getPageSize() %>" skip="<%= eventPagerHandler.getStart() %>">  
      <li>
        <% Date itemDate = event.getStartDate(); %>
        <%@ include file="/jcore/doItemBoxDate.jspf" %>  
      <% if (!DateUtil.isSameDay(event.getStartDate(), event.getEndDate())) { %>
        - <% itemDate = event.getEndDate(); %>
        <%@ include file="/jcore/doItemBoxDate.jspf" %>  
      <% } %>            
        <%
          CalendarEventInterface parentCalendarEvent = event;
          if(((Data)parentCalendarEvent).getId() == null){
            parentCalendarEvent = (CalendarEventInterface) ((Data)event).getExtraInfo(CalendarUtil.PERIODIC_PARENT);
          }
        %>
        <%= event.getDataIconHtml(userLang,null) %>&nbsp;<jalios:link data="<%= (Data) parentCalendarEvent %>" />
      </li>
      </jalios:foreach>
    </ul>
    </div>
  </div>
  <jalios:pager name='eventPagerHandler' template="pqf"/>
  <% } %>
<% } %>