<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%  
%><%@ page import="com.jalios.jcms.vote.*" %><%  
%><%@page import="com.jalios.jcmsplugin.esn.ui.*"%><%
%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
%><%@ include file="/front/vote/voteControl.jspf" %><% 
if (!canVote || !pub.isVotable()) {
  return;
}
int voteScore = pub.getVoteScore();

String refreshUrl = "plugins/ESNPlugin/jsp/common/activity/doActivityCardRowVote.jsp";
String ariaLabel, title;
if (hasVoted) {
  ariaLabel = glp("ui.vote.like") + " - " + glp("ui.vote.remove-vote-for-aria-label", pub.getTitle(userLang), voteScore);
  title = glp("ui.vote.like") + " - " + glp("ui.vote.remove-vote-for-aria-label", pub.getTitle(userLang), voteScore);
} else {
  ariaLabel = glp("ui.vote.like") + " - " + glp("ui.vote.vote-for-aria-label", pub.getTitle(userLang), voteScore);
  title = glp("ui.vote.like") + " - " + glp("ui.vote.vote-for-aria-label", pub.getTitle(userLang), voteScore);
}
String divCss = "activity-vote-action-wrapper";
divCss += hasVoted ? " has-voted": " has-not-voted";
String css = "btn btn-xs btn-link btn-vote"
  + " LIKE-" + pub.getId()
  + (hasVoted ? " has-voted": " has-not-voted");
String icon = "jcmsplugin-esn-card-vote";
String text = glp("jcmsplugin.esn.activity-card.vote-action");

Link voteLink = new Link()
  .ariaLabel(ariaLabel)
  .ajaxParam("pubId", pub.getId())
  .ajaxParam("positiveVote", true)
  .ajaxParam("vote", true)
  .ajaxNoScroll(true)
  .ajaxNoHistory(true)
  .css(css)
  .icon(icon)
  .refreshURL(refreshUrl)
  .title(title);
%><jalios:buffer name="linkContent"><%
  %><span class="activity-action-item-label"><%
    %><%= glp("jcmsplugin.esn.activity-card.vote-action") %><%
  %></span><%
%></jalios:buffer><%
voteLink.htmlContent(linkContent.toString());
%><div class="<%= divCss %>"><%
  %><%= voteLink.html() %><%
%></div><%
%>
