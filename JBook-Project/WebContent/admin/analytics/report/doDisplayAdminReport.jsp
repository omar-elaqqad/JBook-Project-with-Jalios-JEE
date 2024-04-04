<%@page import="com.jalios.jcms.chart.series.Series.PointStyle"%>
<%@page import="com.jalios.jcms.chart.*"%>
<%@page import="com.jalios.jcms.chart.series.TimeChartSeries"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.jalios.jcms.analytics.agent.*"%><%
%><%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><div class="chart-result" style="overflow:hidden;"><%
String CS_PLUGIN_NAME = "CollaborativeSpacePlugin"; 
ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");
Date endDate = formHandler.getAvailableEndDate();
endDate = DateUtil.getDayEndDate(endDate, userLocale);
Date beginDate = formHandler.getAvailableBeginDate();
String wkId = formHandler.getAnalyticsWS();
Workspace wk = channel.getData(Workspace.class, wkId);
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, AdminReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{

  	long mbrCount = 0;
  	TimeChartSeries mbrCreateSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.mbrCreateCount")).fill();
  	TimeChartSeries mbrUpdateSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.mbrUpdateCount")).fill();
  	TimeChartSeries mbrDeleteSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.mbrDeleteCount")).fill();
	
	long dBMbrCount = 0;
	TimeChartSeries dBMbrCreateSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.dBMbrCreateCount")).fill();
	TimeChartSeries dBMbrUpdateSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.dBMbrUpdateCount")).fill();
	TimeChartSeries dBMbrDeleteSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.dBMbrDeleteCount")).fill();
	
	long wsCount = 0;
	TimeChartSeries wsCreateSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.wsCreateCount")).fill();
	TimeChartSeries wsUpdateSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.wsUpdateCount")).fill();
	TimeChartSeries wsDeleteSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.wsDeleteCount")).fill();
	
	long csCount = 0;
	TimeChartSeries csCreateSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.csCreateCount")).fill();
	TimeChartSeries csUpdateSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.csUpdateCount")).fill();
	TimeChartSeries csDeleteSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.csDeleteCount")).fill();
	
	TimeChartSeries quotaValueSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.quotaValue")).fill().setColor("#0000FF");
	TimeChartSeries quotaMaxSeries = new TimeChartSeries(glp("ui.analytics.AdminReportAgent.quotaMax")).fill().setColor("#FF0000");

	Map<String, Integer> aggregatedMemberMap = new HashMap();
	
	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, AdminReportMetric.class);
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet,AdminReportMetric.class);
	
	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
		AdminReportMetric metric = (AdminReportMetric) metricIt.next();
		Date reportStartDate =  metric.getStartDate();
		Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
		
		mbrCount = metric.getMbrCount();
		mbrCreateSeries.add(cal, metric.getMbrCreateCount());
		mbrUpdateSeries.add(cal, metric.getMbrUpdateCount());
		mbrDeleteSeries.add(cal, metric.getMbrDeleteCount());
		
		dBMbrCount = metric.getDBMbrCount();
		dBMbrCreateSeries.add(cal, metric.getDBMbrCreateCount());
		dBMbrUpdateSeries.add(cal, metric.getDBMbrUpdateCount());
		dBMbrDeleteSeries.add(cal, metric.getDBMbrDeleteCount());
		
		wsCount = metric.getWsCount();
		wsCreateSeries.add(cal, metric.getWsCreateCount());
		wsUpdateSeries.add(cal, metric.getWsUpdateCount());
		wsDeleteSeries.add(cal, metric.getWsDeleteCount());
		
		csCount = metric.getCsCount();
		csCreateSeries.add(cal, metric.getCsCreateCount());
		csUpdateSeries.add(cal, metric.getCsUpdateCount());
		csDeleteSeries.add(cal, metric.getCsDeleteCount());		

		quotaValueSeries.add(cal, metric.getQuotaValue());
		quotaMaxSeries.add(cal, metric.getQuotaMax());
	}
	
	Plugin csPlugin = PluginManager.getPluginManager().getPlugin(CS_PLUGIN_NAME);
	boolean isCSPlugin = csPlugin != null && csPlugin.isInitialized();
  
  
  int memberSummary = (int)(
      ChartUtil.sum(mbrCreateSeries) + ChartUtil.sum(dBMbrCreateSeries) - 
      (ChartUtil.sum(mbrDeleteSeries) + ChartUtil.sum(dBMbrDeleteSeries)));

  int wsSummary = (int)(ChartUtil.sum(wsCreateSeries) - ChartUtil.sum(wsDeleteSeries));
  %>
  
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= memberSummary >= 0 ? "+" : "" %><%= memberSummary %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AdminReportAgent.mbr-section") %></div>
	      </div>
      </div>        
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= wsSummary >= 0 ? "+" : "" %><%= wsSummary %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AdminReportAgent.ws-section") %></div>
	      </div>    
      </div>        
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><jalios:filesize size="<%= (long)ChartUtil.mean(quotaValueSeries) %>" /></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AdminReportAgent.quota-section") %></div>
	      </div>  
      </div>        
    </div>
  </div>
  
	<div class="row">
		<div class="col-md-6 report-element mbr-chart">
			<h3><%=glp("ui.analytics.AdminReportAgent.mbr-section") %> (<%=mbrCount %>/<%=dBMbrCount %>)</h3>
			<p class="help-block"><%=glp("ui.analytics.AdminReportAgent.mbr-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(mbrCreateSeries, mbrUpdateSeries, mbrDeleteSeries, dBMbrCreateSeries, dBMbrUpdateSeries, dBMbrDeleteSeries).setRoundXAxis("day") %>' />
		</div>
		<div class="col-md-6 report-element quota-chart">
			<h3><%=glp("ui.analytics.AdminReportAgent.quota-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.AdminReportAgent.quota-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(quotaMaxSeries, quotaValueSeries).logarithmicYAxes().setRoundXAxis("day")  %>' >
			
						 {
					  		options: {
					       		scales: {
					        		xAxes: [{
										time: { 
											displayFormats: { 
												minute : 	'LT'
											}
										}, 
										ticks: {
											maxRotation: 0,
											autoskip: true,
											autoSkipPadding: 30
										}
				            		}],
				            	
					            	yAxes: [{
					                	ticks: {
					                    	callback: function(value, index, values) {		
					                    		var log_1000 = Math.log(1000)
					                    	    var order = Math.log(value)/Math.log(10);
					                    	    order = Math.round( 100 * order)/100;
					                    	    floor = Math.floor(order) 
					                    	    // 1, 5, 10, 50, 100, ... 
					                    	    if( floor == order || Math.round(10 * (order-floor)) == 7 ){
						                        	if(value / Math.pow(1000, 4) >= 1){
						                        		return (value / Math.pow(1000, 4))+" TB"
						                        	}
						                        	if(value / Math.pow(1000, 3) >= 1){
						                        		return (value / Math.pow(1000, 3))+" GB"
						                        	}	                    
						                        	if(value / Math.pow(1000, 2) >= 1){
						                        		return (value / Math.pow(1000, 2))+" MB"
						                        	}
						                        	if(value / Math.pow(1000, 1) >= 1){
						                        		return (value / Math.pow(1000, 1))+" KB"
						                        	}
						                        	return value;
					                        	}
					                        	return "";
					                    	}
					                	}
									}]
					        	}
					    	}
				    	}
			</jalios:chart>
		</div>
	</div>
	<% if(wk == null){ %>
	<div class="row-fluid">		
		<div class="col-md-6 report-element ws-chart">
			<h3><%=glp("ui.analytics.AdminReportAgent.ws-section") %> (<%=wsCount %>)</h3>
			<p class="help-block"><%=glp(isCSPlugin?"ui.analytics.AdminReportAgent.ws-section.help":"ui.analytics.AdminReportAgent.ws-section.help-without-cs") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(wsCreateSeries, wsUpdateSeries, wsDeleteSeries).setRoundXAxis("day")  %>' />
		</div>
		<%if(isCSPlugin){ %>
		<div class="col-md-6 report-element cs-chart">
			<h3><%=glp("ui.analytics.AdminReportAgent.cs-section") %> (<%=csCount %>)</h3>
			<p class="help-block"><%=glp("ui.analytics.AdminReportAgent.cs-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(csCreateSeries, csUpdateSeries, csDeleteSeries).setRoundXAxis("day")  %>' />
		</div>
		<%} %>
	</div>
	<%} %>
	<div class="row-fluid">	
		<jalios:include target="JCMS_ANALYTICS_ADMIN_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>