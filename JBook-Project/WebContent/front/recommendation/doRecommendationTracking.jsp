<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@page import="com.jalios.jcms.tracking.*"%><%
%><%@ page import="com.jalios.jcms.recommendation.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/front/recommendation/doRecommendationFunc.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

String recommendationIdParam = RecommendationHandler.RECOMMENDATION_ID_PARAM;
Recommendation recommendation = getDataParameter(recommendationIdParam, Recommendation.class);
RecommendationManager recoMgr = RecommendationManager.getInstance();

// Check loggedMember is author of the recommendation
if (!recoMgr.canAccessRecommendationReaderTracker(recommendation, loggedMember) || recoMgr.isRecommendationReaderTrackerAnonymized()) {
  sendForbidden(request, response);
  return;
}

jcmsContext.addJavaScript("js/jalios/ux/jalios-recommendation-modal.js");
jcmsContext.addCSSHeader("css/jalios/ux/jalios-reader-tracker.css");

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.recommendation.RecommendationReaderTrackerHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true'/><%
%></jsp:useBean><%

formHandler.validate();

String recommendedDataIdParam = RecommendationHandler.RECOMMENDED_DATA_ID_PARAM;
String recoModalTabParam = RecommendationHandler.RECOMMENDATION_MODAL_TAB_PARAM;
String recoModalTabTracking = RecommendationHandler.RECOMMENDATION_MODAL_TAB_TRACKING;
String trackingFilterGroupParam = ReaderTrackerQueryHandler.INCLUDE_GROUP_PARAM;
String trackingFilterReadAckParam = ReaderTrackerQueryHandler.READACK_PARAM;
String trackingFilterReadAcked = ReaderTrackerQueryHandler.READACK_ACKED;
String trackingFilterReadNotAcked = ReaderTrackerQueryHandler.READACK_NOT_ACKED;

ReaderTrackerManager readerMgr = ReaderTrackerManager.getInstance();
boolean readerTrackerAnonymized = readerMgr.isReaderTrackerAnonymized();
Publication recommendedPub = (Publication) recommendation.getData();

boolean isAuthor = JcmsUtil.isSameId(recommendation.getAuthor(), loggedMember);
// List<ReaderTracker> readerTrackerSet = recoMgr.getRecommendationReaderTrackingMemberSet(recommendation);

// JCMS-8703 - filter by group
Group recipientGroupFilter = getGroupParameter(trackingFilterGroupParam);

// JCMS-8704 - filter by read ack
boolean isReadAckAllowed = ReaderTrackerManager.getInstance().isReadAckAllowed(recommendedPub.getClass());
boolean showReadAckFilter = false;
if (isReadAckAllowed) {
  showReadAckFilter = recommendedPub.getReadAck();
}
String trackerReadAckFilter = getStringEnumParameter(trackingFilterReadAckParam, null, new String[]{
    trackingFilterReadAcked,
    trackingFilterReadNotAcked
});
boolean isReadAckOnlyAcked = Util.getString(trackerReadAckFilter, "").equals(trackingFilterReadAcked);
boolean isReadAckOnlyNotAcked = Util.getString(trackerReadAckFilter, "").equals(trackingFilterReadNotAcked);

Set<ReaderTracker> readTrackerSet = formHandler.getReaderTrackerSet();
Set<Member> unreadMemberSet = formHandler.getUnreadMemberSet();

int readCount = formHandler.getReadCount();
int unreadCount = formHandler.getUnreadCount();
int readAndUnreadCount = formHandler.getReadAndUnreadCount();

boolean showReaderTrackerRead = readCount > 0;
boolean showReaderTrackerUnread = isAuthor && unreadCount > 0;
// If readAck filter is set, skip non relevant "unread members"
showReaderTrackerUnread &= !isReadAckOnlyAcked && !isReadAckOnlyNotAcked;

boolean showCounters = showReaderTrackerRead || showReaderTrackerUnread;
boolean showNoResult = !showCounters;

