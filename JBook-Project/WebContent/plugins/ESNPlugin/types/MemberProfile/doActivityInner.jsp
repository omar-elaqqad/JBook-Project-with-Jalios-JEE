<%@page import="com.jalios.jcmsplugin.esn.ui.ESNHTMLConstants"%><%
%><%@page import="com.jalios.jcmsplugin.esn.profile.ProfileDisplayHandler"%><%
%><%@page import="com.jalios.jcmsplugin.esn.*"%><%
%><%@page import="com.jalios.jcmsplugin.esn.activity.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doActivityInner.jsp: start render"); }

if (Util.isEmpty(request.getAttribute(ProfileDisplayHandler.HANDLER_REQUEST_ATTR))) {
  %><jalios:include jsp="plugins/ESNPlugin/types/MemberProfile/doProfileHandler.jsp" /><%
}
ProfileDisplayHandler esnProfileDisplayHandler = (ProfileDisplayHandler)request.getAttribute(ProfileDisplayHandler.HANDLER_REQUEST_ATTR);
if (esnProfileDisplayHandler == null) {
  logger.warn(MessageFormat.format("{0} no request nor ajax request handler retrieved. Exit", ProfileDisplayHandler.getLoggerPrefix(request)));
  if (logger.isTraceEnabled()) { logger.trace("doActivityInner.jsp: nothing to render"); }
  return;
}
boolean show = esnProfileDisplayHandler.validateActivity();
if (!show) {
  if (logger.isTraceEnabled()) { logger.trace("doActivityInner.jsp: nothing to render"); }
  return;
}
Member member = esnProfileDisplayHandler.getMember();
%>
<jsp:useBean id='memberActivityHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.MemberActivityHandler'>
  <jsp:setProperty name='memberActivityHandler' property='request' value='<%= request %>' />
  <jsp:setProperty name='memberActivityHandler' property='response' value='<%= response %>' />
  <jsp:setProperty name='memberActivityHandler' property='*' />
  <jsp:setProperty name='memberActivityHandler' property='pageSize' value="10" />
  <jsp:setProperty name='memberActivityHandler' property='activityMember' value="<%= member %>" />
  <jsp:setProperty name='memberActivityHandler' property='activityMode' value="<%= MemberActivityMode.MEMBER_ACTIVITIES %>" />
</jsp:useBean>
<%
memberActivityHandler.validate();

MemberActivityManager maMgr = MemberActivityManager.getInstance(); 
jcmsContext.setAjaxRequestAttribute("jcmsplugin.esn.member.id", member.getId());

String paramPrefix = PortalManager.PORTAL_ACTION+"_"+ ServletUtil.generateUniqueDOMId(request, "esn-profile") +"_";

Member photoMember = null;
Member currentMember = null;

ActivityEntryPageResult aeResult = memberActivityHandler.getActivityEntryPageResult();

