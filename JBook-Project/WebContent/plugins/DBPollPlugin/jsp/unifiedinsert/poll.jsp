<%@ page import="com.jalios.jcmsplugin.dbpoll.PollManager" %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ page import="com.jalios.jcms.unifiedinsert.*" %><%
request.setAttribute("UnifiedInsert", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id="appHandler" scope="page" class="com.jalios.jcmsplugin.dbpoll.DBPollAppHandler"><%
  %><jsp:setProperty name="appHandler" property="request"  value="<%= request %>"/><%
	%><jsp:setProperty name="appHandler" property="response" value="<%= response %>"/><%
	%><jsp:setProperty name="appHandler" property="types" value="<%= new String[] { Poll.class.getName() }  %>"/><%
	%><jsp:setProperty name="appHandler" property="workspace" value="<%= null %>" /><%
	%><jsp:setProperty name="appHandler" property="*" /><%
%></jsp:useBean><%

jcmsContext.addCSSHeader("plugins/DBPollPlugin/css/poll.css");

QueryResultSet queryResultSet = appHandler.getResultSet();
SortedSet<Publication> sortedResultSet = appHandler.getSortedResultSet();
PollManager pollMgr = PollManager.getInstance();
%>

<jalios:pager name='pagerHandler' declare='true' action='init'
                size='<%= sortedResultSet.size() %>'
                pageSize='12'
                pageSizes='12,24,36,60'
                sizeAccurate='<%= queryResultSet.isTotalAccurate()  %>'
                sort='<%= appHandler.getSort() %>'
                />
<% if (!jcmsContext.isAjaxRequest()) {
  jcmsContext.addJavaScript("js/jalios/ux/jalios-unifiedinsert.js");
  %><%@ include file='/jcore/doEmptyHeader.jspf' %><%
} %>

<div class="poll-unifiedinsert ajax-refresh-div" data-jalios-ajax-refresh-url="<%= ServletUtil.getResourcePath(request) %>">
  
  <%-- NAVBAR --%>
  <div class="navbar navbar-default br">
    <form class="layout" name="pollSearch" action="<%= ServletUtil.getResourcePath(request) %>"
          data-jalios-target="DIV.poll-unifiedinsert">
      <div class="container-fluid">

        <%-- Text search--%>
        <div class="navbar-right navbar-form">
          <div class="form-group">
            <jalios:field name='text' value='<%= appHandler.getText() %>' resource="field-light">
              <jalios:control settings='<%= new TextFieldSettings().placeholder("ui.com.placeholder.search") %>' />
              <span class="input-group-btn">
                <button class="btn btn-default ajax-refresh"
                  name="opSearch" type="submit">
                  <jalios:icon src="search" />
                </button>
              </span>
            </jalios:field>
          </div>
        </div>
        <%-- EOF .navbar-right --%>
      </div>
      <%-- EOF .container-fluid --%>
    </form>
  </div>

  <div class="poll-cards">
	  <jalios:cards css="is-centered">
	    <jalios:foreach collection="<%= sortedResultSet %>" name="poll" type="Poll"
	                    skip="<%= pagerHandler.getStart()%>"
	                    max="<%= pagerHandler.getPageSize() %>">
	      <% int count = pollMgr.getPollResult(poll).getCount(); %>
	      <% DataAttribute pollCardDataAttribute = new DataAttribute().addData("data-jalios-source", poll.getId()); %>
	      <% String pollCardCss = "unifiedinsert-media clickable"; %>
	      <jalios:cardData data="<%= poll %>" dataAttribute="<%= pollCardDataAttribute %>" css="<%= pollCardCss %>" >
	        <jalios:buffer name="CARD_BOTTOM">
	          <% if (pollMgr.hasAlreadyVoted(poll, loggedMember)) { %>
	            <div class="card-corner-right card-corner-triangle" title='<%= glp("jcmsplugin.dbpoll.msg.already-voted") %>'>
	              <jalios:icon src="appstore-installed" />
	            </div>
	          <% } %>
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
	  </jalios:cards>
  </div>
  
  <jalios:pager name='pagerHandler'/>  
  
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%
if (!jcmsContext.isAjaxRequest()) {
  %><%@ include file='/jcore/doEmptyFooter.jspf' %><%
}
%>