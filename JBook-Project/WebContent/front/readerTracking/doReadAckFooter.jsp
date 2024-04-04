<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.tracking.ReaderTracker" %><%
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%

if (!Util.toBoolean(request.getAttribute("skipReadAckFooter"),false)) {

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.tracking.ReadAckHandler"><%
%><jsp:setProperty name="formHandler" property="request"       value="<%= request %>"/><%
%><jsp:setProperty name="formHandler" property="response"      value="<%= response %>"/><%
%><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
formHandler.validate();

Publication pub = formHandler.getPublication(); 

if (pub.getReadAck() && ReaderTrackerManager.getInstance().isReaderTrackerEnabled()) {
  ReaderTracker readerTracker = pub.getReaderTracker(loggedMember);
%>

<div class="read-ack-footer ajax-refresh-div" data-jalios-ajax-refresh-url="front/readerTracking/doReadAckFooter.jsp">
  <% if (readerTracker != null && readerTracker.hasBeenAck()) { %>
  <jalios:message level="<%= MessageLevel.SUCCESS %>" title="readertracker.ack.done.title" dismissable="false">
  <p><%= glp("readertracker.ack.done.text", JcmsUtil.getFriendlyDate(readerTracker.getAckDate(), DateFormat.FULL, true, userLocale)) %></p>
  </jalios:message>
  <% } else { %>
  <form action="front/readerTracking/doReadAckFooter.jsp" method="POST">
    <jalios:message level="<%= MessageLevel.INFO %>" title="readertracker.ack.mandatory.title" dismissable="false">
      <p><%= glp("readertracker.ack.mandatory.text") %></p>
      <p><button type="submit" name="opAck" value="true" class="btn btn-primary ajax-refresh" ><%= glp("readertracker.ack.mandatory.btn") %></button></p>
    </jalios:message>
    <input type="hidden" name="pubId" value="<%= pub.getId() %>" />
  </form>
  <% } %>
</div>
<% } %>
<% request.setAttribute("skipReadAckFooter", Boolean.TRUE); %>
<% } %>