<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.PollManager" %><%

Poll poll = (Poll) getPublicationParameter("id");
PollManager.getInstance().switchPollStatus(poll, loggedMember);
sendRedirect(poll.getAppDisplayUrl());
%>