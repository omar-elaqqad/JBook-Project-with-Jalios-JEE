<%@ page import="javax.sql.DataSource" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!channel.getBooleanProperty("channel.dbrecord.enabled", true)) {
  sendForbidden(request, response);
  return;
}

%><%@ include file='/jcore/doHeader.jspf' %><%

String dataSourceStr = getStringParameter("dataSource", null, HttpUtil.DATASOURCE_REGEX);
DataSource dataSource = DBUtil.getDataSource(dataSourceStr);
if (dataSource == null) {
  return;
}
String table  = getAlphaNumParameter("table", null);
String keyCol = getAlphaNumParameter("keyCol", null); 
String keyVal = getAlphaNumParameter("keyVal", null);

SQLQueryResult sqr = new SQLQueryResult(dataSourceStr, "*", table, null, new String[]{keyCol} , new String[]{keyVal} , true,  1);
%>
<%-- *** ERROR ******************************* --%>
<% if (sqr.isError() && isWSAdmin) { %>
  <jalios:message level="<%= MessageLevel.WARN %>" title="ui.sql.lbl.error" dismissable="false">
    <pre><%= encodeForHTML(sqr.getSQLQuery()) %></pre>
    <ul>
      <li><%= glp("ui.sql.lbl.err-msg") %> <%= encodeForHTML(sqr.getErrorMessage()) %></li>
      <li><%= glp("ui.sql.lbl.err-code") %> <%= sqr.getErrorCode() %></li>
      <li><%= glp("ui.sql.lbl.err-state") %> <%= encodeForHTML(sqr.getSQLState()) %></li>
    </ul>
  </jalios:message>
<%-- *** NO RESULT ******************************* --%>
<% } else if (sqr.isEmpty()) { %>
    <jalios:message title="" msg='<%= glp("ui.sql.lbl.result", 0) %>' dismissable="false" />

<%-- *** DISPLAY RESULT ******************************* --%>
<% } else { %>
<% SQLQueryResult.Row row =(SQLQueryResult.Row)sqr.getRowList().get(0); %>

<div class="fulldisplay dbrecord">
  <table class="table-data table-condensed">
   <% for (int i = 0; i < sqr.getColumnNames().length; i++) { %>
    <tr class="field">
      <th class='column-label'><%= encodeForHTML(sqr.getColumnNames()[i]) %></th>
      <td class='column-data'><%= encodeForHTML(Util.getString(row.get(i), "")) %></td>
    </tr>
   <% } %>
  </table>
</div>
<% } %>
<%@ include file='/jcore/doFooter.jspf' %>