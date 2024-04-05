<%@page import="com.jalios.jcms.recommendation.RecommendationManager"%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/components/ctxmenu/pubfulldisplay/doInitCtxMenuFullDisplay.jspf' %><%

if (!RecommendationManager.getInstance().canBeRecommendedBy(pub, loggedMember)) {
  return;
}
%>
<li class="action-recommend"><a href="plugins/SmartPhonePlugin/jsp/action/recommendation.jsp?recommendedDataId=<%= pub.getId() %>"><jalios:icon src="smartphone-recommend" /> <%= glp("ui.recommendation") %></a></li>