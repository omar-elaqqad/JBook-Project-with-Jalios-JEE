<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@ page import="com.jalios.jcms.recommendation.*" %>
<div id="recommendation" data-role="page" >
<%  
RecommendationManager recoMgr = RecommendationManager.getInstance();
Set<Recommendation> receivedRecommendationSet = recoMgr.getReceivedRecommendationSet(loggedMember);
%>
<div data-role="content">
  <% if(Util.isEmpty(receivedRecommendationSet)) { %>
  <div class="alert alert-info">
    <%= glp("jcmsplugin.smartphone.lbl.recommendation.no-recommendation") %>
  </div>
  <% } else { %>
  <ul data-role="listview" data-inset="false" class="ui-listview-full">
  <jalios:foreach name="itReco" type="Recommendation" collection="<%= receivedRecommendationSet %>">
    <li><a href="plugins/SmartPhonePlugin/jsp/core/recommendationDetail.jsp?id=<%= itReco.getId() %>">
      <div class="media">
      <jalios:memberphoto css="pull-left img-polaroid" resource="memberphoto-phone" member="<%= itReco.getAuthor() %>" size="<%= PhotoSize.TINY %>" />
      <div class="media-body">
      <h2><jalios:dataicon data="<%= itReco.getData() %>" /> <%= itReco %></h2>
      <% if (Util.notEmpty(itReco.getData()) && itReco.getData() instanceof Publication) { %>
        <p class="abstract">
          <%= ((Publication)itReco.getData()).getAbstract() %>
        </p>
      <% } %>
      <div class="txt-info"><%= itReco.getAuthor() %> &middot; <jalios:date format="timeDateOrTime" date="<%= itReco.getCdate() %>"/></div>
      </div>
      </div>
      </a>
    </li>    
    
  </jalios:foreach>
  </ul>
  <% } %>
</div>
</div><!-- /page -->
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>