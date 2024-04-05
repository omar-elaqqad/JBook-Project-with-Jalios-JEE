<%@page import="com.jalios.jcms.vote.Vote"%>
<%@page import="com.jalios.jcms.vote.VoteManager"%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%

Publication pub = getPublicationParameter("pubId");
List<Vote> voteList = VoteManager.getInstance().getVoteList(pub, "cdate");
Boolean isVoteAnonymized =VoteManager.getInstance().isVoteAnonymized();
%>
<div id="vote-list" class="vote-list" data-role="page" data-add-back-btn="true">
  <jalios:list  resource="jmobile-list">
	  <% for (Vote itVote : voteList) { %>
	    <% if(!isVoteAnonymized){ %>
	      <jalios:dataListItem  template="jmobile"  data="<%= itVote.getAuthor() %>"/>
	    <% } %>
	  <% } %>
  </jalios:list>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>