<%@page import="com.jalios.jcms.chart.RatioData"%>
<%@page import="com.jalios.jcms.chart.PieChart"%>
<%@page import="com.jalios.jcms.chart.series.RatioSeries"%>
<%@page import="com.jalios.jcms.chart.ChartUtil"%>
<%@page import="com.jalios.jcms.chart.TimeChart"%>
<%@page import="com.jalios.jcms.chart.series.TimeChartSeries"%>
<%@page import="java.util.Map.Entry"%><%
%><%@page import="com.jalios.jcms.analytics.agent.*"%><%  
%><%@page import="com.jalios.jcms.analytics.*"%><%  
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%  
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%  
%><%@page import="com.jalios.jcmsplugin.esn.analytics.*"%><%  
%><%@page import="com.jalios.jcmsplugin.esn.activity.*"%><%  
%><%@page import="com.jalios.jcmsplugin.esn.*"%><%  
%><%@ include file='/jcore/doInitPage.jspf' %><%  
  
%><div class="chart-result esn-report" style="overflow:hidden;"><%  
ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");  
Date endDate = formHandler.getAvailableEndDate();  
endDate = DateUtil.getDayEndDate(endDate, userLocale);  
Date beginDate = formHandler.getAvailableBeginDate();  
Workspace wk = channel.getData(Workspace.class, formHandler.getAnalyticsWS());  
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk, beginDate, endDate, null, ESNReportMetric.class);  
  
if (Util.isEmpty(metricSet)){  
  %><%=glp("ui.analytics.report.no-result")%><%  
}  
else{  
  TimeChartSeries activityCountSeries = new TimeChartSeries(glp("ui.analytics.ESNAgent.report.activity-count")).fill();  
  Map<String, Integer> aggregatedActivityMap   = new HashMap<String, Integer>();

  TimeChartSeries connectionRatioSeries     = new TimeChartSeries(glp("ui.analytics.ESNAgent.report.connection-ratio")).fill();
  TimeChartSeries followerRatioSeries       = new TimeChartSeries(glp("ui.analytics.ESNAgent.report.follower-ratio")).fill();
  TimeChartSeries followingRatioSeries      = new TimeChartSeries(glp("ui.analytics.ESNAgent.report.following-ratio")).fill();
  
  TimeChartSeries microbloggingSeries = new TimeChartSeries(glp("ui.analytics.ESNAgent.report.microblogging-count")).fill();

  TimeChartSeries accountProfileSeries = new TimeChartSeries(glp("ui.analytics.ESNAgent.report.account-profile-count")).fill();
  TimeChartSeries contactProfileSeries = new TimeChartSeries(glp("ui.analytics.ESNAgent.report.contact-profile-count")).fill();
  TimeChartSeries profileCompletenessSeries  = new TimeChartSeries(glp("ui.analytics.ESNAgent.report.profile-completeness")).fill();


  
 //fill with empty report in period if report are missing  
  AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, ESNReportMetric.class);  
  metricSet = AnalyticsManager.aggregateAllUrid(metricSet,ESNReportMetric.class);  

  for(AbstractReportMetric abstractMetric:  metricSet) {
    ESNReportMetric metric = (ESNReportMetric)abstractMetric;
    Date reportStartDate =  metric.getStartDate();  
    long time = AnalyticsManager.getUtcTime(reportStartDate, userLocale).getTimeInMillis();

    activityCountSeries.add(time, metric.getActivityCount());  
    
    AnalyticsManager.aggregateKeyIntegerMap(aggregatedActivityMap, metric.getActivityTop());
    
    accountProfileSeries.add(time, metric.getNewAccountProfileCount());  
    contactProfileSeries.add(time, metric.getNewContactProfileCount());  
    profileCompletenessSeries.add(time, metric.getProfileCompleteness());  
    connectionRatioSeries.add(time, metric.getConnectionRatio());  
    followerRatioSeries.add(time, metric.getFollowerRatio());  
    followingRatioSeries.add(time, metric.getFollowingRatio());  
    
    microbloggingSeries.add(time, metric.getMicrobloggingCount());  
  }
  
  SortedMap<String, Integer> topActivityMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedActivityMap, 10);
  
  int dayCount = metricSet.size();
  
  boolean isJCMS9 = JcmsInfo.RELEASE_MAJOR >= 9;
  
  int activityCountSummary = 0;
  int microbloggingCountSummary = 0;
  int connectionSummary = 0;

  int profileCompletenessSummary = 0;

  if (isJCMS9) {
    activityCountSummary = (int) Math.round(ChartUtil.sum(activityCountSeries));
    microbloggingCountSummary = (int) Math.round(ChartUtil.sum(microbloggingSeries));
    connectionSummary = (int) Math.round(ChartUtil.mean(connectionRatioSeries));
    profileCompletenessSummary = (int) Math.round(ChartUtil.max(profileCompletenessSeries));
  }
