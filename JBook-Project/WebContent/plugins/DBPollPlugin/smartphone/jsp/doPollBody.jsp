<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.*" %><%

Poll poll = (Poll) request.getAttribute("poll");

if (poll == null) {
  poll = (Poll) getPublicationParameter("id");
}

PollManager pollMgr = PollManager.getInstance();
boolean hasAlreadyVoted = pollMgr.hasAlreadyVoted(poll, loggedMember);
boolean showResults = hasAlreadyVoted || !channel.isDataWriteEnabled() || getBooleanParameter("showResults", false);
List<String> optionLabels = Util.getArrayList(poll.getOptions(userLang,true));
List<String> values = new ArrayList<String>();

for (int i = 1; i <= optionLabels.size(); i++) {
  values.add("" + i);
}
%>

<div class="poll-content">
	<jalios:thumbnail data="<%= poll %>" width="960" height="640" />
	
	<div class="body">
		<div class="title"><%= poll.getTitle(userLang) %></div>
		<% String description = Util.getString(poll.getDescription(userLang), "");
		if (Util.notEmpty(description)) { %>
		  <jalios:wiki><%= description %></jalios:wiki>
		<% } %>
		
		<% if (showResults) { %>
		  <%@ include file='/plugins/DBPollPlugin/smartphone/jsp/doPollResult.jspf' %>
		<% } else { %>
			<form action='plugins/DBPollPlugin/jsp/pollVote.jsp' method='post'>
			  <div class="answers">
			    <jalios:field name="vote" resource="field-light">
			      <jalios:control settings="<%= new EnumerateSettings().radio().enumValues(values.toArray(new String[]{})).enumLabels(optionLabels.toArray(new String[]{})) %>"/>
			    </jalios:field>
			  </div>
			
			  <div>
			    <% if (Util.notEmpty(optionLabels) && !poll.isClosed()) { %>
			    <button type='submit' name='opVote' class='btn btn-primary' value="true"><%= glp("jcmsplugin.dbpoll.btn.vote") %></button>
			    <% } %>
			  </div>
			
			  <input type='hidden' name='redirect' value="<%= ServletUtil.getUrl(request) %>" />
			  <input type='hidden' name='poll' value="<%= poll.getId() %>" />    
			</form>
			
		<a class="ajax-refresh ui-btn" data-jalios-ajax-target=".poll-content" data-jalios-ajax-params='{"id": "<%= poll.getId() %>", "showResults": "true"}' href="plugins/DBPollPlugin/smartphone/jsp/doPollBody.jsp"><%= glp("jcmsplugin.dbpoll.lbl.show-result") %></a>
	
		<% } %>
	</div>
</div>