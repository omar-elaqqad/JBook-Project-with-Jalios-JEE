<%@ page import="javax.sql.DataSource" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!channel.getBooleanProperty("channel.sqlquery.enabled", true)) {
    sendForbidden(request, response);
    return;
  }

  if (!isLogged || !loggedMember.isWorker()){
    jcmsContext.sendForbidden();
    return;
  }

%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
String dataSourceStr = getStringParameter("dataSource", null, HttpUtil.DATASOURCE_REGEX);
DataSource dataSource = DBUtil.getDataSource(dataSourceStr);
if (dataSource == null) {
  return;
}

String sqlQuery = getUntrustedStringParameter("sqlQuery", null); // ENCODE !! 
int maxRows = getIntParameter("maxRows", 100);
request.setAttribute("dataSource", dataSourceStr);
request.setAttribute("sqlQuery", sqlQuery);
request.setAttribute("maxRows", String.valueOf(maxRows));
%>
<div class="WorkArea">
  <jalios:message title="" dismissable="false">
    <div><label><%= glp("ui.com.lbl.datasource") %> :</label> <%= encodeForHTML(channel.getDataSourceLabel(dataSourceStr, userLang)) %></div>
    <div><label><%= glp("ui.com.lbl.max-rows") %> :</label> <%= maxRows %></div>
    <pre><%= encodeForHTML(sqlQuery) %></pre>
  </jalios:message>
  <jsp:include page='/jcore/doDisplaySQLQuery.jsp'/>
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>