Map trackingPagerMap = new HashMap();
trackingPagerMap.put(recoModalTabParam, recoModalTabTracking);
trackingPagerMap.put(recommendationIdParam, recommendation.getId());
if (recipientGroupFilter != null) {
  trackingPagerMap.put(trackingFilterGroupParam, recipientGroupFilter.getId());
}
if (Util.notEmpty(trackerReadAckFilter)) {
  trackingPagerMap.put(trackingFilterReadAckParam, trackerReadAckFilter);
}
%>

<%
// ----------------------------------------------------------------------
// Filter by Read Ack?
// ----------------------------------------------------------------------
%>
<% if (showReadAckFilter) { %>
  <%
  String filterReadAckUrlParams = MessageFormat.format(
    "\"{0}\":\"{1}\",\"{2}\":\"{3}\",\"{4}\":\"{5}\"", 
    recoModalTabParam, recoModalTabTracking,
    recommendationIdParam, recommendation.getId(),
    recommendedDataIdParam, recommendedPub.getId()
  );
  if (recipientGroupFilter != null) {
    filterReadAckUrlParams += ",\"" + trackingFilterGroupParam + "\":\""+recipientGroupFilter.getId()+"\"";
  }
  String filterReadAckReadUrlParams = MessageFormat.format(
      "{0},\"{1}\":\"{2}\"", 
      filterReadAckUrlParams,
      trackingFilterReadAckParam, isReadAckOnlyAcked ? "" : trackingFilterReadAcked
  );
  String filterReadAckReadTitle = isReadAckOnlyAcked ?
      glp("ui.com.lbl.filter.remove") :
      glp("readertracker.filter-readack.y.h");
  String filterReadAckUnreadUrlParams = MessageFormat.format(
      "{0},\"{1}\":\"{2}\"", 
      filterReadAckUrlParams,
      trackingFilterReadAckParam, isReadAckOnlyNotAcked ? "" : trackingFilterReadNotAcked
  );
  String filterReadAckUnreadTitle = isReadAckOnlyNotAcked ? 
      glp("ui.com.lbl.filter.remove") :
      glp("readertracker.filter-readack.n.h");
  %>
  
  <div class="recommendation-tracking-filter align-reco-container filter-read-ack">
    <span class="filter-label"
          title="<%= encodeForHTMLAttribute(glp("readertracker.filter-readack.h")) %>">
      <%= glp("ui.com.lbl.readAck") %> :
    </span>
    <a href="#" onclick="return false;"
        title="<%= encodeForHTMLAttribute(filterReadAckReadTitle) %>"
        class="tracking-filter-item read-ack-filter-acked<%= isReadAckOnlyAcked ? " active" : "" %>"
        data-jalios-action="ajax-refresh" data-jalios-ajax-refresh="noscroll"
        data-jalios-options='{"params" : { <%= filterReadAckReadUrlParams %> } }'>
      <%= glp("ui.com.lbl.readAck.y.short") %>
      <% if (isReadAckOnlyAcked) { %><jalios:icon src="cross" css="remove-filter" /><% } %>
    </a>
    &middot;
    <a href="#" onclick="return false;"
        title="<%= encodeForHTMLAttribute(filterReadAckUnreadTitle) %>"
        class="tracking-filter-item read-ack-filter-not-acked<%= isReadAckOnlyNotAcked ? " active" : "" %>"
        data-jalios-action="ajax-refresh" data-jalios-ajax-refresh="noscroll"
        data-jalios-options='{"params" : { <%= filterReadAckUnreadUrlParams %> } }'>
      <%= glp("ui.com.lbl.readAck.n.short") %>
      <% if (isReadAckOnlyNotAcked) { %><jalios:icon src="cross" css="remove-filter" /><% } %>
    </a>
  </div>
  <jalios:javascript>
    /* Move readAck filter in the recommendation DIV */
    let $target = jQuery('.recommendation-tracking .recommendation .recommendation-container');
    let $elt = jQuery('.recommendation-tracking .filter-read-ack');
    $elt.appendTo($target);
  </jalios:javascript>
<% } %>