%>  
  <% if (isJCMS9) { %>
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-4">
        <div class="indicator">
          <div class="indicator-value"><%= activityCountSummary %></div>
          <div class="indicator-text"><%=glp("ui.analytics.ESNAgent.report.activity-count") %></div>        </div>
      </div>
      <div class="col-md-4 col-xs-6 col-sm-4">
        <div class="indicator">
          <div class="indicator-value"><%= connectionSummary %></div>
          <div class="indicator-text"><%=glp("ui.analytics.ESNAgent.report.connection-ratio") %></div>
        </div>       
      </div>
      <div class="col-md-4 col-xs-6 col-sm-4">
        <div class="indicator">
          <div class="indicator-value"><%= profileCompletenessSummary %>%</div>
          <div class="indicator-text"><%=glp("ui.analytics.ESNAgent.report.profile-completeness") %></div>
        </div>   
      </div>
    </div>
  </div>
  <% } %>

  <div class="row">   
    <div class="col-md-6 report-element activity-count">  
      <h3><%=glp("ui.analytics.ESNAgent.report.activity-count") %></h3>  
      <span class="help-block"><%=glp("ui.analytics.ESNAgent.report.activity-count.h") %></span>
      <jalios:chart chart='<%=new TimeChart().addSeries(activityCountSeries).setRoundXAxis("day") %>'/>  
    </div>  
    <div  class="col-md-6 report-element activity-top">
      <h3><%=glp("ui.analytics.ESNAgent.report.activity-top") %></h3>
      <p class="help-block"><%=glp("ui.analytics.ESNAgent.report.activity-top.h") %></p>
      <%
        RatioSeries topActivitySeries = new RatioSeries("");
        if(Util.notEmpty(topActivityMap)){
          for(Entry<String, Integer> entry : topActivityMap.entrySet()){
            String filterName = entry.getKey();
            MemberActivityFilter filter = MemberActivityFilter.getFromString(filterName);
            if (filter != null) {
              String label =  filter.getLabel(userLang);
              double value = 0d;
              if(entry.getValue() != null){
                value = entry.getValue().doubleValue();
              }
              topActivitySeries.add(label, value);
            }
          }
        }
        else{
          topActivitySeries.add(glp("ui.analytics.report.no-result"), new RatioData(100d, "#CCCCCC", null));
        }%>
        <jalios:chart chart='<%=new PieChart("").showPercent().doughnut().addSeries(topActivitySeries) %>' />
    </div>    
  </div>

  <div class="row">
    <div class="col-md-6 report-element network">  
      <h3><%=glp("ui.analytics.ESNAgent.report.network") %></h3>  
      <span class="help-block"><%=glp("ui.analytics.ESNAgent.report.network.h") %></span>        
      <jalios:chart chart='<%=new TimeChart().addSeries(connectionRatioSeries, followerRatioSeries, followingRatioSeries).setRoundXAxis("day") %>'/>
    </div>  

    <div class="col-md-6 report-element microblogging-count">  
      <h3><%=glp("ui.analytics.ESNAgent.report.microblogging-count") %></h3>  
      <span class="help-block"><%=glp("ui.analytics.ESNAgent.report.microblogging-count.h") %></span>
      <jalios:chart chart='<%=new TimeChart().addSeries(microbloggingSeries).setRoundXAxis("day") %>'/>  
    </div>  

  </div>

  <div class="row">  
    <div class="col-md-6 report-element profile-count">  
      <h3><%=glp("ui.analytics.ESNAgent.report.new-profile") %></h3>  
      <span class="help-block"><%=glp("ui.analytics.ESNAgent.report.new-profile.h") %></span>  
      <jalios:chart chart='<%=new TimeChart().addSeries(accountProfileSeries, contactProfileSeries).setRoundXAxis("day") %>'/>  
    </div>  

    <div class="col-md-6 report-element profile-completeness">  
      <h3><%=glp("ui.analytics.ESNAgent.report.profile-completeness") %></h3>  
      <span class="help-block"><%=glp("ui.analytics.ESNAgent.report.profile-completeness.h") %></span>  
      <jalios:chart chart='<%=new TimeChart().addSeries(profileCompletenessSeries).setRoundXAxis("day") %>'/>  
    </div>  
  </div>
  
  
  
  
<%}%>  
</div>  