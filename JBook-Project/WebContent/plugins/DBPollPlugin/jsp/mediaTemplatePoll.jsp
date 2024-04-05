<%--
  @Summary: Template used to display poll using media manager
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.PollManager" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null || !(data instanceof Poll)) {
  data = getDataParameter("poll");
  
  if (data == null || !(data instanceof Poll)) {
    return;
  }
}

if (getPublicationParameter("ttId") != null) {
  return;
}

Poll poll = (Poll) data;
PollManager pollMgr = PollManager.getInstance();
jcmsContext.addCSSHeader("plugins/DBPollPlugin/css/poll.css");
request.setAttribute("poll", poll);

List<String> optionLabels = Util.getArrayList(poll.getOptions(userLang,true));
List<String> values = new ArrayList<String>();
for (int i = 1; i <= optionLabels.size(); i++) {
  values.add("" + i);
}

boolean showResults = pollMgr.hasAlreadyVoted(poll, loggedMember) || !channel.isDataWriteEnabled() || poll.isClosed();

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.dbpoll.PollVoteHandler'><%
	%><jsp:setProperty name='formHandler' property='request' value='<%= request %>' /><%
	%><jsp:setProperty name='formHandler' property='response' value='<%= response %>' /><%
	%><jsp:setProperty name='formHandler' property='*' /><%
	%><jsp:setProperty name='formHandler' property='noRedirect' value='true' /><%
%></jsp:useBean><%
if (hasParameter("opVote") && formHandler.validate()) {
	HibernateUtil.commitTransaction();
	HibernateUtil.beginTransaction();
	showResults = true;
}

jcmsContext.addCSSHeader("css/lib/toastr/toastr.css");
jcmsContext.addCSSHeader("css/jalios/core/components/toastr/jalios-toastr.css");
jcmsContext.addJavaScript("js/lib/toastr/toastr.js");
%>
<jalios:javascript>
  var pollInputId = window.parent.parent.document.querySelector("[name=id]");
  
  if (pollInputId == null || pollInputId.value != "<%= poll.getId() %>") {
    // useful if we are inside a portlet
    pollInputId = window.parent.parent.document.querySelector("[name=poll]");
  }
  
  if (pollInputId && pollInputId.value == "<%= poll.getId() %>") {
    var notNestedPoll = window.parent.document.querySelector('[data-mce-p-data-jalios-media-source="<%= poll.getId() %>"]');
    
    // only if the current poll isn't inside another poll description
    if (notNestedPoll) {    
	    // toastr doesn't work on full edition
	    if (!window.parent.parent.document.querySelector("[name=popupEdition]")) {
	      var toastr = "toastr.options.positionClass = 'toast-top-center'; toastr.error('<%= glp("jcmsplugin.dbpoll.msg.poll-loop") %>');";
	      window.parent.parent.eval(toastr);
	    }
	    
	    notNestedPoll.parentElement.remove();
	    
	    return;
	  }
  }
  
  var wysiwygSpan = window.parent.document.querySelector('[data-mce-p-data-jalios-media-source="<%= poll.getId() %>"]');
  
  // only if we are currently inside of a wysiwyg editor
  if (wysiwygSpan) {
    wysiwygSpan.style.width = "100%";
  }
</jalios:javascript>
<div class="media-template-poll">
	<% if (showResults) { %>
    <% request.setAttribute("jcmsplugin.poll.detailed-display", false); %>
    <% request.setAttribute("jcmsplugin.poll.show-title", true); %>
    <% request.setAttribute("jcmsplugin.poll.inserted-poll", Util.toBoolean(request.getAttribute("jcmsplugin.poll.inserted-poll"), false)); %>
	  <jsp:include page="/plugins/DBPollPlugin/jsp/doPollResult.jsp"></jsp:include>
  <% } else { %>
	  <div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/DBPollPlugin/jsp/mediaTemplatePoll.jsp">
	    
	    <% if (Util.notEmpty(poll.getImage()) && new File(channel.getRealPath(poll.getImage())).exists()) { %>
	      <jalios:thumbnail path="<%= poll.getImage() %>" width="960" height="640" css="poll-image" />
	    <% } %>
	    
	    <h3 class="poll-title"><%= poll.getTitle(userLang) %></h3>
	    
	    <div class="poll-container">
	      
	      <% if (!Util.toBoolean(request.getAttribute("jcmsplugin.poll.inserted-poll"), false)) { %>
	        <%@ include file='doPollDescription.jspf' %>
	      <% } %>
	      
		    <%@ include file='/jcore/doMessageBox.jspf' %>
		    
		    <form>
		      <div class="poll-answers">
		        <jalios:field name="vote" resource="field-light">
		          <jalios:control settings="<%= new EnumerateSettings().radio().enumValues(values.toArray(new String[]{})).enumLabels(optionLabels.toArray(new String[]{})) %>"/>
		        </jalios:field>
		      </div>
		      <div class="poll-footer">
		        <% if (Util.notEmpty(optionLabels) && !poll.isClosed()) { %>
		        <button type='submit' name='opVote' data-jalios-action="ajax-refresh" class='btn btn-primary' value="true"><%= glp("jcmsplugin.dbpoll.btn.vote") %></button>
		        <% } %>
		        <jalios:link data="<%= poll %>" css="btn btn-default" params="showResults=true"><%= glp("jcmsplugin.dbpoll.lbl.show-result") %></jalios:link>
		      </div>
		      <input type='hidden' name='poll' value="<%= poll.getId() %>" />    
		    </form>
	    </div>
	    
	  </div>
	<% } %>
</div>