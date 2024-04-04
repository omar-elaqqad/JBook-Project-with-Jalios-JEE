<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/front/readerTracking/doInitReaderTracking.jspf' %><%

String modalUrl = "front/readerTracking/readerTrackingModal.jsp"; 
String modalTrackedPubUrl = modalUrl + "?" + ReaderTrackerHandler.TRACKED_PUB_PARAM + "=" + trackedPub.getId(); 
jcmsContext.addCSSHeader("css/jalios/ux/jalios-reader-tracker.css");

boolean canDelete = readerMgr.canDeleteReaderTracker(trackedPub,loggedMember);
boolean hasPerformDelete = false;
boolean canUpdateTrackedPub = loggedMember.canWorkOn(trackedPub);
boolean opEnabledReadAck = hasParameter("opEnableReadAck");
boolean opDisabledReadAck = hasParameter("opDisableReadAck");

if (canDelete && hasParameter("opDeleteTracking")) {
  trackedPub.removeAllReaderTracker(loggedMember);
  hasPerformDelete = true;
  setInfoMsg(glp("ui.work.rdr.no-tracking-deleted"),request);
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
}
else if (canUpdateTrackedPub && (opEnabledReadAck || opDisabledReadAck)) {
  Publication updated = (Publication)trackedPub.getUpdateInstance();
  if (opEnabledReadAck) {
    updated.setTracked(true);
  }
  updated.setReadAck(opEnabledReadAck);
  updated.checkAndPerformUpdate(loggedMember);
  request.setAttribute("modal.redirect", trackedPub.getDisplayUrl(userLocale));
  %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
  <%
}

// Recommendation
Set<Member> recipientSet = new HashSet<Member>();
if (isRecommendTab) {
  accessType = getIntParameter("accessType", 0);
  List<ReaderTracker> recommendationMemberList = readerMgr.getReaderTrackerList(trackedPub, accessType); 
  for (ReaderTracker itReaderTracker : recommendationMemberList) {
    recipientSet.add(itReaderTracker.getAuthor());
  }
  request.setAttribute("jcms.readertracking.recommendation", true);
}
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.recommendation.RecommendationHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='members' value='<%= Util.isEmpty(recipientSet) || hasParameter("opSend") || hasParameter("opForceSend") ? getStringParameterValues("members", HttpUtil.DATAID_REGEX) : JcmsUtil.dataCollectionToIdList(recipientSet).toArray(new String[0]) %>' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true'/><%
%></jsp:useBean><%
RecommendationHandler modalHandler = isRecommendTab ? formHandler : null;
if (isRecommendTab && formHandler != null && formHandler.validate()) {
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}
%>

