<%--
  @Summary: Portlet Poll Box Display
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ page import="com.jalios.jcmsplugin.dbpoll.*" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.dbpoll.PollVoteHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
  %><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true' /><%
%></jsp:useBean><%

if (!isLogged) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

if (formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
}

PortletPoll box = (PortletPoll) portlet;
jcmsContext.addCSSHeader("plugins/DBPollPlugin/css/poll.css");

boolean refineWorkspace = Util.toBoolean(box.getRefineWorkspace(),false);

// Get the poll to display
PollManager pollMgr = PollManager.getInstance();
AbstractPoll poll = pollMgr.getCurrentPoll(box.getPoll(), request, loggedMember,refineWorkspace ? workspace : null);

if (poll == null && box.getHideWhenNoResults()) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

boolean isDataWriteEnabled = channel.isDataWriteEnabled();   

request.setAttribute("poll", poll);
request.setAttribute("jcms.jcmsplugin.poll.portletpollctxt", true);

if (poll != null) {
  boolean showResults = pollMgr.hasAlreadyVoted(poll, loggedMember) || !channel.isDataWriteEnabled() || getBooleanParameter("showResults",false);
  boolean opSwitch = getBooleanParameter("opSwitch", false);

  if (opSwitch) {
    PollManager.getInstance().switchPollStatus((Poll)poll, loggedMember);
  }
%>
  <%@ include file="/plugins/DBPollPlugin/jsp/poll.jspf" %>
  <% request.removeAttribute("poll"); %>
<%-- ALL POLL LINK ---------------------- --%>
<% 
  String workspaceParams = refineWorkspace ? "&amp;ws="+workspace.getId() : "";
  String allPollsLinkText = glp("jcmsplugin.dbpoll.lbl.view-all-polls"); 
%>
<p>
  <%--
  <jalios:link data='<%= jcmsContext.getCurrentCategory() %>'
               params='<%= "&amp;jsp=plugins/DBPollPlugin/jsp/doAllPolls.jsp" + workspaceParams  %>'>
    <%= allPollsLinkText %>
  </jalios:link>
  
  <a href='plugins/DBPollPlugin/jsp/app/dbpoll.jsp<%= refineWorkspace ? "?ws="+workspace.getId() : "" %>' class="redirect-to-app">
    <%= allPollsLinkText %>
  </a>
  --%>
</p>

<% } else { %>
  <jalios:portletBoxNoResult icon="no-result" text="ui.com.lbl.sorry-no-result" />
  <a class="btn btn-default btn-access-app" href="<%= pollMgr.getAppDisplayUrl(workspace) %>"><%= glp("jcmsplugin.dbpoll.btn.access-the-app") %></a>
<% } %>

<%--
<% if (pollMgr.canPublishPoll(loggedMember,workspace)) {%>
  <div class="item-box-footer">
    <button class="btn btn-default btn-add-poll" type="button" data-jalios-action="modal" data-jalios-modal-url="plugins/DBPollPlugin/jsp/addPoll.jsp">
      <jalios:icon src="add" /> <%= glp("jcmsplugin.dbpoll.lbl.create-poll") %>
    </button>
  </div>
<%} %>
--%>