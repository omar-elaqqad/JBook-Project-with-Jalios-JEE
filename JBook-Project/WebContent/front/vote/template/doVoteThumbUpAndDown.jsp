<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.vote.*" %><%
%><%@ include file="/front/vote/voteControl.jspf" %><%
String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? "images/jalios/icons/vote/thumbUp.png" : "images/jalios/icons/vote/thumbUpEnabled.png";
String negativeVoteIconSrc = hasVoted && existingVote.isPositive() || !hasVoted ? "images/jalios/icons/vote/thumbDown.png" : "images/jalios/icons/vote/thumbDownEnabled.png";
%>
 <% if (canVote){ %><a role="button" data-jalios-ajax-refresh="nohistory"  title="<%= encodeForHTMLAttribute(glp("ui.vote.like")) %>" class="ajax-refresh ajax-action" href="front/vote/template/doVoteThumbUpAndDown.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=true&amp;vote=true" onclick="return false;"><% } %><jalios:icon src="<%= positiveVoteIconSrc %>" alt='<%= encodeForHTMLAttribute(glp("ui.vote.like")) %>' /><% if (canVote){ %></a><% } %>
 <% if (canVote){ %><a role="button" data-jalios-ajax-refresh="nohistory"  title="<%= encodeForHTMLAttribute(glp("ui.vote.dislike")) %>" class="ajax-refresh ajax-action" href="front/vote/template/doVoteThumbUpAndDown.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=false&amp;vote=true" onclick="return false;"><% } %><jalios:icon src="<%= negativeVoteIconSrc %>" alt='<%= encodeForHTMLAttribute(glp("ui.vote.dislike")) %>' /><% if (canVote){ %></a><% } %>