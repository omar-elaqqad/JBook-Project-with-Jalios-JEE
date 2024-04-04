<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.vote.*" %><%
%><%@ include file="/front/vote/voteControl.jspf" %><%
String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? voteMgr.getDefaultPositiveVoteIcon() : voteMgr.getDefaultPositiveVoteHighlightIcon();
String negativeVoteIconSrc = hasVoted && existingVote.isPositive() || !hasVoted ? voteMgr.getDefaultNegativeVoteIcon() : voteMgr.getDefaultNegativeVoteHighlightIcon(); 
String title = isPointMode ? glp("ui.vote.pub-vote-points",pub.getVoteScore()) : glp("ui.vote.pub-vote-count",pub.getVoteScore());
title += existingVote != null ? " - " + glp("ui.vote.pub-already-voted") : "";
%>
<% if (canVote){ %><a role="button" title="<%= encodeForHTMLAttribute(glp("ui.vote.like")) %>" class="ajax-refresh ctxTooltipCard ID_ttLike LIKE-<%= pub.getId() %>" href="front/vote/template/doVoteLikeDislike.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=true&amp;vote=true" onclick="return false;"><% } %><jalios:icon src="<%= positiveVoteIconSrc %>" alt='<%= glp("ui.vote.like") %>'/><% if (canVote){ %></a><% } %> 
<% if (canVote){ %><a role="button" title="<%= encodeForHTMLAttribute(glp("ui.vote.dislike")) %>" class="ajax-refresh ajax-action ctxTooltipCard ID_ttLike LIKE-<%= pub.getId() %>" href="front/vote/template/doVoteLikeDislike.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=false&amp;vote=true" onclick="return false;"><% } %><jalios:icon src="<%= negativeVoteIconSrc %>" alt='<%= glp("ui.vote.dislike") %>' /><% if (canVote){ %></a><% } %>
 <span class="badge badge-vote-count" title="<%= encodeForHTMLAttribute(title) %>"><%= pub.getVoteScore() %></span>