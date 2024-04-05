<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.*" %><%

Poll poll = (Poll)request.getAttribute("poll");
boolean isInPortletPoll = Util.toBoolean(request.getAttribute("jcms.jcmsplugin.poll.portletpollctxt"),false);
boolean isActivityCtxt = Util.toBoolean(request.getAttribute("jcmsplugin.dbpoll.activity-ctxt"), false);
boolean isAllPoll = Util.toBoolean(request.getAttribute("jcms.jcmsplugin.poll.allpolls"),false);

List<String> optionLabels = Util.getArrayList(poll.getOptions(userLang,true));
List<String> values = new ArrayList<String>();
for (int i=1; i<=optionLabels.size(); i++) {
  values.add(""+i);
}
%>
<div class="poll-form">

	<% if (Util.notEmpty(poll.getImage()) && new File(channel.getRealPath(poll.getImage())).exists()) { %>
	  <jalios:thumbnail path="<%= poll.getImage() %>" width="960" height="640" css="poll-image" />
	<% } %>

  <% if (!isActivityCtxt) { %>
    <% if (isInPortletPoll) { %>
    <h3 class="poll-title"><jalios:link data="<%= poll %>" css="noTooltipCard"><%= poll.getTitle(userLang) %></jalios:link></h3>
    <% } else { %>
    <h1 class="poll-title"><%= poll.getTitle(userLang) %></h1>
    <% } %>
  <% } %>
  
  <%@ include file='doPollDescription.jspf' %>

  <%@ include file='/jcore/doMessageBox.jspf' %>
  
  <% if (!isInPortletPoll && !isActivityCtxt) { %>
    <%@ include file='doPollInformation.jspf' %>
  <% } %>
    
  <form action='plugins/DBPollPlugin/jsp/pollVote.jsp' method='post'>
    <div class="poll-answers br">
      <jalios:field name="vote" resource="field-light">
        <jalios:control settings="<%= new EnumerateSettings().radio().enumValues(values.toArray(new String[]{})).enumLabels(optionLabels.toArray(new String[]{})) %>"/>
      </jalios:field>
    </div>

    <div class="poll-footer">
      <% String focusCss = "." + poll.getId() + "_focus"; %>
      <% if (Util.notEmpty(optionLabels) && !poll.isClosed()) { %>
      <button type='submit' name='opVote' class='btn btn-primary'<% if (isInPortletPoll || isActivityCtxt) { %> data-jalios-action="ajax-refresh" data-jalios-ajax-refresh-focus-element="<%= focusCss %>"<% } %> value="true"><%= glp("jcmsplugin.dbpoll.btn.vote") %></button>
      <% } %>
      <% if (isInPortletPoll) { %>
        <a role="button" data-jalios-options='{"nohistory":"true","params":{"poll":"<%= poll.getId() %>","showResults":"true"}}' data-jalios-action="ajax-refresh" class="btn btn-default" <%= isInPortletPoll ? new DataAttribute().addData("jalios-ajax-refresh-focus-element", focusCss) : "" %>><%= glp("jcmsplugin.dbpoll.lbl.show-result") %></a>
      <% } else { %>
        <jalios:link data="<%= poll %>" css="btn btn-default" params="showResults=true"><%= glp("jcmsplugin.dbpoll.lbl.show-result") %></jalios:link>
      <% } %>
    </div>

    <input type='hidden' name='redirect' value="<%= ServletUtil.getUrl(request) %>" />
    <input type='hidden' name='poll' value="<%= poll.getId() %>" />    
  </form>

</div>
