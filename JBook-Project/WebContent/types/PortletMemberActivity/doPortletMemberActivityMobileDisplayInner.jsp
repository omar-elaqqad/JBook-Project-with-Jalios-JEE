<%@page import="com.jalios.jcmsplugin.esn.MemberActivityManager"%><%
%><%@page import="com.jalios.jcmsplugin.esn.activity.*"%><%  
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%  
%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><%
PortletMemberActivity box = (PortletMemberActivity) portlet;
if (hasParameter("boxId")) {
  box = getDataParameter("boxId", PortletMemberActivity.class);
}

if (box == null) {
  return;
}

boolean showMore = getBooleanParameter("showMore", false);

  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  
  boolean activityShowComments = box.getBooleanFieldValue(jcmsContext, "showComments");
  boolean activityShowAbstract = box.getBooleanFieldValue(jcmsContext, "showAbstract");
  boolean activityShowMedia = box.getBooleanFieldValue(jcmsContext, "showMedia");
  int defaultPageSize = box.getIntFieldValue(jcmsContext, "defaultPageSize");
  String filters = (String)box.getFieldValue(jcmsContext, "filters");

  String uniqueActivityPortletId = hasParameter("portletDomId") ? getUntrustedStringParameter("portletDomId", "") : ServletUtil.generateUniqueDOMId(request, "esn-activity-portlet");
  %>
  
  <jsp:useBean id='memberActivityHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.MemberActivityHandler'>
    <jsp:setProperty name='memberActivityHandler' property='request'       value='<%= request %>' />
    <jsp:setProperty name='memberActivityHandler' property='response'      value='<%= response %>' />
    <jsp:setProperty name='memberActivityHandler' property='*' />
    <jsp:setProperty name='memberActivityHandler' property='pageSize' value="<%= defaultPageSize %>" />
    <jsp:setProperty name='memberActivityHandler' property='portletMemberActivityId' value="<%= box.getId() %>" />
    <jsp:setProperty name='memberActivityHandler' property='activityWorkspace' value="<%= workspace %>" />
    <jsp:setProperty name='memberActivityHandler' property='workspace' value="<%= workspace %>" />
  </jsp:useBean>
  <%
  MemberActivityManager maMgr = MemberActivityManager.getInstance();
  ActivityEntryPageResult aeResult = memberActivityHandler.getActivityEntryPageResult();
%>
<% if (!showMore) { %>
<div class="activity-cards">
<% } %>
  <jalios:foreach collection="<%= aeResult.getActivityEntryList() %>" type="ActivityEntry" name="itActivityEntry">
    <%  MemberActivity itActivity = itActivityEntry.getLastActivity(); %>
    <%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/activity/doActivityRow.jspf' %>
  </jalios:foreach>
<% if (!showMore) { %>
</div>
<% } %>
<% if (aeResult.hasNext()) { %>
  <form action="types/PortletMemberActivity/doPortletMemberActivityMobileDisplayInner.jsp" method="POST" class="<%= uniqueActivityPortletId %> activity-pager-form">
    <input type="hidden" name="displayedActivityListContent" value="<%= Util.join(aeResult.getDisplayedActivityDataIdSet(), ",")   %>"/>
    <input type="hidden" name="startActivityDate" value="<%= aeResult.getStartActivityDate().getTime() %>"/>
    <input type="hidden" name="boxId" value="<%= box.getId() %>"/>
    <input type="hidden" name="esnActivityUniqueId" value="<%= uniqueActivityPortletId %>"/>
    <input type="hidden" name="activityFilters" value="<%= filters %>"/>
    <input type="hidden" name="showMore" value="true"/>
    <% if (workspace != null) { %>
      <input type="hidden" name="workspaceId" value="<%= workspace.getId() %>"/>
    <% } %>
    <button type="submit" data-prefetch="true" class="ui-btn-showmore ajax-refresh ui-btn" data-jalios-ajax-target=".<%= uniqueActivityPortletId %>.activity-pager-form" value="true"><%= glp("jcmsplugin.smartphone.action.showmore") %></button>
  </form>
<% } %>