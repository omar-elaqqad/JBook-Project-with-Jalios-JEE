<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcms.recommendation.*" %><%
%><%@page import="com.jalios.jcms.tracking.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/front/recommendation/doRecommendationFunc.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}
jcmsContext.addJavaScript("js/jalios/core/alert/jalios-alert-level-chooser.js");
jcmsContext.addJavaScript("js/jalios/ux/jalios-recommendation-modal.js");

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.recommendation.RecommendationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<%
  RecommendationManager recoMgr = RecommendationManager.getInstance();

  Recommendation recoTrack = getDataParameter(RecommendationHandler.RECOMMENDATION_ID_PARAM,Recommendation.class);

  boolean isReaderTrackerEnabled = ReaderTrackerManager.getInstance().isReaderTrackerEnabled();

  String recommendationTab = getAlphaNumParameter(RecommendationHandler.RECOMMENDATION_MODAL_TAB_PARAM,"formTab");
  boolean isRecommendationFormTab = Util.toBoolean(recommendationTab.equals("formTab"),false);
  boolean isSentRecommendationTab = Util.toBoolean(recommendationTab.equals("sentRecommendationTab"),false);
  boolean isReceivedRecommendationTab = Util.toBoolean(recommendationTab.equals("receivedRecommendationTab"),false);
  boolean canAccessReaderTrackingTab = isReaderTrackerEnabled && recoTrack != null && !recoMgr.isRecommendationReaderTrackerAnonymized();
  boolean isReaderTrackingTab = canAccessReaderTrackingTab && Util.toBoolean(recommendationTab.equals(RecommendationHandler.RECOMMENDATION_MODAL_TAB_TRACKING),false);
  if (!isRecommendationFormTab && !isSentRecommendationTab && !isReceivedRecommendationTab && !isReaderTrackingTab) {
    isRecommendationFormTab = true;
  }
  boolean displayRecommendationOn = false;
  boolean displayReaderTracking = true;
  boolean displayReaderTrackingTab = false && isReaderTrackerEnabled;
  boolean isMultiplePage = false;

  Data recommendedData = getDataParameter(RecommendationHandler.RECOMMENDED_DATA_ID_PARAM);

  if (recommendedData == null) {
    return;
  }

  int sentRecommendationCount = recoMgr.getSentRecommendationCount(recommendedData,loggedMember);
  int receivedRecommendationCount = recoMgr.getReceivedRecommendationCount(recommendedData,loggedMember);
  String modalUrl = "front/recommendation/recommendationModal.jsp";
  boolean displayPubLink = false;
  boolean displayPager = false;

  jcmsContext.addCSSHeader("css/jalios/ux/jalios-recommendation.css");

  Set<Group> removedGroupSet = new HashSet<Group>();
  Set<Member> removedMemberSet = new HashSet<Member>();

  if (formHandler.validate()) {
    //Close modal
    Map<String, Object> contextMap = formHandler.getContext();
    removedGroupSet = (Set<Group>) contextMap.get("jcms.recommendation.removedGroupSet");
    removedMemberSet = (Set<Member>)  contextMap.get("jcms.recommendation.removedMemberSet");
    if (Util.isEmpty(removedGroupSet) && Util.isEmpty(removedMemberSet)) {%>
      <%-- Close modal after sending recommendation, if there was no read right issues --%>
      <script>jQuery.jalios.ui.Modal.close(false);</script><%
      return;
    }
  }
  String modalCss = "recommendation-modal modal-lg";
  if (canAccessReaderTrackingTab) {
    modalCss += " can-access-tracking";
  }
  %>
