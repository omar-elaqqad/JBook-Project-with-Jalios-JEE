<%@page import="com.jalios.jcms.chart.*"%>
<%@page import="com.jalios.jcms.chart.series.*"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.jalios.jcms.analytics.agent.*"%><%
%><%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><div class="chart-result" style="overflow:hidden;"><%
ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");
Date endDate = formHandler.getAvailableEndDate();
endDate = DateUtil.getDayEndDate(endDate, userLocale);
Date beginDate = formHandler.getAvailableBeginDate();
String wkId = formHandler.getAnalyticsWS();
Workspace wk = channel.getData(Workspace.class, wkId);
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, TechnicalReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{
	TimeChartSeries requestSeries = new TimeChartSeries(glp("ui.analytics.TechnicalReportAgent.requestCount")).fill();
	TimeChartSeries requestBotSeries = new TimeChartSeries(glp("ui.analytics.TechnicalReportAgent.requestBotCount")).fill();
	TimeChartSeries rssAccessSeries = new TimeChartSeries(glp("ui.analytics.TechnicalReportAgent.rssAccessCount")).fill();
	TimeChartSeries openAPISeries = new TimeChartSeries(glp("ui.analytics.TechnicalReportAgent.openAPICount")).fill();
	TimeChartSeries authFailSeries = new TimeChartSeries(glp("ui.analytics.TechnicalReportAgent.authFailCount")).fill();
	TimeChartSeries csrfSeries = new TimeChartSeries(glp("ui.analytics.TechnicalReportAgent.csrfCount")).fill();
	TimeChartSeries averageAccessTimeSeries = new TimeChartSeries(glp("ui.analytics.TechnicalReportAgent.averageAccessTime")).fill();
  
	Map<String, Integer> aggregatedBrowserMap = new HashMap();
	Map<String, Integer> aggregatedBotMap = new HashMap();
	Map<String, Integer> aggregatedOsMap = new HashMap();
	Map<String, Integer> aggregatedZoneMap = new HashMap();
	Map<String, Integer> aggregatedReferrerMap = new HashMap();
	Map<String, ContentTopValue> aggregatedSlowRequestMap = new HashMap();
  	
	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, TechnicalReportMetric.class);
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet,TechnicalReportMetric.class);
	
	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
		TechnicalReportMetric metric = (TechnicalReportMetric) metricIt.next();
		Date reportStartDate =  metric.getStartDate();
		Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
		
		requestSeries.add(cal, metric.getRequestCount());
		requestBotSeries.add(cal, metric.getRequestBotCount());
		rssAccessSeries.add(cal, metric.getRssAccessCount());
		openAPISeries.add(cal, metric.getOpenAPICount());
		authFailSeries.add(cal, metric.getAuthFailCount());
		csrfSeries.add(cal, metric.getCsrfCount());
		averageAccessTimeSeries.add(cal, metric.getAverageAccessTime());
	  		  
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedBrowserMap, metric.getBrowserTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedBotMap, metric.getBotTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedOsMap, metric.getOsTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedZoneMap, metric.getZoneTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedReferrerMap, metric.getReferrerTop());
		AnalyticsManager.aggregateKeyContentTopMap(aggregatedSlowRequestMap,AnalyticsManager.getDeserializedContentTopMap(metric.getSlowRequestTop()));
	}
	SortedMap<String, Integer> topBrowserMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedBrowserMap, 10);
	SortedMap<String, Integer> topBotMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedBotMap, 10);
	SortedMap<String, Integer> topOsMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedOsMap, 10);
	SortedMap<String, Integer> topZoneMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedZoneMap, 10);
	SortedMap<String, Integer> topReferrerMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedReferrerMap, 10);
	SortedMap<String, ContentTopValue> topSlowRequestMap = AnalyticsManager.getSortedContentTopMap(aggregatedSlowRequestMap, 10);	
  
  double averageSummary = (int)ChartUtil.mean(averageAccessTimeSeries);
  averageSummary = averageSummary / (double)1000;
  
  String topBrowser = null;
  int browserPercentSummary = 0;
  if (Util.notEmpty(topBrowserMap)) {
    topBrowser = topBrowserMap.firstKey();
    int browserTopCount = aggregatedBrowserMap.get(topBrowser);
    int browserSum = (int)Util.sum(aggregatedBrowserMap.values());
    browserPercentSummary = (100*browserTopCount) / browserSum;
  }
