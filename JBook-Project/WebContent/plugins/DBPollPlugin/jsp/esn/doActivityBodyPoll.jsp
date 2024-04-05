<%@page import="com.jalios.jcmsplugin.dbpoll.PollManager"%>
<%@page import="com.jalios.jcmsplugin.esn.activity.ActivityEntry"%>
<%@ include file='/jcore/doInitPage.jspf' %><% 
ActivityEntry activityEntry = (ActivityEntry) request.getAttribute("jcmsplugin.esn.activity.activity-entry");
Poll poll = null;
PollManager pollMgr = PollManager.getInstance();

if (activityEntry == null) {
  poll = (Poll) getDataParameter("poll");
} else {
  poll = (Poll) activityEntry.getActivityData();
}

if (poll == null) {
  return;
}

jcmsContext.addCSSHeader("plugins/DBPollPlugin/css/poll.css");
request.setAttribute("poll", poll);
request.setAttribute("jcmsplugin.dbpoll.activity-ctxt", true);
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.dbpoll.PollVoteHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean>
<%

if (formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
}

boolean showResults = pollMgr.hasAlreadyVoted(poll, loggedMember) || !channel.isDataWriteEnabled();
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/DBPollPlugin/jsp/esn/doActivityBodyPoll.jsp">
  <% if (showResults) { %>
    <% request.setAttribute("jcmsplugin.poll.detailed-display", false); %>
    <jsp:include page="/plugins/DBPollPlugin/jsp/doPollResult.jsp"></jsp:include>
  <% } else { %>
    <jsp:include page="/plugins/DBPollPlugin/jsp/doPollForm.jsp"></jsp:include>
  <% } %>
</div>