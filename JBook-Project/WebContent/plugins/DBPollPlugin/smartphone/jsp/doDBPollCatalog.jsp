<%@ page import="com.jalios.jcmsplugin.dbpoll.*" %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.smartphone.*" %><%
%><%@ page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager" %><%
%><%@ page import="com.jalios.jcms.taglib.card.CardBlockMode" %><%
%><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><jsp:useBean id="appHandler" scope="page" class="com.jalios.jcmsplugin.dbpoll.smartphone.JMobileDBPollAppHandler"><%
  %><jsp:setProperty name="appHandler" property="request"  value="<%= request %>" /><%
  %><jsp:setProperty name="appHandler" property="response" value="<%= response %>" /><%
  %><jsp:setProperty name="appHandler" property="*" /><%
%></jsp:useBean><%

appHandler.validate();
int skip = getIntParameter("skip", 0);
int max = 10;
appHandler.setStart(skip);
appHandler.setPageSize(max);
SortedSet<Publication> sortedResultSet = appHandler.getSortedResultSet(); 
PollManager pollMgr = PollManager.getInstance();

Map<String,String> paramMap = new HashMap<String, String>();
paramMap.put("skip", String.valueOf(skip + max));
%>
<% if (Util.isEmpty(sortedResultSet)) { %>
  <jalios:appBodyNoResult />
<% } else { %>
	<jalios:foreach collection="<%= sortedResultSet %>" type="Poll" name="poll" skip="<%= skip %>" max="<%= max %>">
	  <% int count = pollMgr.getPollResult(poll).getCount(); %>
	  <jalios:cardData css="rounded-card" data="<%= poll  %>" template="jmobile">
	    <jalios:buffer name="CARD_BOTTOM">
	      <jalios:cardBlock mode="<%= CardBlockMode.FOOTER %>">
	        <% if (count > 0) { %>
	          <jalios:icon src="icon.jcmsplugin-poll-stats"/>
	          <span><%= glp("jcmsplugin.dbpoll.lbl.vote-cnt", count) %> &middot; </span>
	        <% } %>
	        <jalios:date date="<%= poll.getCdate() %>" format="short" />
	      </jalios:cardBlock>
	    </jalios:buffer>
	  </jalios:cardData>
	</jalios:foreach>
  <% if ((skip + max) < Util.getSize(sortedResultSet)) { %>
    <% String url = "plugins/DBPollPlugin/smartphone/jsp/doDBPollCatalog.jsp?status=" + appHandler.getStatus(); %>
    <a class="ajax-refresh ui-btn showmore" data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getJsonString(paramMap) %>' data-jalios-ajax-action="<%= url %>"><%= glp("ui.com.txt.more-results") %></a>
  <% } %>
<% } %>