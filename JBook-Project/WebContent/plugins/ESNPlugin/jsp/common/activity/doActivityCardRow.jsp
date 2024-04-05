<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcmsplugin.esn.*" %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%@page import="com.jalios.jcmsplugin.esn.activity.*" %>
<%@ page import="com.jalios.jcms.vote.*" %>
<%@ include file='/jcore/doInitPage.jspf' %><%

ActivityEntry itActivityEntry = (ActivityEntry) request.getAttribute("jcmsplugin.esn.activity.activity-entry");
//Portlet portlet = (Portlet) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
PortalElement portlet = (PortalElement) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
PortletMemberActivity box = null;
if (portlet instanceof PortletMemberActivity) {
  box = (PortletMemberActivity) portlet;
}

if (hasParameter("boxId")) {
  box = getDataParameter("boxId", PortletMemberActivity.class);
}

if (itActivityEntry == null) {
  return;
}

boolean activityShowComments = request.getAttribute("jcmsplugin.esn.activity.box.showComments") != null ? 
    Util.toBoolean(request.getAttribute("jcmsplugin.esn.activity.box.showComments"), box.getShowComments()) : box != null ? box.getBooleanFieldValue(jcmsContext, "showComments") : true;
boolean activityShowAbstract = request.getAttribute("jcmsplugin.esn.activity.box.showAbstract") != null ? 
    Util.toBoolean(request.getAttribute("jcmsplugin.esn.activity.box.showAbstract"), box.getShowAbstract()) : box != null ? box.getBooleanFieldValue(jcmsContext, "showAbstract") : true;
boolean activityShowMedia = request.getAttribute("jcmsplugin.esn.activity.box.showMedia") != null ?
    Util.toBoolean(request.getAttribute("jcmsplugin.esn.activity.box.showMedia"), box.getShowMedia()) : box != null ? box.getBooleanFieldValue(jcmsContext, "showMedia") : true;

String boxId = box != null ? box.getId() : "";

MemberActivityManager maMgr = MemberActivityManager.getInstance();

Date itDate = itActivityEntry.getLastActivityCdate();

List<MemberActivity> previousActivityList = itActivityEntry.getPreviousActivityList();
Data activityData = itActivityEntry.getActivityData();
Member lastActivityAuthor = itActivityEntry.getLastActivityAuthor();
Member publicationAuthor = itActivityEntry.getPublicationAuthor();
MemberActivity itActivity = itActivityEntry.getLastActivity();

boolean hasTodayComments = itActivityEntry.hasTodayComments();
boolean isMicroBlogging = itActivityEntry.isMicroBlogging();
boolean isDBCommentActivity = itActivity.isDBCommentActivity();
boolean isActionActivity = itActivity.isActionActivity();
boolean isUpdateActivity = itActivity.isUpdateActivity();

DBCommentManager dbCommentMgr = DBCommentManager.getInstance();
Date activityDate = itActivityEntry.getLastActivityMdate();

boolean isNestedActivity = (Util.getSize(previousActivityList) > 0 || isDBCommentActivity) && itActivityEntry.isPublication() && !isUpdateActivity;
boolean hasAbstract = itActivityEntry.getPublication() != null && Util.notEmpty(itActivityEntry.getPublication().getAbstract(userLang)) && !isMicroBlogging;

boolean isToday = DateUtil.isToday(activityDate); 
boolean isYesterday = DateUtil.isYesterday(activityDate);

boolean isCommentable = activityData != null && activityData instanceof Publication && dbCommentMgr.isCommentable((Publication)activityData);
int dbCommentCount = activityData instanceof Publication ? DBCommentManager.getInstance().getDBCommentCount((Publication)activityData, loggedMember) : 0;
boolean displayCommentToggler = dbCommentCount > 0 && activityShowComments && isCommentable;
boolean displayDedicatedMedia = itActivityEntry.hasDedicatedMediaTemplate();

if (isMicroBlogging) {
  WebAssetsUtils.addWebAssets(jcmsContext, "jalios-lightbox");
}
%>
<div role="listitem" id="<%= itActivity.getId() %>"<%
      %> class="activity activity-id-<%= itActivity.getId() %> activity-<%= itActivity.getProperty().replaceAll("\\.", "-")  %>"<%
      %><%= itActivityEntry.getPublication() != null ? " data-jalios-pub-id=\"" + itActivityEntry.getPublication().getId() + "\"" : "" %>>
  <%@ include file='/plugins/ESNPlugin/jsp/common/activity/doActivityCardRow_menu.jspf' %>
  <div class="activity-row-container">
  <%@ include file='/plugins/ESNPlugin/jsp/common/activity/doActivityCardRow_header.jspf' %>
  <%@ include file='/plugins/ESNPlugin/jsp/common/activity/doActivityCardRow_body.jspf' %>
  <%@ include file='/plugins/ESNPlugin/jsp/common/activity/doActivityCardRow_footer.jspf' %>
  </div>
  <% if (activityData != null && activityShowComments) { %>
    <% request.setAttribute("jcmsplugin.esn.activityData",activityData); %>
    <% request.setAttribute("jcmsplugin.esn.itActivityEntry",itActivityEntry); %>
    <jalios:include jsp='/plugins/ESNPlugin/jsp/common/doActivityComment.jsp'/> 
  <% } %>
</div>

