<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%><%
%><%@page import="com.jalios.jcms.uicomponent.AjaxRefreshButtonDataAttribute.AjaxRefreshOption"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.vote.*" %><%
request.setAttribute("jcms.vote.reopenTransaction",true);
%><%@ include file="/front/vote/voteControl.jspf" %><%
String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? voteMgr.getDefaultPositiveVoteIcon() : voteMgr.getDefaultPositiveVoteHighlightIcon();
int voteScore = pub.getVoteScore();
List<Vote> voteList = voteMgr.isDownVoteAnonymized() ? voteMgr.getPositiveVoteList(pub) : voteMgr.getVoteList(pub);
String title = "";
String ariaLabel = "";
if (hasVoted) {
  ariaLabel = glp("ui.vote.remove-vote-for-aria-label", pub.getTitle(userLang), voteList.size());
  title = "ui.vote.remove-vote-for-title";
} else {
  ariaLabel = glp("ui.vote.vote-for-aria-label", pub.getTitle(userLang), voteList.size());
  title = "ui.vote.vote-for-title";
}

Map<String, Object> ajaxParams = new HashMap<>();
ajaxParams.put("pubId", pub.getId());
ajaxParams.put("positiveVote", true);
ajaxParams.put("vote", true);
String buttonCss = "btn-vote ID_ttLike LIKE-" + pub.getId();
buttonCss += hasVoted ? " has-voted": " has-not-voted";
String htmlAttributes = "aria-label=\"" + encodeForHTMLAttribute(glp(title)) + "\"";
if (canVote) { 
  %>
  <jalios:buttonAjax buttonType="<%= ButtonType.A %>" htmlAttributes="<%= htmlAttributes %>" css="<%= buttonCss %>" title="<%= title %>" ajaxAttributes='<%= new AjaxRefreshButtonDataAttribute().url("front/vote/template/doVoteAndListTemplate.jsp").addOption(AjaxRefreshOption.NO_HISTORY).params(ajaxParams) %>' >
  <jalios:icon src="<%= positiveVoteIconSrc %>" alt="<%= ariaLabel %>" /></jalios:buttonAjax><%
}

if (Util.isEmpty(voteList) || voteMgr.isVoteAnonymized()) {
  %> <%= glp("ui.vote.pub-vote-count", voteList.size()) %><%
} else {
  boolean displayAll = getBooleanParameter("voteDisplayAll",false);
  int maxMembers = channel.getIntegerProperty("vote.template.votelist.max",5);
  request.removeAttribute("jcms.vote.pub");
  %> <p class="vote-count"><%= glp("ui.vote.pub-vote-count", voteMgr.getVoteCount(pub)) %> : </p>
  <jalios:foreach collection="<%= voteList %>" name="itVote" type="Vote" max="<%= displayAll ? voteList.size() : maxMembers %>">
    <% if ((!voteMgr.isDownVoteAnonymized()) || (voteMgr.isDownVoteAnonymized() && itVote.isPositive())) { %>
    <jalios:memberphoto addFullNameAsAlt="true" member="<%= itVote.getAuthor() %>" size="<%= PhotoSize.ICON %>" />
    <% } %>
  </jalios:foreach>
  <% if(voteList.size() > maxMembers && !displayAll) { %>
    <a title="<%= encodeForHTMLAttribute(glp("ui.vote.see-all-voters")) %>" data-jalios-action="ajax-refresh" href="front/vote/template/doVoteAndListTemplate.jsp?pubId=<%= pub.getId() %>&amp;voteDisplayAll=true"> <jalios:icon src="vote-show-all" /></a>
  <% } %>
<% } %>