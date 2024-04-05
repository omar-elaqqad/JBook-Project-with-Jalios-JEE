<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. --%>
<%--
  @Summary: GuestRequest report page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
SortedSet tmpResultSet = channel.getPublicationSet(GuestRequest.class, loggedMember, false);
if (Util.isEmpty(tmpResultSet)) {
  return;
}
//set are sorted by Cdate DESC
SortedSet resultSet = new TreeSet(ComparatorManager.getComparator(Publication.class, "cdate", true));
resultSet.addAll(tmpResultSet);
Date firstDate = ((Data)resultSet.first()).getCdate();
Date lastDate = ((Data)resultSet.last()).getCdate();
int counter = 0;
DecimalFormat decimalFormat = new DecimalFormat("#.##");
int tableWidth = 400;
IntegerFormReport intReport;
EnumerateFormReport enumReport;
%>
<p class='t1'><%= channel.getTypeLabel(GuestRequest.class, userLang) %></p>
<%-- --- Summary ---------------------------------------------------------------------- --%>
<table class="table-data table-condensed">
  <tr>
    <th colspan="2"><% /* %>Summary<% */ %><%= glp("ui.work.report.lbl.summary") %></th>
  </tr>
  <tr>
    <td><% /* %>Submit count<% */ %><%= glp("ui.work.report.lbl.nb-submit") %></td>
    <td align='right'><% /* %>1234<% */ %><%= resultSet.size() %></td>
  </tr>
  <tr>
    <td><% /* %>First submit<% */ %><%= glp("ui.work.report.lbl.fst-submit") %></td>
    <td align='right'><jalios:date date='<%= firstDate %>' /> <jalios:time date='<%= firstDate %>' /></td>
  </tr>
  <tr>
    <td><% /* %>Last submit<% */ %><%= glp("ui.work.report.lbl.lst-submit") %></td>
    <td align='right'><jalios:date date='<%= lastDate %>' /> <jalios:time date='<%= lastDate %>' /></td>
  </tr>
  <tr>
    <td><% /* %>Duration<% */ %><%= glp("ui.work.report.lbl.duration") %></td>
    <td align='right'><jalios:duration begin='<%= firstDate %>' end='<%= lastDate %>' /></td>
  </tr>
</table>
<br />
  <%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- J+irOEf3oGPZh+WP1fEqxQ== --%>