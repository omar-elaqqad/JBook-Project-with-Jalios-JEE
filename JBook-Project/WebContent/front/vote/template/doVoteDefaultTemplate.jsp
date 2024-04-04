<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%><%
%><%@page import="com.jalios.jcms.uicomponent.AjaxRefreshButtonDataAttribute.AjaxRefreshOption"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.vote.*" %><%
%><%@ include file="/front/vote/voteControl.jspf" %><%
String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? voteMgr.getDefaultPositiveVoteIcon() : voteMgr.getDefaultPositiveVoteHighlightIcon();
int voteScore = pub.getVoteScore();
String ariaLabel = "";
String title = "";
if (hasVoted) {
  ariaLabel = glp("ui.vote.remove-vote-for-aria-label", pub.getTitle(userLang), voteScore);
  title = "ui.vote.remove-vote-for-title";
} else {
  ariaLabel = glp("ui.vote.vote-for-aria-label", pub.getTitle(userLang), voteScore);
  title = "ui.vote.vote-for-title";
}

Map<String, Object> ajaxParams = new HashMap<>();
ajaxParams.put("pubId", pub.getId());
ajaxParams.put("positiveVote", true);
ajaxParams.put("vote", true);

String buttonCss = "btn-vote ID_ttLike LIKE-" + pub.getId();
buttonCss += hasVoted ? " has-voted": " has-not-voted";

if (canVote) {%>
<jalios:buttonAjax
  buttonType="<%= ButtonType.A %>"
  css="<%= buttonCss %>" 
  title="<%= title %>"
  ajaxAttributes='<%= new AjaxRefreshButtonDataAttribute().url("front/vote/template/doVoteDefaultTemplate.jsp").addOption(AjaxRefreshOption.NO_HISTORY).params(ajaxParams) %>' > 
  <jalios:icon src="<%= positiveVoteIconSrc %>" alt="<%= ariaLabel %>" />
</jalios:buttonAjax>
<% }else{ %>
<jalios:icon src="<%= positiveVoteIconSrc %>" alt="<%= ariaLabel %>" />
<% } %>