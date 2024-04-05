<%@page import="com.jalios.jcms.vote.VoteManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/core/pub/actions/doInitPubActionItem.jspf" %><%

if (!pub.canBeVotedBy(loggedMember)) {
  return;
}

boolean hasAlreadyVoted = VoteManager.getInstance().hasVoted(pub, loggedMember);

%>
<a class="action-item action-item-vote <%= hasAlreadyVoted ? "is-active" : "" %>" data-jalios-data-id="<%= pub.getId() %>">
  <span class="action-item-icon-wrapper">
	  <jalios:icon src="smartphone-like" css="action-item-icon" />
  </span>
  <span class="action-item-text"><%= glp("ui.vote.like") %></span>
</a>