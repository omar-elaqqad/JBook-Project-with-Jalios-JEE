<%@ page import="javax.sql.*, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.ResultSetMetaData" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (!channel.getBooleanProperty("channel.dbrecord.enabled", true)) {
  sendForbidden(request, response);
  return;
}

%><%@ include file="/jcore/doEmptyHeader.jspf" %><%

String dataSourceStr = getStringParameter("ds", null, HttpUtil.DATASOURCE_REGEX);

DataSource dataSource = DBUtil.getDataSource(dataSourceStr);
if (dataSource == null) {
  return;
}
String table = getAlphaNumParameter("table", null);
String columns =  getAlphaNumParameter("columns", "*");
String keyCol = getAlphaNumParameter("keyCol", null);
String labelCol = getAlphaNumParameter("labelCol", null); 
String orderBy = getAlphaNumParameter("orderBy", null);
int maxRows = getIntParameter("maxRows", 100);

if(!columns.equals("*")) {
  // Add label column if it's not present in the list of columns to display
  if(labelCol != null && !columns.contains(labelCol)) {
    columns = labelCol + "," + columns;
  }
  // Add key column if it's not present in the list of columns to display
  if(keyCol != null && !columns.contains(keyCol)) {
    columns = keyCol + "," + columns;
  }
}

String sqlQuery = "select " + columns + " from " + table + (Util.notEmpty(orderBy) ? " ORDER BY " + orderBy : "");
logger.debug("sqlQuery: " + sqlQuery);
logger.debug("maxRows: " + maxRows);
boolean showRadioInsert = true;
boolean showCheckInsert = false;
%>
<%@ include file="/work/doInsertLinkParams.jspf" %>
<%@ include file="/work/doInsertLinkPopup.jspf" %>

<jalios:sqlquery name="sqr" dataSource="<%= dataSourceStr %>" query="<%= sqlQuery %>" maxRows="<%= maxRows %>" />

<div class="WorkArea">

  <div class="page-header"><h1><jalios:icon src="dbrecord" /> <%= glp("ui.adm.type-edit.lbl.ed.dbrecord") %></h1></div>

  <%-- *** ERROR ******************************* --%>
  <% if (sqr.isError()) { %>
    <jalios:message level="<%= MessageLevel.WARN %>" title="ui.sql.lbl.error" dismissable="false">
      <pre><%= encodeForHTML(sqr.getSQLQuery()) %></pre>
      <ul>
        <li><label><%= glp("ui.sql.lbl.err-msg") %> :</label> <%= encodeForHTML(sqr.getErrorMessage()) %></li>
        <li><label><%= glp("ui.sql.lbl.err-code") %> :</label> <%= sqr.getErrorCode() %></li>
        <li><label><%= glp("ui.sql.lbl.err-state") %> :</label> <%= encodeForHTML(sqr.getSQLState()) %></li>
      </ul>
    </jalios:message>
  
  <%-- *** NO RESULT ******************************* --%>
  <% } else if (sqr.isEmpty()) { %>
    <jalios:message title="" msg='<%= glp("ui.sql.lbl.result", 0) %>' dismissable="false" />
  
  <%-- *** DISPLAY RESULT ******************************* --%>
  <% } else { %>
    <jalios:pager name="dbrcPagerHandler" declare="true" action="init" size="<%= sqr.getRowList().size() %>" />
  
    <table class="table-data table-condensed">
      <tr>
        <th class="listHeader text-overflow" >&nbsp;</th>
        <th class="listHeader text-overflow" >&nbsp;</th>
        <jalios:foreach array="<%= sqr.getColumnNames() %>" name="itColName" type="String">
          <th class="listHeader text-overflow"><%= encodeForHTML(itColName) %></th>
        </jalios:foreach>
      </tr>
    
      <jalios:foreach collection="<%= sqr.getRowList() %>" 
                      name="itRow" 
                      type="SQLQueryResult.Row"
                      max="<%=  dbrcPagerHandler.getPageSize() %>"
                      skip="<%= dbrcPagerHandler.getStart() %>"
                      counter="rowCounter">
        <% String rowId = keyCol != null ? Util.getString(itRow.getObject(keyCol), "") : itRow.get(0); %>
        <% String rowLabel = labelCol != null ? Util.getString(itRow.getObject(labelCol), "") : rowId; %>
        <tr>
          <td class="text-center fit">
            <input type="radio" onclick='javascript:insertLink("<%= encodeForJavaScript(rowId) %>", "<%= encodeForJavaScript(rowLabel) %>", "<%= targetInput %>", "<%= targetLabel %>")' />
          </td>
          <td class="numeric fit"><%= dbrcPagerHandler.getStart() + rowCounter.intValue()%>.</td>
          <jalios:foreach collection="<%= itRow.getColumnList() %>" name="itCol" type="Object" counter="colCounter">
            <td><%= encodeForHTML(Util.getString(itCol, "")) %></td>
          </jalios:foreach>
        </tr>
      </jalios:foreach>
    </table>
    
    <jalios:pager name="dbrcPagerHandler" />
  
  <% } %>
</div>
<%@ include file="/jcore/doEmptyFooter.jspf" %>