<jalios:modal css="modal-lg readerTracking-modal" title="ui.work.rdr.title1" url="<%= modalUrl %>" formHandler="<%= modalHandler %>">
  <%
  // ----------------------------------------------------------------------
  // Tabs
  // ----------------------------------------------------------------------
  %>
  <% if (displayInnerTabs) { %>
  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned no-border br">
    <% if (allReaderCount > 0) { %>
    <li class="sort<%= isReaderTab ? " active" : "" %>" >
      <a href="<%= modalTrackedPubUrl %>&amp;readerTrackingTab=readerTab" onclick="return false;" data-jalios-action="ajax-refresh"><%= glp("ui.work.rdr.tab.reader") %></a>
    </li>
    <% } %>
    <% if (isDownloadTracked && downloadCount > 0) { %>
    <li class="sort<%= isDownloadTab ? " active" : "" %>">
      <a href="<%= modalTrackedPubUrl %>&amp;readerTrackingTab=downloadTab" onclick="return false;" data-jalios-action="ajax-refresh"><%= glp("ui.work.rdr.tab.download") %></a>
    </li>
    <% } %>
    <% if (isRecommendTab) { %>
    <li class="sort<%= isRecommendTab ? " active" : "" %>">
      <a href="<%= modalTrackedPubUrl %>&amp;readerTrackingTab=recommendTab&amp;accessType=<%= accessType %>" onclick="return false;" data-jalios-action="ajax-refresh"><%= glp("ui.recommendation") %></a>
    </li>
    <% } %>
  </ul>
  <% } %>

  <%
  // ----------------------------------------------------------------------
  // Body
  // ----------------------------------------------------------------------
  %>
  <% if (isRecommendTab) { %>
    <% Publication recommendedData = trackedPub; %>
    <%@ include file="/front/recommendation/recommendationForm.jspf" %>
  <% } else { %>
    <% if (readerTrackerAnonymized && (allReaderCount > 0 || downloadCount > 0)) { %>
      <%@ include file="/front/readerTracking/readerTrackingAnonymous.jspf" %>
    <% } else if (isPubTracked && (allReaderCount > 0 || downloadCount > 0)) { %>
      <%@ include file="/front/readerTracking/readerTracking.jspf" %>
    <% } else if (allReaderCount < 1 && downloadCount < 1){ %>
      <%= glp("ui.work.rdr.no-tracking-yet") %>
    <% } else { %>
      <%= glp("ui.work.rdr.no-tracking-enabled") %> <jalios:edit data="<%= trackedPub %>" />
    <% } %>
  <% } %>

  <%
  // ----------------------------------------------------------------------
  // Modal buttons
  // ----------------------------------------------------------------------
  %>
  <jalios:buffer name="MODAL_BUTTONS"> 
    <% if (isRecommendTab) { %>
      <a class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></a>
      <input type="submit" class="btn btn-primary" data-jalios-action="ajax-refresh" name="opSend" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.submit")) %>"/>
      <input type="hidden" name="<%= RecommendationHandler.RECOMMENDATION_MODAL_TAB_PARAM %>" value="formTab" />
      <input type="hidden" name="<%= RecommendationHandler.RECOMMENDED_DATA_ID_PARAM %>" value="<%= trackedPub.getId() %>" />
      <input type="hidden" name="<%= ReaderTrackerHandler.TAB_PARAM %>" value="<%= ReaderTrackerHandler.TAB_RECOMMEND %>" />
      <input type="hidden" name="<%= ReaderTrackerQueryHandler.TRACKED_PUB_PARAM %>" value="<%= trackedPub.getId() %>" />
    <% } else { %>
      <% if (isReaderTab) { %>
        <input type="hidden" name="<%= ReaderTrackerQueryHandler.TRACKED_PUB_PARAM %>" value="<%= trackedPub.getId() %>" />
      <% }  %>
    <div class="button"> 
      <% if (canUpdateTrackedPub) { %>
        <% if (trackedPub.getReadAck()) { %>
          <a class='btn btn-default btn-disable-read-ack' data-jalios-action="ajax-refresh" href="<%= modalTrackedPubUrl %>&amp;opDisableReadAck=true"><%= glp("ui.work.rdr.btn.disable-read-ack") %></a>
        <% } else if (readerMgr.isReadAckAllowed(trackedPub.getClass())) { %>
          <a class='btn btn-default btn-enable-read-ack' data-jalios-action="ajax-refresh" href="<%= modalTrackedPubUrl %>&amp;opEnableReadAck=true"><%= glp("ui.work.rdr.btn.enable-read-ack") %></a>
        <% } %>
      <% } %>
      <% if (canDelete && (allReaderCount > 0 || downloadCount > 0)) { %>
        <a class='btn btn-default btn-delete-tracking confirm' data-jalios-action="ajax-refresh" href="<%= modalTrackedPubUrl %>&amp;opDeleteTracking=true">
        <%= glp("ui.work.rdr.btn.delete") %>
        </a>
      <% } %>
      <% if (!readerTrackerAnonymized && canBeRecommendBy && ((isReaderTab && allReaderCount > 0) || (isDownloadTab && downloadCount > 0))) { %>
        <%
        String recommendationUrl = MessageFormat.format("{0}&amp;{1}={2}&amp;{3}={4}&amp;{5}={6}", 
            modalTrackedPubUrl,
            RecommendationHandler.RECOMMENDED_DATA_ID_PARAM, trackedPub.getId(), 
            RecommendationHandler.RECOMMENDATION_MODAL_TAB_TRACKING, ReaderTrackerHandler.TAB_RECOMMEND,
            ReaderTrackerHandler.ACCESS_TYPE_PARAM, accessType);
        %>
        <a class='btn btn-default' data-jalios-action="ajax-refresh"
            title="<%= encodeForHTMLAttribute(glp(isReaderTab ? "ui.work.rdr.recommend.reader.btn.title" : "ui.work.rdr.recommend.download.btn.title")) %>" 
            href="<%= recommendationUrl %>">
          <%= glp("ui.recommendation") %>
        </a>
      <% } %>
     <button type="button" class="btn btn-primary" data-dismiss="modal"><%= glp("ui.com.btn.close") %></button>
    </div>
    <% } %>
  </jalios:buffer>
</jalios:modal>