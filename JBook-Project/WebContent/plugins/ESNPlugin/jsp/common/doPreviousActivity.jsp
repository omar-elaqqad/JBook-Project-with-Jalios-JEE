<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %><%
  MemberActivityManager maMgr = MemberActivityManager.getInstance(); 
%>
<%  
	Data activityData = (Data) request.getAttribute("jcmsplugin.esn.activityData");
	
	if (activityData == null) {
	   activityData = getDataParameter("activityDataId");
	}
	
	if (activityData == null) {
	   return;
	}
	
  List<MemberActivity> previousActivityList = (List<MemberActivity>) request.getAttribute("jcmsplugin.esn.listMA." + activityData.getId());
	
	if (Util.isEmpty(previousActivityList)) {
    previousActivityList = (List<MemberActivity>) jcmsContext.getAjaxRequestAttribute("jcmsplugin.esn.listMA." + activityData.getId());
	}
	
	if (Util.isEmpty(previousActivityList) || activityData == null) {
	    return;
	}
	
	jcmsContext.setAjaxRequestAttribute("jcmsplugin.esn.listMA." + activityData.getId(),new ArrayList(previousActivityList));
	
	String boxId = (String) request.getAttribute("jcmsplugin.esn.boxId");
	if (Util.isEmpty(boxId)) {
	   boxId = (String) jcmsContext.getAjaxRequestAttribute("jcmsplugin.esn.boxId");
	}
  jcmsContext.setAjaxRequestAttribute("jcmsplugin.esn.boxId",boxId);
	
	int previousActivityCount = Util.getSize(previousActivityList);
	
  boolean hasTodayActivity = DateUtil.isSameDay(Util.getFirst(previousActivityList).getCdate(),new Date());
	boolean showAll = getBooleanParameter("showAll",false);
	boolean displayShowMoreButton = (previousActivityCount > 0 && !hasTodayActivity) || (previousActivityCount > 2 && hasTodayActivity);
  int max =  showAll ? previousActivityCount : 2;
%>
<div class="activity-history ajax-refresh-div" >
  <% if (hasTodayActivity || showAll) { %>
  <ul>       
	<jalios:foreach collection="<%= previousActivityList %>" type="MemberActivity" name="itMA" skip="0" max="<%= max %>">
		<%
		  //Skip creation activities in this list
      boolean isToday = DateUtil.isSameDay(itMA.getCdate(), new Date());
      boolean isDBCommentActivity = itMA.isDBCommentActivity();
      String itMADate = JcmsUtil.getFriendlyDate(itMA.getCdate(), DateFormat.SHORT, isToday, userLocale, true);
		%>
    <li><jalios:memberphoto member="<%= itMA.getAuthor() %>" size="<%= PhotoSize.ICON %>" /> <%= itMA.getHtmlIcon(userLang)  %> <%= itMA.getAuthor() != null ? itMA.getAuthor().getDisplayLink(userLocale) : "" %> <%= itMA.getDescription(userLocale) %> - 
    <% if (isDBCommentActivity) { %>
      <jalios:link data="<%= itMA.getData() %>" css="date-link"><%= itMADate %></jalios:link>
    <% } else { %>
      <%= itMADate %>
    <% } %>
    </li>
  </jalios:foreach>
  </ul>
  <% } %>
  <% if (showAll && displayShowMoreButton) { %>
    <a href="plugins/ESNPlugin/jsp/common/doPreviousActivity.jsp?activityDataId=<%= activityData.getId() %>&amp;showAll=false" onclick="return false;" class="ajax-refresh previous-show"><%= glp("jcmsplugin.esn.activity.hide-previous-activity") %></a>
  <% } else if (displayShowMoreButton) { %>
    <a href="plugins/ESNPlugin/jsp/common/doPreviousActivity.jsp?activityDataId=<%= activityData.getId() %>&amp;showAll=true" onclick="return false;" class="ajax-refresh previous-show"><%= glp("jcmsplugin.esn.activity.show-previous-activity") %></a>
  <% } %>
</div>