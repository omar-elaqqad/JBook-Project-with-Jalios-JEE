<%@page import="com.jalios.jcms.vote.Vote"%><%
%><%@page import="com.jalios.jcms.vote.VoteManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
Publication pub = (Publication) request.getAttribute("jcms.plugin.smartphone.pub");

if (pub == null) {
  pub = getPublicationParameter("pubId");
}

if (pub == null) {
  return;
}

VoteManager voteMgr = VoteManager.getInstance();
List<Vote> voteList = voteMgr.getVoteList(pub,"cdate");
int voteCount = 0;
%>
<jalios:buffer name="socialFooterBuffer" trim="true">
	<jalios:include target="SMARTPHONE_FULLDISPLAY_SOCIALFOOTER_START" />
	<% if (Util.notEmpty(voteList)) { %>
	  <div class="pub-votes">
	    <div class="pub-votes-label"><a data-role="none" class="pub-votes-photo-wrapper" href="plugins/SmartPhonePlugin/jsp/core/pub/voteList.jsp?pubId=<%= pub.getId() %>"><%= glp("ui.vote.pub-vote-count", voteList.size()) %></a></div>
	    <a data-role="none" class="pub-votes-photo-wrapper" href="plugins/SmartPhonePlugin/jsp/core/pub/voteList.jsp?pubId=<%= pub.getId() %>">
	    <% for (Vote itVote : voteList) { %>
	      <% if(!voteMgr.isVoteAnonymized()) { %>
	      <jalios:memberphoto link="false" resource="memberphoto-phone" member="<%= itVote.getAuthor() %>" size="<%= PhotoSize.TINY %>" />
	      <% } %>
	      <% voteCount++; %>
	      <% if (voteCount > 8) { %>
	        <%-- <div class="pub-vote-show-all">+<%= voteList.size() - 8 %></div> --%>
	      <% break;
	      } %>
	    <% } %>
	    </a>
	  </div>
	<% } %>
	<jalios:include target="SMARTPHONE_FULLDISPLAY_SOCIALFOOTER_END" />
</jalios:buffer>
<div class="pub-social-footer" data-jalios-data-id="<%= pub.getId() %>"><%= socialFooterBuffer %></div>