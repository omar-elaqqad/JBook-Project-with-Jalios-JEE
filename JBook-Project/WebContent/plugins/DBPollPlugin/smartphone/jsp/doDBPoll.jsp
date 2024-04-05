<%@ page import="com.jalios.jcmsplugin.dbpoll.DBPollAppHandler.PollStatus" %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.smartphone.JMobileDBPollAppHandler.SmartphoneTab" %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.*" %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.smartphone.*" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><jsp:useBean id="appHandler" scope="page" class="com.jalios.jcmsplugin.dbpoll.smartphone.JMobileDBPollAppHandler"><%
  %><jsp:setProperty name="appHandler" property="request"  value="<%= request %>" /><%
  %><jsp:setProperty name="appHandler" property="response" value="<%= response %>" /><%
  %><jsp:setProperty name="appHandler" property="*" /><%
%></jsp:useBean><%

appHandler.validate();

String divClass = "dbpoll-content";

String openedPollsActive = appHandler.showOpenedPolls() ? "ui-btn-active" : "";
String closedPollsActive = appHandler.showClosedPolls() ? "ui-btn-active" : "";

String refreshUrl = "plugins/DBPollPlugin/smartphone/jsp/doDBPoll.jsp?selectedTab=";
%>

<div class="application-launcher-tabs nav-menu <%= divClass %>">
  <div data-role="navbar" class="ui-navbar" role="navigation">
    <ul>
      <li><a class="ajax-refresh <%= openedPollsActive %>" data-jalios-ajax-target=".<%= divClass %>" href="<%= refreshUrl %><%= SmartphoneTab.OPENED.toString() %>"><%= glp("jcmsplugin.smartphone.dbpoll.navbar.opened") %></a></li>
      <li><a class="ajax-refresh <%= closedPollsActive %>" data-jalios-ajax-target=".<%= divClass %>" href="<%= refreshUrl %><%= SmartphoneTab.CLOSED.toString() %>"><%= glp("jcmsplugin.smartphone.dbpoll.navbar.closed") %></a></li>
    </ul>
  </div>
  
  <%@ include file='/plugins/DBPollPlugin/smartphone/jsp/doDBPollTab.jspf' %>
</div>