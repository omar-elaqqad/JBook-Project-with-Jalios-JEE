<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.tracking.ReaderTracker"%><%
%><%@ page import="com.jalios.jcms.recommendation.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

Recommendation recommendation = getDataParameter(RecommendationHandler.RECOMMENDATION_ID_PARAM, Recommendation.class);
RecommendationManager recoMgr = RecommendationManager.getInstance();

// Check loggedMember is author of the recommendation
if (!recoMgr.canAccessRecommendationReaderTracker(recommendation, loggedMember)) {
  sendForbidden(request, response);
  return;
}
%>
<jalios:modal css="modal-lg recommendation-modal" url="front/recommendation/recommendationTrackingModal.jsp" title="ui.recommendation.modal.lbl.reader-track-tab">
  <jalios:include jsp="/front/recommendation/doRecommendationTracking.jsp" />
</jalios:modal>
