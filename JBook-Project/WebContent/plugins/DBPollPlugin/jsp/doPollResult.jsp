<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.dbpoll.*" %>
<%
Poll poll = (Poll)request.getAttribute("poll");
PollManager pollMgr = PollManager.getInstance();
PollResult result = pollMgr.getPollResult(poll);
boolean hasAlreadyVoted = pollMgr.hasAlreadyVoted(poll, loggedMember);
boolean isClosed = poll.isClosed();
DecimalFormat twoDForm = new DecimalFormat("#.##");
int count = result.getCount();
boolean isInPortletPoll = Util.toBoolean(request.getAttribute("jcms.jcmsplugin.poll.portletpollctxt"),false);
boolean isActivityCtxt = Util.toBoolean(request.getAttribute("jcmsplugin.dbpoll.activity-ctxt"), false);
boolean isAllPoll = Util.toBoolean(request.getAttribute("jcms.jcmsplugin.poll.allpolls"),false);
String[] optionLabels = poll.getOptions(userLang, true);

boolean detailedDisplay = Util.toBoolean(request.getAttribute("jcmsplugin.poll.detailed-display"), true);
%>
<% if (Util.notEmpty(poll.getImage()) && new File(channel.getRealPath(poll.getImage())).exists()) { %>
  <jalios:thumbnail path="<%= poll.getImage() %>" width="960" height="640" css="poll-image" />
<% } %>

<% if (detailedDisplay) { %>
  <% if (isInPortletPoll) { %>
  <h3 class="poll-title"><jalios:link data="<%= poll %>" css="noTooltipCard"><%= poll.getTitle(userLang) %></jalios:link></h3>
  <% } else { %>
  <h1 class="poll-title"><%= poll.getTitle(userLang) %></h1>
  <% } %>
<% } %>

<div class="poll-result-container">
  
  <% if (!Util.toBoolean(request.getAttribute("jcmsplugin.poll.inserted-poll"), false)) { %>
    <%@ include file='doPollDescription.jspf' %>
  <% } %>
  
  <%@ include file='/jcore/doMessageBox.jspf' %>
  
  <% if (!isInPortletPoll && detailedDisplay) { %>
    <%@ include file='doPollInformation.jspf' %>
  <% } %>
  
  <div class="poll-results">
    <% String css = isInPortletPoll ? poll.getId() + "_focus" : ""; %>
    <% if (count < 1) { %>
      <jalios:message css="<%= css %>" title='' dismissable='false'><%= glp("jcmsplugin.dbpoll.msg.no-result") %></jalios:message>
    <% } else { %>
      <p class='br <%= css %>'>
        <jalios:icon src="jcmsplugin-poll-stats"/>
    	  <% if (poll.getPdate() != null && poll.getEdate() != null) { %>
          <%= glp("jcmsplugin.dbpoll.lbl.dates", channel.getDateFormat(userLang).format(poll.getPdate()), channel.getDateFormat(userLang).format(poll.getEdate())) %>
    	  <% }else{ %>
    	    <%= glp("jcmsplugin.dbpoll.lbl.vote-cnt", count) %>
    	  <% } %>
      </p>
    <% } %>
  </div>
  <% if(count > 0){ %>
    <ul class="poll-answers">
      <%
      Set<PollOptionResult> pollOptionResultSet = pollMgr.getPollOptionResultSet(poll, new PollOptionResultComparator(), userLang);
      %>
      <jalios:foreach collection='<%= pollOptionResultSet %>' name='pollOptionResult' type='PollOptionResult'>
        <%
        int index = pollOptionResult.getIndex();  // starts at 1
        String answerId = poll.getId() + "_" + index;
        int voteCount = pollOptionResult.getVoteCount();
        double ratio = (double) voteCount / (double) count;
        String percent = twoDForm.format(ratio * 100) + "%";
        boolean isFirst = itCounter.intValue() == 1;
        int barWidth = (int)(100.0 * ratio);
        String option = optionLabels != null && optionLabels.length > (index - 1) ? optionLabels[index - 1] : "";
        %>
        <li class="poll-answer<%= itCounter == Util.getSize(optionLabels) ? " last" : "" %>">
          <div class="poll-answer-desc">
            <span id="<%= answerId %>" class="wiki"><%= itCounter %>. <%= option %> </span>
            <span class="vote-count">(<%= glp("jcmsplugin.dbpoll.lbl.vote-cnt", voteCount)%>)</span>
          </div>
          <div class="progress poll-answer-votes">
            <% String progressBarClass = isFirst ? "progress-bar-success" : "progress-bar-primary"; %>
            <% if (barWidth < 10) { %>
              <span><%= percent %></span>
            <% } %>
            <div class="progress-bar <%= progressBarClass %>" role="progressbar" aria-labelledby="<%= answerId %>" aria-valuetext="<%= percent %>" aria-valuenow="<%= barWidth %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= barWidth %>%">
              <% if (barWidth >= 10) { %><%= percent %><% } %>
            </div>
          </div>
        </li>
      </jalios:foreach>
    </ul>
  <% } %>
  
  <div class="main-actions">
    <% if (!hasAlreadyVoted && !isClosed) { %>
      <% if (isInPortletPoll) { %>
        <button type="button" class="btn btn-primary" data-jalios-ajax-refresh="nohistory" data-jalios-action="ajax-refresh"><%= glp("jcmsplugin.dbpoll.btn.vote") %></button>
      <% } else { %>
        <jalios:link data="<%= poll %>" css="btn btn-primary"><%= glp("jcmsplugin.dbpoll.btn.vote") %></jalios:link>
      <% } %>
    <% } else if (hasAlreadyVoted && !isClosed) { %>
      <% String focusCss = "." + poll.getId() + "_focus"; %>
      <form action="plugins/DBPollPlugin/jsp/pollVote.jsp" method="post">
        <button type="submit" name="opDelete" class="btn btn-default"<% if (isInPortletPoll || isActivityCtxt) { %> data-jalios-action="ajax-refresh" data-jalios-ajax-refresh-focus-element="<%= focusCss %>"<% } %> value="true"><%= glp("jcmsplugin.dbpoll.btn.delete-vote") %></button>
        <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>" />
        <input type="hidden" name="poll" value="<%= poll.getId() %>" />
      </form>
    <% } %>
    <% if (loggedMember.canWorkOn(poll) && detailedDisplay && !pollMgr.isTrashed(poll)) { %>
      <% if (isInPortletPoll) { %>
        <% String label = poll.isClosed() ? glp("jcmsplugin.dbpoll.lbl.open") : glp("jcmsplugin.dbpoll.lbl.close"); %>
        <button data-jalios-action="ajax-refresh" data-jalios-ajax-refresh="nohistory" class="btn btn-default switch-poll-status" data-jalios-options='{"params" : {"pollId":"<%= poll.getId() %>", "opSwitch":true}}'>
          <%= label %>
        </button>
      <% } else { %>
        <% String label = poll.isClosed() ? glp("jcmsplugin.dbpoll.lbl.open") : glp("jcmsplugin.dbpoll.lbl.close"); %>
        <a href="plugins/DBPollPlugin/jsp/switchPollStatus.jsp?id=<%= poll.getId() %>" class="btn btn-default switch-poll-status"><%= label %></a>
      <% } %>
    <% } %>
  </div>
</div>