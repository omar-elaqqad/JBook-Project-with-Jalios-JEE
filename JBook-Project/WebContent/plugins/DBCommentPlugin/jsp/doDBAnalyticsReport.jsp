<%@page import="com.jalios.jcmsplugin.dbcomment.DBCommentReportMetric"%>
<%@page import="java.util.Map.Entry"%><%
%><%@page import="com.jalios.jcms.analytics.agent.*"%><%
%><%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%
%><%@ include file='/jcore/doInitPage.jspf'%><%

AnalyticsManager instance = AnalyticsManager.getInstance();

ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");
Date endDate = formHandler.getAvailableEndDate();
endDate = DateUtil.getDayEndDate(endDate, userLocale);
Date beginDate = formHandler.getAvailableBeginDate();
String wkId = formHandler.getAnalyticsWS();
Workspace wk = channel.getData(Workspace.class, wkId);
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, DBCommentReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.notEmpty(metricSet)){
  Map<String, ContentTopValue> aggregatedPubCommentMap = new HashMap();

  //fill with empty report in period if report are missing
  AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, DBCommentReportMetric.class);
  metricSet = AnalyticsManager.aggregateAllUrid(metricSet,DBCommentReportMetric.class);
  
  Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
  Date latestDate = null;
  while(metricIt.hasNext()){
    DBCommentReportMetric metric = (DBCommentReportMetric) metricIt.next();
    Date reportStartDate =  metric.getStartDate();
    if(latestDate == null || latestDate.getTime()<= reportStartDate.getTime()){
      aggregatedPubCommentMap.clear();
      aggregatedPubCommentMap.putAll(AnalyticsManager.getDeserializedContentTopMap(metric.getPubCommentTop()));
    }
  }
  SortedMap<String, ContentTopValue> sortedAggregatedPubCommentMap = AnalyticsManager.getSortedContentTopMap(aggregatedPubCommentMap, 10);
  %>
    <div class="col-md-6 report-element contentTop">
      <h3><%=glp("jcmsplugin.dbcomment.commentTop-section") %></h3>
      <p class="help-block"><%=glp("jcmsplugin.dbcomment.commentTop-section.help") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th></th>
            <th class="spacer text-overflow"><%=glp("jcmsplugin.dbcomment.commentTop.name") %></th>
            <th class="text-overflow"><%= glp("jcmsplugin.dbcomment.commentTop.number") %></th>
          </tr>
        </thead>
        <tbody>
          <% if (Util.isEmpty(sortedAggregatedPubCommentMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= sortedAggregatedPubCommentMap.entrySet() %>" name="entry" type="Map.Entry<String, ContentTopValue>">
          <%
              String pubId = entry.getKey();
              ContentTopValue topValue  = entry.getValue();
              Publication pub = channel.getData(Publication.class, pubId);
              String title = pub == null ? topValue.getTitle() : pub.getTitle(userLang);
              int nbr = topValue.getRequestCount();
          %>
          <tr>
            <td class="fit text-right"><%= itCounter %></td>
            <td class="expand"><%
            if(pub == null) {
              %><%=title %><%
            }else{
              %><jalios:dataicon data="<%= pub %>" /> <%
              %><jalios:link data="<%=pub%>"/><%
            }
            %></td>
            <td class="fit text-right"><%=nbr%></td>
          </tr>
          </jalios:foreach>
          <% } %>
        </tbody>
      </table>
    </div>    
  <%}%>