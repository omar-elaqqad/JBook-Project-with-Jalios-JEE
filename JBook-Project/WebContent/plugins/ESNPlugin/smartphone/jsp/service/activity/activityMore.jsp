<%@page import="com.jalios.jcmsplugin.esn.MemberActivityManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@page import="com.jalios.jcmsplugin.esn.activity.*"%><%--  
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max",smartPhoneManager.getDefaultPageSize());

  Workspace ws = (Workspace) request.getAttribute("jcms.plugin.smartphone.workspace");
  if (hasParameter("wsId")) {
    ws = getWorkspaceParameter("wsId");
  }

  %>
  <jsp:useBean id='memberActivityHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.MemberActivityHandler'>
    <jsp:setProperty name='memberActivityHandler' property='request'       value='<%= request %>' />
    <jsp:setProperty name='memberActivityHandler' property='response'      value='<%= response %>' />
    <jsp:setProperty name='memberActivityHandler' property='*' />
    <jsp:setProperty name='memberActivityHandler' property='pageSize' value="<%= max %>" />
    <jsp:setProperty name='memberActivityHandler' property='activityMode' value="<%= MemberActivityMode.MEMBER_WORKSPACE_ACTIVITIES %>" />
    <jsp:setProperty name='memberActivityHandler' property='activityWorkspace' value="<%= ws != null ? ws : null %>" />
  </jsp:useBean>
  <%
  
  MemberActivityManager maMgr = MemberActivityManager.getInstance();
  ActivityEntryPageResult aeResult = memberActivityHandler.getActivityEntryPageResult();
  
  String uniqueId = ServletUtil.generateUniqueDOMId(request, "esn-activity-service");
  
  boolean displayWorkspace = true;
%>
<jalios:foreach collection="<%= aeResult.getActivityEntryList() %>" type="ActivityEntry" name="itActivityEntry" skip="<%= skip %>" max="<%= max %>">
  <%  MemberActivity itActivity = itActivityEntry.getLastActivity(); %>
  <%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/activity/doActivityRow.jspf' %>
</jalios:foreach>
<% if (aeResult.hasNext()) { %>
  <form action="plugins/ESNPlugin/smartphone/jsp/service/activity/activityMore.jsp" method="POST" class="padded-content activity-pager-form<%= uniqueId %>">
    <input type="hidden" name="displayedActivityListContent" value="<%= Util.join(aeResult.getDisplayedActivityDataIdSet(), ",")   %>"/>
    <input type="hidden" name="startActivityDate" value="<%= aeResult.getStartActivityDate().getTime() %>"/>
    <% if (ws != null) { %>
      <input type="hidden" name="wsId" value="<%= ws.getId() %>"/>
    <% } %>
    <button type="submit" data-prefetch="true" class="ui-btn-showmore ajax-refresh ui-btn " data-jalios-ajax-target=".activity-pager-form<%= uniqueId %>" value="true"><%= glp("jcmsplugin.smartphone.action.showmore") %></button>
  </form>
<% } %>