%>
  
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= (int)ChartUtil.sum(requestSeries) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.TechnicalReportAgent.request-section") %></div>
	      </div>
      </div>  
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= averageSummary %> s</div>
	        <div class="indicator-text"><%=glp("ui.analytics.TechnicalReportAgent.average-section") %></div>
	      </div>         
      </div>  
      <% if (Util.notEmpty(topBrowser)) { %>
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= browserPercentSummary %>%</div>
	        <%
	        String summaryBrowserLabel = glp("ui.analytics.browser."+topBrowser);
          if (summaryBrowserLabel.startsWith("ui.")) {
            summaryBrowserLabel = topBrowser;
          }
	        %>
	        <div class="indicator-text"><%=summaryBrowserLabel %></div>
	      </div>   
      </div>  
      <% } %>
    </div>
  </div> 
  
	<div class="row">
		<div class="col-md-6 report-element request-chart">		
			<h3><%= glp("ui.analytics.TechnicalReportAgent.request-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.request-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(requestSeries, requestBotSeries, rssAccessSeries, openAPISeries, authFailSeries, csrfSeries).setRoundXAxis("day")  %>' />
		</div>
		<div class="col-md-6 report-element average-chart">		
			<h3><%= glp("ui.analytics.TechnicalReportAgent.average-section") %></h3>	
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.average-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(averageAccessTimeSeries).setRoundXAxis("day")  %>' />
		</div>
	</div>
	<%
	if(Util.notEmpty(topBrowserMap) || Util.notEmpty(topOsMap)){%>
	<div class="row-fluid">		
		<%if(Util.notEmpty(topBrowserMap)){%>
			<div  class="col-md-6 report-element topBrowser">
				<h3><%=glp("ui.analytics.TechnicalReportAgent.topBrowser-section") %></h3>
				<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topBrowser-section.help") %></p>
				<%RatioSeries topBrowserSeries = AnalyticsManager.createRatioSeries(topBrowserMap,"ui.analytics.browser.", userLang);%>
				 	<jalios:chart chart='<%= new PieChart("").hideTitle().showPercent().doughnut().addSeries(topBrowserSeries) %>'/>
			</div>
		<%}
		if(Util.notEmpty(topOsMap)){ %>
		<div  class="col-md-6 report-element topOS">
			<h3><%=glp("ui.analytics.TechnicalReportAgent.topOS-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topOS-section.help") %></p>
			<%RatioSeries topOsSeries = AnalyticsManager.createRatioSeries(topOsMap,"ui.analytics.os.", userLang);%>
			<jalios:chart chart='<%= new PieChart("").hideTitle().showPercent().doughnut().addSeries(topOsSeries) %>'/>
		</div>
		<%} %>				
	</div>
	<%} 
	if(Util.notEmpty(topZoneMap)){
	%>
	<div class="row-fluid">	
		<%
		if(Util.notEmpty(topZoneMap)){%>
			<div  class="col-md-6 report-element topZone">
				<h3><%=glp("ui.analytics.TechnicalReportAgent.topZone-section") %></h3>
				<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topZone-section.help") %></p>				
				<%
					RatioSeries topZoneSeries = AnalyticsManager.createRatioSeries(topZoneMap, null, userLang);
			    %>
				<jalios:chart chart='<%= new PieChart("").hideTitle().showPercent().doughnut().addSeries(topZoneSeries) %>'/>
			</div>	
		<%} %>
	</div>
	<%} %>
	<%if(Util.notEmpty(topBotMap)){ %>
	<div class="row-fluid">
		<div  class="col-md-6 report-element topBot">
			<h3><%=glp("ui.analytics.TechnicalReportAgent.topBot-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topBot-section.help") %></p>				
			<%
				RatioSeries topBotSeries = AnalyticsManager.createRatioSeries(topBotMap, null, userLang);	
			%>
			<jalios:chart chart='<%= new PieChart("").hideTitle().showPercent().doughnut().addSeries(topBotSeries) %>'/>
		</div>
	</div>
	<%} %>
	<div class="row-fluid">
		<div class="col-md-6 report-element topZone">
			<h3><%=glp("ui.analytics.TechnicalReportAgent.topReferrer-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topReferrer-section.help") %></p>
			<table style="overflow:auto;" class="table-data">
        <thead>
  				<tr>
            <th class="fit"></th>
  					<th class="spacer"><%=glp("ui.analytics.TechnicalReportAgent.topReferrer.name") %></th>
  					<th class="text-overflow fit"><%= glp("ui.analytics.TechnicalReportAgent.topReferrer.number") %></th>
  				</tr>
        </thead>
				<tbody>
          <% if (Util.isEmpty(topReferrerMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topReferrerMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
					<% String key = entry.getKey(); %>
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td>
							<div class="key"  style="max-width:400px;" title="<%=encodeForHTMLAttribute(key) %>" >
								<%=encodeForHTML(key) %>
							</div>
						</td>
						<td class="text-overflow text-right"><%=entry.getValue() %></td>
					</tr>
          </jalios:foreach>
					<% } %>
				</tbody>
			</table>
		</div>
		<div class="col-md-6 report-element topSlowRequest">
			<h3><%=glp("ui.analytics.TechnicalReportAgent.topSlowRequest-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topSlowRequest-section.help") %></p>
			<table class="table-data">
				<thead>
					<tr>
            <th></th>
						<th class="spacer"><%=glp("ui.analytics.TechnicalReportAgent.topSlowRequest.name") %></th>
						<th class="fit text-overflow"><%=glp("ui.analytics.TechnicalReportAgent.topSlowRequest.portal") %></th>
						<th class="fit text-overflow"><%= glp("ui.analytics.TechnicalReportAgent.topSlowRequest.number") %></th>
					</tr>
				</thead>
				<tbody>
          <% if (Util.isEmpty(topSlowRequestMap)) { %>
          <tr>
            <td class="spacer" colspan="4"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topSlowRequestMap.entrySet() %>" name="entry" type="Map.Entry<String, ContentTopValue>">
					<%
					    Double value = new Double(0);
						String key = entry.getKey();
						String title = "";
						if(entry.getValue() != null){
					    	ContentTopValue topValue  = entry.getValue();
					    	title = topValue.getTitle();
						  	value = Double.valueOf(topValue.getRequestCount());
						}				  	
					%>
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td class="key"  title="<%=encodeForHTMLAttribute(key) %>">							
							<%=encodeForHTML(key) %>
						</td>
						<td class="text-overflow">
							<%=encodeForHTML(title == null ?"":title) %>
						</td>
						<td class="text-overflow text-right"><%=value.intValue() %></td>
					</tr>
          </jalios:foreach>
					<% } %>
				</tbody>
			</table>
		</div>	
	</div>
	<div class="row-fluid">
		<jalios:include target="JCMS_ANALYTICS_TECHNICAL_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>