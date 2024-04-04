<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.Publication"%><%
%><%@page import="com.jalios.jcms.recommendation.*"%><%
%><%@page import="com.jalios.jcms.vote.VoteManager"%><%
%><%@page import="com.jalios.jcms.alert.*"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (!isLogged) {
  return;
}

Recommendation recommendation = (Recommendation) request.getAttribute("jcms.recommendationlist.reco");
if (recommendation == null) {
  return;
}
// IMPT: make sure data and author are protected against NPE (See JCMS-7183)
Data data = recommendation.getData();
Member author = recommendation.getAuthor();
int groupCount = Util.getSize(recommendation.getGroupSet());
boolean displayActions = channel.isDataWriteEnabled() && isLogged;
Set<Member> recipientSet = recommendation.getRecipientSet();
%>
<div data-jalios-alert-id="<%= recommendation.getId() %>" class="card alert-card recommendation-card <%= "alert-id-" + recommendation.getId() %> alert-level-border-<%= recommendation.getLevel().getKey() %>">
  <%-- HEADER --%>
  <div class="alert-header clearfix media">
    <jalios:memberphoto css="pull-left" size="<%= PhotoSize.TINY %>" member="<%= author %>" />
    <div class="description media-body">
      <% if (JcmsUtil.isSameId(loggedMember, author)) { %>
        <%= glp("alert-app.recommendation-card.recommended", (data != null ? data.getDisplayLink(userLocale) : null), recipientSet) %>
        <ul class="list-unstyled">
          <% for (Member itMember : recipientSet) { %>
            <% if (itMember != null) { %>
              <li><jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.ICON %>"/> <%= itMember.getDisplayLink(userLocale) %></li>
            <% } %>
          <% } %>
          <% for (Group itGroup : recommendation.getGroupSet()) { %>
            <% if (itGroup != null) { %>
              <li><%= itGroup.getDataName(userLang) %></li>
            <% } %>
          <% } %>
        </ul>
      <% } else { %>
        <%
        String authorLink;
        if (author != null) {
          if (author.canBeReadBy(loggedMember)) {
            authorLink = author.getDisplayLink(userLocale);
          } else {
            authorLink = glp("ui.com.lbl.restricted-mbr");
          }
        } else {
          authorLink = channel.getName();
        }
        String dataLink = data != null ? data.getDisplayLink(userLocale) : null;
        %>
        <%= glp("alert-app.recommendation-card.recommendation", authorLink, dataLink) %>
      <% } %>
    </div>    
  </div><%-- EOF .alert-header --%>
  
  <%-- BODY --%>
  <div class="alert-body">
    <% if (Util.notEmpty(recommendation.getMessage())) { %>
      <div class="message br">
        <jalios:wiki><%= recommendation.getMessage() %></jalios:wiki>
      </div>
    <% } %>
    <% if (data instanceof Publication && Util.notEmpty(((Publication)data).getAbstract(userLang))) { %>
      <div class="alert-abstract well well-sm">
        <% Publication pub = (Publication)data; %>
        <%@ include file='/front/publication/doPublicationAbstract.jspf' %>
      </div>
    <% } %>    
  </div><%-- EOF .alert-body --%>     
    
  <%-- FOOTER --%>
  <div class="alert-footer card-footer">
    <div class="metadata">
      <span class="card-metadata-item badge alert-level alert-level-<%= recommendation.getLevel().getKey() %>"><%= recommendation.getLevel().getLabel(userLang) %></span>
      <% if (data instanceof Publication) { %>
      <span class="card-metadata-item workspace"><%= ((Publication)data).getWorkspace().getTitle(userLang) %></span>
      <% } %>
      <span class="card-metadata-item author"><%= author != null ? author : channel.getName() %></span>
    </div><%-- EOF .metadata --%>

    <% if (displayActions) { %>
      <%
      boolean canVote = data instanceof Publication && VoteManager.getInstance().canVote((Publication) data, loggedMember);
      boolean canRecommend = data instanceof Publication && RecommendationManager.getInstance().canBeRecommendedBy((Publication) data, loggedMember);
      boolean canAccessReaderTracker = RecommendationManager.getInstance().canAccessRecommendationReaderTracker(recommendation, loggedMember);
      boolean displayPubActions = canVote || canRecommend || canAccessReaderTracker;
      %>
      <% if (displayPubActions) { %>
        <jalios:buffer name="cardFooterActions">
          <div class="card-footer-actions-buttons">
          <jalios:include target="ALERT_RECO_ACTIONS_FOOTER_LEFT" />
          <% if (canVote) { %>
            <jalios:vote css="card-action-item alert-add-vote" templateProperty="vote.template.footer-card" pub="<%= (Publication) data %>" />
          <% } %>
          <% if (canRecommend) { %>
            <jalios:recommendation css="card-action-item btn btn-rounded btn-text btn-recommend" data="<%= data %>"><jalios:icon src="alert-recommend" /><span class="alert-action-item-label"><%= glp("ui.recommendation") %></span></jalios:recommendation>             
          <% } %>
          <% if (canAccessReaderTracker) { %>
            <span class="card-action-item">
              <jalios:buttonModal css="btn btn-rounded btn-text btn-reader-tracking" url='<%= "front/recommendation/recommendationTrackingModal.jsp?"+ RecommendationHandler.RECOMMENDATION_ID_PARAM +"=" +  recommendation.getId() %>'>
                <jalios:icon src="reader-tracking" /><span class="alert-action-item-label"><%= glp("ui.recommendation.modal.lbl.reader-track") %></span>
              </jalios:buttonModal>
            </span>
          <% } %>
          </div>
        <jalios:include target="ALERT_RECO_ACTIONS_FOOTER_RIGHT" />
        </jalios:buffer>
        <% if (Util.notEmpty(cardFooterActions.trim())) { %>
          <div class="card-footer-actions">
            <%= cardFooterActions.toString() %>
            <span class="card-metadata-item metadata date">
              <jalios:date format="timeDateOrTime" date="<%= recommendation.getCdate() %>"/>      
            </span>
          </div>
        <% } %>
      <% } %>
    <% } %>
  </div><%-- EOF .alert-footer --%>
</div><%-- EOF .alert-entry --%>