<jalios:modal formHandler="<%= formHandler %>" title="ui.recommendation.modal.title" css="<%= modalCss %>" url="front/recommendation/recommendationModal.jsp">
  <jalios:buffer name="MODAL_CONTENT">
    <% if (Util.notEmpty(removedGroupSet) || Util.notEmpty(removedMemberSet)) { %>
      <%-- Display all members and group which have not received the alert --%>
      <div class="modal-body">
        <jalios:message level="<%= MessageLevel.INFO %>" dismissable="false">
        <p><%= glp("ui.recommendation.modal.info.success") %></p>
        <% if (Util.notEmpty(removedGroupSet)) { %>
          <p><%= glp("ui.recommendation.modal.warning.groups.removed-set") %></p>
          <ul>
            <% for (Group itGroup : removedGroupSet) { %>
              <li><%= itGroup.getName(userLang) %></li>
            <% } %>
          </ul>
        <% } %>
        <% if (Util.notEmpty(removedMemberSet)) { %>
          <p><%= glp("ui.recommendation.modal.warning.members.removed-set") %></p>
          <ul>
            <% for (Member itMember : removedMemberSet) { %>
              <li><%= itMember.getFullName() %></li>
            <% } %>
          </ul>
        <% } %>
        </jalios:message>
      </div>
      <div class="modal-footer">
        <div class="buttons">
          <button type="button" class="btn btn-primary" data-dismiss="modal"><%= glp("ui.com.btn.close") %></button>
        </div>
      </div>
    <% } else { %>
      <%-- Display recommendation form / Sent / Received --%>
      <% if (sentRecommendationCount > 0 || receivedRecommendationCount > 0){ %>
        <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned no-border nobr">
          <li class="recommendation-form-tab<%= isRecommendationFormTab ? " active" : "" %>">
            <a href="#recommendation-form" onclick="return false;"><%= glp("ui.recommendation") %></a>
          </li>
          <% if (sentRecommendationCount > 0) { %>
            <li class="recommendation-sent-tab<%= isSentRecommendationTab ? " active" : "" %>">
              <a href="#recommendation-sent" onclick="return false;">
                <span>
                <%= glp("ui.recommendation.sent") %>
                <span class="badge badge-small"><%= sentRecommendationCount %></span>
                </span>
              </a>
            </li>
          <% } %>
          <% if (receivedRecommendationCount > 0) { %>
            <li class="recommendation-received-tab<%= isReceivedRecommendationTab ? " active" : "" %>">
              <a href="#recommendation-received" onclick="return false;"><%= glp("ui.recommendation.received") %> <span class="badge badge-small"><%= receivedRecommendationCount %></span></a>
            </li>
          <% } %>
          <% if (canAccessReaderTrackingTab) { %>
            <li class="recommendation-tracking-tab<%= isReaderTrackingTab ? " active" : "" %>">
              <a href="#recommendation-tracking" onclick="return false;"><%= recoMgr.isDataTracked(recoTrack) ? glp("ui.recommendation.modal.lbl.reader-track-tab") : glp("ui.recommendation.modal.lbl.detail-tab") %></a>
            </li>
          <% } %>
        </ul>
      <% } %>

      <div class="tab-content">
        <%@ include file="/front/recommendation/recommendationModalFormTab.jspf" %>
        <% if (sentRecommendationCount > 0) { %>
          <div class="tab-pane fade in<%= isSentRecommendationTab ? " active" : "" %>" id="recommendation-sent">
            <%@ include file="/front/recommendation/recommendationSent.jspf" %>
          </div>
        <% } %>
        <% if (receivedRecommendationCount > 0) { %>
          <div class="tab-pane fade in<%= isReceivedRecommendationTab ? " active" : "" %>" id="recommendation-received">
            <%@ include file="/front/recommendation/recommendationReceived.jspf" %>
          </div>
        <% } %>
        <%@ include file="/front/recommendation/recommendationModalTrackingTab.jspf" %>
      </div><%-- EOF .tab-content --%>
    <% } %>

    <%--
      JCMS-6597 : Add workspace id in an hidden field to ensure member and
      group choosers are opened pre-filtered on the publication's workspace.
    --%>
    <% if (recommendedData instanceof Publication) {
      Publication recommendedPublication = (Publication) recommendedData; %>
    <input type="hidden" name="ws" value="<%= Util.getString(JcmsUtil.getId(recommendedPublication.getWorkspace()), "") %>"/>
    <% } %>

  </jalios:buffer>


</jalios:modal>