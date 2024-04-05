<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.dbpoll.*" %><%
%><%
boolean refineWorkspace = false;
%>

<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/DBPollPlugin/jsp/app/dbpoll.jsp">
  <%@ include file='/plugins/DBPollPlugin/jsp/app/doDBPoll.jspf' %>
</div>

<%@ include file='/jcore/doFooter.jspf' %>