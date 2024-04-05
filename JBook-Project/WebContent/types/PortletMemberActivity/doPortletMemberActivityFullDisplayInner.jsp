<%@page import="com.jalios.jcmsplugin.esn.MemberActivityManager"%>
<%@page import="com.jalios.jcmsplugin.esn.activity.*"%><%--
 --%><%@page import="com.jalios.jcmsplugin.esn.MemberActivity"%><%--
 --%><%@ include file='/jcore/doInitPage.jspf' %><%
PortletMemberActivity   box = (PortletMemberActivity) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
if (hasParameter("boxId")) {
  box = getDataParameter("boxId", PortletMemberActivity.class);
}

if (box == null) {
  return;
}

MemberActivityManager maMgr = MemberActivityManager.getInstance();

String paramPrefix = Util.getString(request.getAttribute("jcmsplugin.virtualdesktop.service-id"), box.getId());
boolean activityShowComments = box.getBooleanFieldValue(jcmsContext, "showComments");
boolean activityShowAbstract = box.getBooleanFieldValue(jcmsContext, "showAbstract");
boolean activityShowMedia = box.getBooleanFieldValue(jcmsContext, "showMedia");
int defaultPageSize = box.getIntFieldValue(jcmsContext, "defaultPageSize");
String filters = (String)box.getFieldValue(jcmsContext, "filters");

if (Util.notEmpty(getUntrustedStringParameter("activityFilters",""))) {
  filters = getUntrustedStringParameter("activityFilters","");
  filters = filters.replace("+"," ");
}

Date startActivityDate = hasParameter("startActivityDate") ? new Date(Long.valueOf(getUntrustedStringParameter("startActivityDate", ""))) : null;
Date currentDate = startActivityDate;
Member currentMember = null;
Member photoMember = null;
int photoSize = 0;
String uniqueActivityPortletId = hasParameter("portletDomId") ? getUntrustedStringParameter("portletDomId", "") : ServletUtil.generateUniqueDOMId(request, "esn-activity-portlet");

%><%--
 --%><jsp:useBean id='memberActivityHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.MemberActivityHandler'><%--
   --%><jsp:setProperty name='memberActivityHandler' property='request'       value='<%= request %>' /><%--
   --%><jsp:setProperty name='memberActivityHandler' property='response'      value='<%= response %>' /><%--
   --%><jsp:setProperty name='memberActivityHandler' property='*' /><%--
   --%><jsp:setProperty name='memberActivityHandler' property='pageSize' value="<%= defaultPageSize %>" /><%--
   --%><jsp:setProperty name='memberActivityHandler' property='portletMemberActivityId' value="<%= box.getId() %>" /><%--
   --%><jsp:setProperty name='memberActivityHandler' property='filters' value="<%= filters %>" /><%--
 --%></jsp:useBean>
<%
memberActivityHandler.validate();
ActivityEntryPageResult aeResult = memberActivityHandler.getActivityEntryPageResult();
%><%--
--%><div class="activity-container ajax-refresh-div" data-jalios-ajax-refresh-url="types/PortletMemberActivity/doPortletMemberActivityFullDisplayInner.jsp">
  <jalios:foreach collection="<%= aeResult.getActivityEntryList() %>" type="ActivityEntry" name="itActivityEntry">
    <%
      request.setAttribute("jcmsplugin.esn.activity.activity-entry", itActivityEntry);
      Date itDate = itActivityEntry.getLastActivityCdate();
      boolean newDay = !DateUtil.isSameDay(itDate, currentDate);
    %>
    <% if (newDay) { %>
      <% boolean isFirstDay = currentDate == null; %>
      <h3 class="activity-day-separator">
        <% if (isFirstDay && Util.notEmpty(filters)) { %>
          <jalios:icon src="jcmsplugin-esn-filter" title='<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.activity.filter")) %>' />
        <% } %>  
        <jalios:icon src="jcmsplugin-esn-date" /> <%= JcmsUtil.getFriendlyDate(itDate, DateFormat.FULL, false, userLocale, true) %>
      </h3>
    <% } %>
    <jalios:include jsp="<%= maMgr.getActivityJspPath(itActivityEntry, ActivityDisplayMode.DEFAULT) %>"/>
    <% 
      currentDate = itDate;
      currentMember = itActivityEntry.getLastActivityAuthor();
    %>
  </jalios:foreach>
  
  <% if (aeResult.hasNext()) { %>
    <div class="activity-nextpage-form-wrapper" id="<%= uniqueActivityPortletId %>-ajax-inner">
      <form class="activity-nextpage-form" action="types/PortletMemberActivity/doPortletMemberActivityFullDisplayInner.jsp" method="POST">
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