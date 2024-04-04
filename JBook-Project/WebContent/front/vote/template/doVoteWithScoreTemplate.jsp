<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%><%
%><%@page import="com.jalios.jcms.uicomponent.AjaxRefreshButtonDataAttribute.*"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.vote.*" %><%
%><%@ include file="/front/vote/voteControl.jspf" %><%
String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? voteMgr.getDefaultPositiveVoteIcon() : voteMgr.getDefaultPositiveVoteHighlightIcon();

int voteScore = pub.getVoteScore();
String cannotVoteTitle = isPointMode ? glp("ui.vote.pub-vote-points", voteScore) : glp("ui.vote.pub-vote-count", voteScore);
String title = "";
String ariaLabel = "";
if (hasVoted) {
  ariaLabel = glp("ui.vote.remove-vote-for-aria-label", pub.getTitle(userLang), voteScore);
  title = glp("ui.vote.remove-vote-for-title");
} else {
  ariaLabel = glp("ui.vote.vote-for-aria-label", pub.getTitle(userLang), voteScore);
  title = glp("ui.vote.vote-for-title");
}
title += existingVote != null ? " - " + glp("ui.vote.pub-already-voted") : "";
Map<String, Object> ajaxParams = new HashMap<>();
ajaxParams.put("pubId", pub.getId());
ajaxParams.put("positiveVote", true);
ajaxParams.put("vote", true);
if (canVote){ %>
<jalios:buttonAjax buttonType="<%= ButtonType.A %>" css='<%= hasVoted ? " has-voted" : "" %>' title="<%= ariaLabel %>" ajaxAttributes='<%= new AjaxRefreshButtonDataAttribute().url("front/vote/template/doVoteWithScoreTemplate.jsp").addOption(AjaxRefreshOption.NO_HISTORY).params(ajaxParams) %>' >
  <jalios:icon src="<%= positiveVoteIconSrc %>" /> <span class="badge badge-vote-count"><%= voteScore %></span>
</jalios:buttonAjax>
<% } else { %>
<jalios:icon src="<%= positiveVoteIconSrc %>" />
<span class="badge badge-vote-count" title="<%= encodeForHTMLAttribute(cannotVoteTitle) %>" aria-label="<%= encodeForHTMLAttribute(cannotVoteTitle) %>"><%= voteScore %></span>
<% } %>