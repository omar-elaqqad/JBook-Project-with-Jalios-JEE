<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.dbpoll.*"  %>
<% 
  request.setAttribute("title", glp("jcmsplugin.dbpoll.lbl.all-polls"));
  request.setAttribute("jcms.jcmsplugin.poll.allpolls",true);
  PollManager pollMgr = PollManager.getInstance();
  
  String workspaceId = getDataIdParameter("wsId"); 
  Workspace pollWs = channel.getWorkspace(workspaceId);
  String allPollsTitle = glp("jcmsplugin.dbpoll.lbl.all-polls"); 
  
  jcmsContext.addCSSHeader("plugins/DBPollPlugin/css/poll.css");
  
  Set<Poll> pollSet = pollWs != null ? channel.getPublicationSet(Poll.class, loggedMember, true, pollWs) : channel.getPublicationSet(Poll.class, loggedMember);
%>
<div class="all-poll">
  <h1><% /* %>All polls<% */ %><%= allPollsTitle %></h1>
  <jalios:pager name='pollPager' declare='true' action='init' size='<%= pollSet.size() %>' pageSize="2" />
  <% if (Util.notEmpty(pollSet)) { %>
    <div class="container-fluid">
      <div class="row">
        <jalios:foreach name='itPoll' type='Poll' collection='<%= pollSet %>' max='<%= pollPager.getPageSize() %>' skip='<%= pollPager.getStart() %>'>
          <% 
            request.setAttribute("poll", itPoll); 
            boolean showResults = pollMgr.hasAlreadyVoted(itPoll, loggedMember) || !channel.isDataWriteEnabled();
          %>
          <div class="col-md-6">
            <% AbstractPoll poll = itPoll; %>
            <%@ include file="/plugins/DBPollPlugin/jsp/poll.jspf" %>
          </div>
          <% request.removeAttribute("poll"); %>
        </jalios:foreach>
      </div>
    </div>
    <jalios:pager name='pollPager' />
  <% } %>
</div>