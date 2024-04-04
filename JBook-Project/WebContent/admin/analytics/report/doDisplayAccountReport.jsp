<%@page import="com.jalios.jcms.chart.TimeChart"%>
<%@page import="com.jalios.jcms.chart.series.TimeChartSeries"%>
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
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, AccountReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{

  	long accountCount = 0;
  	long contactCount = 0;
  	long disabledAccountCount = 0;
  	long guestCount = 0;
  	
    TimeChartSeries accountCreateSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.accountCreateCount")).fill();
    TimeChartSeries accountUpdateSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.accountUpdateCount")).fill(); 
    TimeChartSeries accountDeleteSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.accountDeleteCount")).fill();
  
    TimeChartSeries disabledAccountCreateSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.disabledAccountCreateCount")).fill();
    TimeChartSeries disabledAccountUpdateSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.disabledAccountUpdateCount")).fill(); 
    TimeChartSeries disabledAccountDeleteSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.disabledAccountDeleteCount")).fill();
  
    TimeChartSeries contactCreateSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.contactCreateCount")).fill();
    TimeChartSeries contactUpdateSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.contactUpdateCount")).fill(); 
    TimeChartSeries contactDeleteSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.contactDeleteCount")).fill();
  
    TimeChartSeries guestCreateSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.guestCreateCount")).fill();
    TimeChartSeries guestUpdateSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.guestUpdateCount")).fill(); 
    TimeChartSeries guestDeleteSeries = new TimeChartSeries(glp("ui.analytics.AccountReportAgent.guestDeleteCount")).fill();
  
	Map<String, Integer> aggregatedMemberMap = new HashMap();

	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, AccountReportMetric.class);	
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet,AccountReportMetric.class);
	
	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
		AccountReportMetric metric = (AccountReportMetric) metricIt.next();
		Date reportStartDate =  metric.getStartDate();
		Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
		
		accountCount = metric.getAccountCount();
		accountCreateSeries.add(cal, metric.getAccountCreateCount());
		accountUpdateSeries.add(cal, metric.getAccountUpdateCount());
		accountDeleteSeries.add(cal, metric.getAccountDeleteCount());

		contactCount = metric.getContactCount();
		contactCreateSeries.add(cal, metric.getContactCreateCount());
		contactUpdateSeries.add(cal, metric.getContactUpdateCount());
		contactDeleteSeries.add(cal, metric.getContactDeleteCount());

		disabledAccountCount = metric.getDisabledCount();
		disabledAccountCreateSeries.add(cal, metric.getDisabledCreateCount());
		disabledAccountUpdateSeries.add(cal, metric.getDisabledUpdateCount());
		disabledAccountDeleteSeries.add(cal, metric.getDisabledDeleteCount());

		guestCount = metric.getGuestCount();
		guestCreateSeries.add(cal, metric.getGuestCreateCount());
		guestUpdateSeries.add(cal, metric.getGuestUpdateCount());
		guestDeleteSeries.add(cal, metric.getGuestDeleteCount());
	}	    
  %>

  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= accountCount %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AccountReportAgent.account-section") %></div>
	      </div>
      </div>
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= guestCount %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AccountReportAgent.guest-section") %></div>
	      </div>   
      </div>
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= contactCount %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AccountReportAgent.contact-section") %></div>
	      </div> 
      </div>
    </div>
  </div>  

	<div class="row">
		<% String suffix = "_account_account_report"; %>
		<div class="col-md-6 report-element account-chart">
			<h3><%=glp("ui.analytics.AccountReportAgent.account-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.AccountReportAgent.account-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(accountCreateSeries, accountUpdateSeries, accountDeleteSeries) %>' />
		</div>
			
		<% suffix = "_disabled_account_report"; %>
		<div class="col-md-6 report-element disabled-chart">
			<h3><%=glp("ui.analytics.AccountReportAgent.disabled-section") %> (<%=disabledAccountCount %>)</h3>
			<p class="help-block"><%=glp("ui.analytics.AccountReportAgent.disabled-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(disabledAccountCreateSeries, disabledAccountUpdateSeries, disabledAccountDeleteSeries) %>' />
		</div>
	</div>
	<div class="row-fluid">
		<% if(wk == null){ %>
		<% suffix = "_contact_account_report"; %>
		<div class="col-md-6 report-element contact-chart">
			<h3><%=glp("ui.analytics.AccountReportAgent.contact-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.AccountReportAgent.contact-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(contactCreateSeries, contactUpdateSeries, contactDeleteSeries) %>' />
		</div>
		<%} %>
			
		<% suffix = "_guest_account_report"; %>
		<div class="col-md-6 report-element guest-chart">
			<h3><%=glp("ui.analytics.AccountReportAgent.guest-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.AccountReportAgent.guest-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(guestCreateSeries, guestUpdateSeries, guestDeleteSeries) %>' />
		</div>
	</div>
	<div class="row-fluid">
		<jalios:include target="JCMS_ANALYTICS_ACCOUNT_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>