<%@page import="com.jalios.jcmsplugin.esn.ui.ESNHTMLConstants"%><%
%><%@page import="com.jalios.jcmsplugin.esn.MemberActivityManager"%><%
%><%@page import="com.jalios.jcmsplugin.esn.activity.*"%><%
%><%@page import="com.jalios.jcmsplugin.esn.MemberActivity"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
PortletMemberActivity   box = (PortletMemberActivity) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
if (hasParameter("boxId")) {
  box = getDataParameter("boxId", PortletMemberActivity.class);
}

if (box == null) {
  return;
}

MemberActivityManager maMgr = MemberActivityManager.getInstance();

String paramPrefix = Util.getString(request.getAttribute("jcmsplugin.virtualdesktop.service-id"), box.getId());

int defaultPageSize = box.getIntFieldValue(jcmsContext, "defaultPageSize");
String filters = (String)box.getFieldValue(jcmsContext, "filters");

if (Util.notEmpty(getUntrustedStringParameter("activityFilters",""))) {
  filters = getUntrustedStringParameter("activityFilters","");
  filters = filters.replace("+"," ");
}

// Needed when "show more" is called
request.setAttribute("jcmsplugin.esn.activity.box.showComments", box.getBooleanFieldValue(jcmsContext, "showComments"));
request.setAttribute("jcmsplugin.esn.activity.box.showAbstract", box.getBooleanFieldValue(jcmsContext, "showAbstract"));
request.setAttribute("jcmsplugin.esn.activity.box.showMedia", box.getBooleanFieldValue(jcmsContext, "showMedia"));
  
Date startActivityDate = hasParameter("startActivityDate") ? new Date(Long.valueOf(getUntrustedStringParameter("startActivityDate", ""))) : null;
Date currentDate = startActivityDate;
Member currentMember = null;
Member photoMember = null;
int photoSize = 0;
String uniqueActivityPortletId = hasParameter("portletDomId") ? getUntrustedStringParameter("portletDomId", "") : ServletUtil.generateUniqueDOMId(request, "esn-activity-portlet");
%><jsp:useBean id='memberActivityHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.MemberActivityHandler'>
  <jsp:setProperty name='memberActivityHandler' property='request' value='<%= request %>' />
  <jsp:setProperty name='memberActivityHandler' property='response' value='<%= response %>' />
  <jsp:setProperty name='memberActivityHandler' property='*' />
  <jsp:setProperty name='memberActivityHandler' property='pageSize' value="<%= defaultPageSize %>" />
  <jsp:setProperty name='memberActivityHandler' property='portletMemberActivityId' value="<%= box.getId() %>" />
  <jsp:setProperty name='memberActivityHandler' property='filters' value="<%= filters %>" />
</jsp:useBean>
<%
memberActivityHandler.validate();
ActivityEntryPageResult aeResult = memberActivityHandler.getActivityEntryPageResult();
String refreshUrl = "types/PortletMemberActivity/doPortletMemberActivityFullDisplayInnerCards.jsp";
%><div class="activity-container ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>"><%
  boolean isFirstDay = currentDate == null;
  if (Util.notEmpty(aeResult.getActivityEntryList())) {
    ActivityEntry firstActivity = Util.getFirst(aeResult.getActivityEntryList());
    Date firstActivityDate = firstActivity.getLastActivityCdate();
    Date previousDate = null;
    Iterator<ActivityEntry> activityIterator = aeResult.getActivityEntryList().iterator();
    while (activityIterator.hasNext()) {
      ActivityEntry itActivityEntry = activityIterator.next();
      request.setAttribute("jcmsplugin.esn.activity.activity-entry", itActivityEntry);
      Date itDate = itActivityEntry.getLastActivityCdate();
      boolean newDay = !DateUtil.isSameDay(itDate, currentDate);
      boolean isToday = DateUtil.isSameDay(itDate, new Date());
      // Always close list when previous activity date if different
      boolean closePreviousList = previousDate != null && !DateUtil.isSameDay(itDate, previousDate);
      if (closePreviousList) {
        %></div><%
      }
      if (newDay && !isToday) {
        String dayLabel = JcmsUtil.getFriendlyDate(itDate, DateFormat.FULL, false, userLocale, true);
        %><div role="<%= ESNHTMLConstants.HEADING_ROLE %>" class="activity-day-separator"<%
            %> aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.activity.day-separator.for-aria-label", dayLabel)) %>"<%
            %> aria-level="3"><%
        if (isFirstDay && Util.notEmpty(filters)) {
          %><jalios:icon src="jcmsplugin-esn-filter" title='jcmsplugin.esn.activity.filter' /><%
        }
          %><jalios:icon src="jcmsplugin-esn-date" /><%
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
      %><jalios:include jsp="<%= maMgr.getActivityJspPath(itActivityEntry, ActivityDisplayMode.CARDS) %>"/><% 
      // Always close list when no more entries
      if (!activityIterator.hasNext()) {
        %></div><%
      }
      previousDate = itDate;
      currentDate = itDate;
      currentMember = itActivityEntry.getLastActivityAuthor();
      isFirstDay = false;
    } // End while loop
  } // End notEmpty

  if (aeResult.hasNext()) { %>
    <div class="activity-nextpage-form-wrapper" id="<%= uniqueActivityPortletId %>-ajax-inner">
      <form class="activity-nextpage-form" action="<%= refreshUrl %>" method="POST">
        <input type="hidden" name="displayedActivityListContent" value="<%= Util.join(aeResult.getDisplayedActivityDataIdSet(), ",")   %>"/>
        <input type="hidden" name="startActivityDate" value="<%= aeResult.getStartActivityDate().getTime() %>"/>
        <input type="hidden" name="boxId" value="<%= box.getId() %>"/>
        <input type="hidden" name="esnActivityUniqueId" value="<%= uniqueActivityPortletId %>"/>
        <input type="hidden" name="activityFilters" value="<%= filters %>"/>
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
</div>