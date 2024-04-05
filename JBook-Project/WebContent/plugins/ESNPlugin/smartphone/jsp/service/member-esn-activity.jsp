<%@page import="com.jalios.jcmsplugin.esn.MemberActivityManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.esn.activity.*" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max",smartPhoneManager.getDefaultPageSize());

  MemberActivityManager activityMgr = MemberActivityManager.getInstance();
  ESNManager esnMgr = ESNManager.getInstance();
  
  Member mbr = (Member) request.getAttribute("com.jalios.jcmsplugin.smartphone.member");
  if (mbr == null) {
    mbr = getMemberParameter("mbrId");
  }
  
  if (mbr == null) {
    return;
  }
  %><jsp:useBean id='memberActivityHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.MemberActivityHandler'>
  <jsp:setProperty name='memberActivityHandler' property='request'       value='<%= request %>' />
  <jsp:setProperty name='memberActivityHandler' property='response'      value='<%= response %>' />
  <jsp:setProperty name='memberActivityHandler' property='*' />
  <jsp:setProperty name='memberActivityHandler' property='activityMode' value="<%= MemberActivityMode.MEMBER_ACTIVITIES %>" />
  <jsp:setProperty name='memberActivityHandler' property='activityMember' value="<%= mbr %>" />
</jsp:useBean><%
  ActivityEntryPageResult aeResult = memberActivityHandler.getActivityEntryPageResult();
  boolean displayWorkspace = true;
%>
<% if(Util.notEmpty(aeResult.getActivityEntryList())){ %>
  <jalios:foreach collection="<%= aeResult.getActivityEntryList() %>" type="ActivityEntry" name="itActivityEntry" skip="<%= skip %>" max="<%= max %>">
    <%  MemberActivity itActivity = itActivityEntry.getLastActivity(); %>
    <%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/activity/doActivityRow.jspf' %>
  </jalios:foreach>
  <% if (aeResult.hasNext()) { %>
    <form action="plugins/ESNPlugin/smartphone/jsp/service/member-esn-activity.jsp" method="POST" class="padded-content activity-pager-form-<%= mbr.getId() %>">
      <input type="hidden" name="displayedActivityListContent" value="<%= Util.join(aeResult.getDisplayedActivityDataIdSet(), ",")   %>"/>
      <input type="hidden" name="startActivityDate" value="<%= aeResult.getStartActivityDate().getTime() %>"/>
      <input type="hidden" name="mbrId" value="<%= mbr.getId() %>"/>
      <button type="submit" data-prefetch="true" data-role="button" class="ui-btn-showmore ajax-refresh ui-btn" data-jalios-ajax-target=".activity-pager-form-<%= mbr.getId() %>" value="true"><%= glp("jcmsplugin.smartphone.action.showmore") %></button>
    </form>
  <% } %>
<% } %>