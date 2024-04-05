<%@page import="com.jalios.jcmsplugin.esn.*"%>
<%@page import="com.jalios.jcmsplugin.esn.activity.*"%>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %><% 
  MemberActivityManager maMgr = MemberActivityManager.getInstance(); 
%>
<jsp:useBean id='memberActivityHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.MemberActivityHandler'>
  <jsp:setProperty name='memberActivityHandler' property='request'       value='<%= request %>' />
  <jsp:setProperty name='memberActivityHandler' property='response'      value='<%= response %>' />
  <jsp:setProperty name='memberActivityHandler' property='*' />
  <jsp:setProperty name='memberActivityHandler' property='pageSize' value="10" />
  <jsp:setProperty name='memberActivityHandler' property='activityMember' value="<%= member %>" />
  <jsp:setProperty name='memberActivityHandler' property='activityMode' value="<%= MemberActivityMode.MEMBER_ACTIVITIES %>" />
</jsp:useBean>
<%
	boolean isFollowing = !isMyProfile && esnMgr.isFollowing(loggedMember, member);
	boolean displayActivity = isAccount && (isConnected || isMyProfile || isFollowing);
	
	if (!displayActivity) {
		return;
	}
  
	memberActivityHandler.validate();

  String uniquePortletActivityId = "activity-container";
  request.setAttribute("uniquePortletActivityId", uniquePortletActivityId);
	String activityPortletId = portlet != null ? portlet.getId() : "";
	    
	String paramPrefix = PortalManager.PORTAL_ACTION+"_"+ activityPortletId +"_";
	Member photoMember = null;
	Member currentMember = null;
	
  ActivityEntryPageResult aeResult = memberActivityHandler.getActivityEntryPageResult();

	int photoSize = 0;
	if (Util.notEmpty(aeResult.getActivityEntryList())) { 
	
  Date startActivityDate = hasParameter("startActivityDate") ? new Date(Long.valueOf(getUntrustedStringParameter("startActivityDate", ""))) : null;
  Date currentDate = startActivityDate;
	String filters = null;  
	Portlet box = null;
	
	boolean activityShowComments = true;
	boolean activityShowAbstract = true;
	boolean activityShowMedia = true;
	
	jcmsContext.addCSSHeader("plugins/ESNPlugin/css/activity.css");
  jcmsContext.addJavaScript("plugins/ESNPlugin/js/activity.js");
  
  String uniqueActivityPortletId = hasParameter("portletDomId") ? getUntrustedStringParameter("portletDomId", "") : ServletUtil.generateUniqueDOMId(request, "esn-activity-portlet");
  
  boolean appendedActivity = hasParameter("appendActivity");
%>
<% if (!appendedActivity) { %>
<h2 id="profile-activity"><%= glp("jcmsplugin.esn.lbl.activity") %></h2>
  <div class="portlet-member-activity ">
  <div class="activity-container">
<% } %>
<jalios:foreach collection="<%= aeResult.getActivityEntryList() %>" 
                name="itActivityEntry" 
                type="ActivityEntry">
  <% 
    Date itDate = itActivityEntry.getLastActivityCdate();
    boolean newDay = !DateUtil.isSameDay(itDate, currentDate);
    request.setAttribute("jcmsplugin.esn.activity.activity-entry", itActivityEntry);
  %>
  
  <% if (newDay) { %>
  <% boolean isFirstDay = currentDate == null; %>
  <h3 class="activity-day-separator">
    <% if (isFirstDay && Util.notEmpty(filters)) { %>
      <jalios:icon src="jcmsplugin-esn-filter" title='jcmsplugin.esn.activity.filter' />
    <% } %>  
    <jalios:icon src="jcmsplugin-esn-date" /> <%= JcmsUtil.getFriendlyDate(itDate, DateFormat.FULL, false, userLocale, true) %>
  </h3>
  <% } %>
  <jalios:include jsp="<%= maMgr.getActivityJspPath(itActivityEntry, ActivityDisplayMode.DEFAULT) %>"/>
  <% 
    currentDate = itDate;
  %>  
</jalios:foreach>
<% if (aeResult.hasNext()) { %>
  <div class="activity-nextpage-form-wrapper" id="<%= uniqueActivityPortletId %>-ajax-inner">
    <form class="activity-nextpage-form" action="types/PortletMemberActivity/doPortletMemberActivityFullDisplayInner.jsp" method="POST">
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
  
  
  <% if (!appendedActivity) { %>
</div>
</div>
<% } %>
<%   } else { %>
<div class="row-fluid">
	<div class="alert alert-info span10 offset1">
		<%= glp("jcmsplugin.esn.activity.lbl.no-activity",member) %>
	</div>
</div>
<% } %>