int photoSize = 0;
boolean hasActivities = Util.notEmpty(aeResult.getActivityEntryList());
if (hasActivities) {
  Date startActivityDate = hasParameter("startActivityDate") ? new Date(Long.valueOf(getUntrustedStringParameter("startActivityDate", ""))) : null;
  Date currentDate = startActivityDate;
  
  boolean activityShowComments = getBooleanParameter("esn.profile.activities.show-comments", true);
  boolean activityShowAbstract = getBooleanParameter("esn.profile.activities.show-abstract", true);
  boolean activityShowMedia = getBooleanParameter("esn.profile.activities.show-media", true);
  
  String uniqueActivityPortletId = hasParameter("portletDomId") ? getUntrustedStringParameter("portletDomId", "") : ServletUtil.generateUniqueDOMId(request, "esn-activity-portlet");
  
  boolean appendedActivity = hasParameter("appendActivity");
  String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doActivityInner.jsp";
  %><div class="activity-container ajax-refresh-div" data-jalios-ajax-refresh-url='<%= refreshUrl %>'><%
    boolean isFirstDay = currentDate == null;
    if (Util.notEmpty(aeResult.getActivityEntryList())) {
      ActivityEntry firstActivity = Util.getFirst(aeResult.getActivityEntryList());
      Date firstActivityDate = firstActivity.getLastActivityCdate();
      Date previousDate = null;
      Iterator<ActivityEntry> activityIterator = aeResult.getActivityEntryList().iterator();
      while (activityIterator.hasNext()) {
        ActivityEntry itActivityEntry = activityIterator.next();
        Date itDate = itActivityEntry.getLastActivityCdate();
        boolean newDay = !DateUtil.isSameDay(itDate, currentDate);
        request.setAttribute("jcmsplugin.esn.activity.activity-entry", itActivityEntry);
        String dayLabel = JcmsUtil.getFriendlyDate(itDate, DateFormat.FULL, false, userLocale, true);
        // Always close list when previous activity date if different
        boolean closePreviousList = previousDate != null && !DateUtil.isSameDay(itDate, previousDate);
        if (closePreviousList) {
          %></div><%
        }
        if (newDay) {
          %><div role="<%= ESNHTMLConstants.HEADING_ROLE %>" class="activity-day-separator"<%
              %> aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.activity.day-separator.for-aria-label", dayLabel)) %>"<%
              %> aria-level="4"><%
            %><jalios:icon src="jcmsplugin-esn-date" alt="" /><%
            %>&nbsp;<%= dayLabel %><%
          %></div><%
        }
        boolean openList = previousDate == null || !DateUtil.isSameDay(itDate, previousDate);
        if (openList) {
          String dayAttr = firstActivityDate != null ?
              " data-jalios-activity-day='" + encodeForHTMLAttribute(new SimpleDateFormat("yyyy-MM-dd").format(itDate)) + "'" 
              : "";
          %><div role="<%= ESNHTMLConstants.LIST_ROLE %>" class="activity-day-list"<%= dayAttr %><%
              %> aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.activity.day-list.for-aria-label")) %>"><%
        }
        if (logger.isTraceEnabled()) { logger.trace("doActivityInner.jsp: start render of activity: " + itActivityEntry); }
        %><jalios:include jsp="<%= maMgr.getActivityJspPath(itActivityEntry, ActivityDisplayMode.CARDS) %>"/><%
        if (logger.isTraceEnabled()) { logger.trace("doActivityInner.jsp: end render of activity: " + itActivityEntry); }
        // Always close list when no more entries
        if (!activityIterator.hasNext()) {
          %></div><%
        }
        previousDate = itDate;
        currentDate = itDate;
        isFirstDay = false;
      } // End while loop
    } // End notEmpty
    request.removeAttribute("jcmsplugin.esn.activity.activity-entry");

    if (aeResult.hasNext()) { %>
      <div class="activity-nextpage-form-wrapper" id="<%= uniqueActivityPortletId %>-ajax-inner">
        <form class="activity-nextpage-form" action="<%= refreshUrl %>" method="POST">
          <input type="hidden" name="displayedActivityListContent" value="<%= Util.join(aeResult.getDisplayedActivityDataIdSet(), ",")   %>"/>
          <input type="hidden" name="startActivityDate" value="<%= aeResult.getStartActivityDate().getTime() %>"/>
          <input type="hidden" name="esnActivityUniqueId" value="<%= uniqueActivityPortletId %>"/>
          <input type="hidden" name="appendActivity" value="true"/>
          <button name="activityNextpageButton" type="submit" value="true"<%
               %> class="ajax-refresh no-focus activity-nextpage-button btn btn-default"<%
               %> title="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.activity.nextpage")) %>"<%
               %> data-jalios-ajax-refresh="noscroll"<%
               %> data-jalios-ajax-refresh-inner="#<%= uniqueActivityPortletId %>-ajax-inner"<%
               %> data-jalios-options='{ "params" : { "activityNextpageButton" : true}}'>
            <%= glp("jcmsplugin.esn.activity.nextpage") %>
          </button>
        </form>
      </div>
    <% } %>
    <%@ include file='/jcore/doAjaxFooter.jspf' %>
  </div><%-- EOF.activity-container --%>
<% } else { %>
  <div class="row-fluid">
    <div class="alert alert-info span10 offset1">
      <%= glp("jcmsplugin.esn.activity.lbl.no-activity",member) %>
    </div>
  </div>
<% } %>
<%
if (logger.isTraceEnabled()) { logger.trace("doActivityInner.jsp: end render"); }
%>