<%
// ----------------------------------------------------------------------
// Results
// ----------------------------------------------------------------------
%>
<div class="recommendation-tracking-results reader-tracking">
  <% if (showNoResult) { %>
    <div class="member-tracking member-tracking-no-results">
      <div class="member-tracking-list member-tracking-no-results-list">
        <%@ include file='/front/doNoResult.jspf' %>
      </div>
    </div>
  <% } %>
  <%
  // ----------------------------------------------------------------------
  // Read members
  // ----------------------------------------------------------------------
  %>
  <% if (showReaderTrackerRead) { %>
    <%
    String readLabel = glp("ui.recommendation.modal.lbl.mbr.read");
    // When ack filter is used, display when no results
    if (isReadAckOnlyAcked) {
      readLabel = glp("ui.recommendation.modal.lbl.mbr.acked");
    } else if (isReadAckOnlyNotAcked) {
      readLabel = glp("ui.recommendation.modal.lbl.mbr.not-acked");
    }
    %>
    <div class="member-tracking member-tracking-read<%= isReadAckOnlyAcked ? " read-only-acked" : "" %><%= isReadAckOnlyNotAcked? " read-only-not-acked" : "" %>">
      <% if (showCounters) { %>
        <div class="member-tracking-count">
          <b><%= readLabel %></b>
          <%
          String badgeCss = "badge badge-small";
          if (isReadAckOnlyNotAcked) {
            badgeCss += " badge-danger";
          } else {
            badgeCss += " badge-success";
          }
          %>
          <span class="<%= badgeCss %>">
            <%= readCount %> / <%= readAndUnreadCount %>
          </span>
        </div>
      <% } %>
      <% if (!readerTrackerAnonymized) { %>
        <div class="member-tracking-list member-tracking-read-list<%= showNoResult ? " no-results" : "" %>">
          <jalios:pager name='readPH' action='init' declare='true' pageSize='9' size='<%= readCount %>' parameterMap="<%= trackingPagerMap %>" paramPrefix="read" />
          <jalios:cards mode="<%= CardsDisplayMode.INLINE %>" css="is-centered">
            <jalios:foreach name="itReaderTracker" type="ReaderTracker" collection="<%= getColSlice(readTrackerSet, readPH) %>">
              <%
              request.setAttribute("recommendation-reader-tracker", itReaderTracker);
              request.setAttribute("recommendation-read-date", itReaderTracker.getMdate());
              %>
              <jalios:cardData data="<%= itReaderTracker.getAuthor() %>" template="recommendationtracking"/>
              <%
              request.removeAttribute("recommendation-read-date");
              request.removeAttribute("recommendation-reader-tracker");
              %>
            </jalios:foreach>
          </jalios:cards>
          <jalios:pager name='readPH' />
        </div>
      <% } %>
    </div><%-- EOF.member-tracking.member-tracking-read --%>
  <% } %>

  <%
  // ----------------------------------------------------------------------
  // Unread members
  // ----------------------------------------------------------------------
  %>
  <% if (showReaderTrackerUnread) { %>
    <%
    int unreadBadgeCount = unreadCount;
    String unreadLabel = glp("ui.recommendation.modal.lbl.mbr.unread");
    %>
    <div class="member-tracking member-tracking-unread">
      <div class="member-tracking-count">
        <b><%= unreadLabel %></b>
        <span class="badge badge-small badge-important">
          <%= unreadBadgeCount %> / <%= readAndUnreadCount %>
        </span>
      </div>
      <% if (!readerTrackerAnonymized) { %>
        <div class="member-tracking-list member-tracking-unread-list">
          <jalios:pager name='unreadPH' action='init' declare='true' size='<%= unreadCount %>' pageSize='9' paramPrefix="unread" />
          <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
            <jalios:foreach name="itCardData" type="Data" collection="<%= getColSlice(unreadMemberSet, unreadPH) %>">
              <jalios:cardData data="<%= itCardData %>" template="recommendationtracking"/>
            </jalios:foreach>
          </jalios:cards>
          <jalios:pager name='unreadPH' />
        </div>
      <% } %>
    </div><%-- EOF.member-tracking.member-tracking-unread --%>
  <% } %>
</div><%-- EOF.recommendation-tracking-content --%>