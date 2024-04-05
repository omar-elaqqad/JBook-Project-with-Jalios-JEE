<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.*" %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.DBPollAppHandler.PollStatus" %><%

Poll poll = (Poll)request.getAttribute(PortalManager.PORTAL_PUBLICATION);

DBPollAppHandler appHandler = (DBPollAppHandler)request.getAttribute("dbpoll.appHandler");
if (appHandler == null) {
  String showResultsParameter = getBooleanParameter("showResults", false) ? "&showPollResult=true" : "";
  sendRedirect(poll.getAppDisplayUrl() + showResultsParameter);
  return;
}

PollManager pollMgr = PollManager.getInstance();
request.setAttribute("poll", poll);
boolean showResults = pollMgr.hasAlreadyVoted(poll, loggedMember) || !channel.isDataWriteEnabled() || appHandler.showPollResult();
//request.setAttribute("skipVoteFooter",false);
%>
<jalios:javascript>
  window.history.replaceState(history.state, "<%= encodeForJavaScript(poll.getTitle(userLang)) %>", "<%= poll.getDisplayUrl(userLocale) %>" + (window.top.location.hash ? window.top.location.hash : ''));
</jalios:javascript>
<div class="container-fluid">
  <div class="row">
    <div class="col-xs-12">
      <jalios:breadcrumb items="<%= appHandler.getBreadcrumbItems() %>" />
      
      <% Publication publication = poll, pub = poll; %>
      <div class="selection-header">
        <%@ include file='/jcore/doDisplayHeader.jspf' %>
      </div>
      
      <%@ include file="/plugins/DBPollPlugin/jsp/poll.jspf" %>     
    </div>
  </div>
</div>
<% request.removeAttribute("poll"); %>