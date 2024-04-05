<%@page import="com.jalios.jcms.recommendation.RecommendationManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/pub/actions/doInitPubActionItem.jspf" %><%

if (pub == null || !RecommendationManager.getInstance().canBeRecommendedBy(pub, loggedMember)) { 
  return;
}
%>
<a class="action-item action-item-recommend" href="plugins/SmartPhonePlugin/jsp/action/recommendation.jsp?recommendedDataId=<%= pub.getId() %>">
  <span class="action-item-icon-wrapper">
    <jalios:icon src="smartphone-recommend" css="action-item-icon" />
  </span>
  <span class="action-item-text"><%= glp("ui.recommendation") %></span>
</a>