<%@page import="com.jalios.jcms.chart.TimeChart"%>
<%@page import="com.jalios.jcms.chart.DataPoint"%>
<%@page import="com.jalios.jcms.chart.ChartUtil"%>
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
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate,null, SearchReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{
    TimeChartSeries searchSeries = new TimeChartSeries(glp("ui.analytics.SearchReportAgent.searchCount")).fill();
    TimeChartSeries acSearchSeries = new TimeChartSeries(glp("ui.analytics.SearchReportAgent.acSearchCount")).fill();
    Map<String, Integer> aggregatedWordMap = new HashMap();
    Map<String, Integer> aggregatedCategoryMap = new HashMap();
	
	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, SearchReportMetric.class);
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet, SearchReportMetric.class);

	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
	  SearchReportMetric metric = (SearchReportMetric) metricIt.next();
	  Date reportStartDate =  metric.getStartDate();
	  Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
	  searchSeries.add(cal, metric.getSearchCount());
	  acSearchSeries.add(cal, metric.getAcSearchCount());
	  AnalyticsManager.aggregateKeyIntegerMap(aggregatedWordMap, metric.getTextTop());
      AnalyticsManager.aggregateKeyIntegerMap(aggregatedCategoryMap, metric.getCategoryTop());
	}
	SortedMap<String, Integer> topWordMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedWordMap, 10);
  SortedMap<String, Integer> topCatMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedCategoryMap, 10);
%>
  
  <div class="summary-wrapper row">  
    <div class="summary col-md-6 col-md-offset-3 row">
      <div class="col-md-6 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= (int)ChartUtil.sum(searchSeries) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.SearchReportAgent.searchCount") %></div>
	      </div>
      </div>             
      <div class="col-md-6 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= (int)ChartUtil.sum(acSearchSeries) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.SearchReportAgent.acSearchCount") %></div>
	      </div>  
      </div>             
    </div>
  </div>  
  
  
	<div class="row">
		<div class="col-md-6 report-element searchCount-chart">
			<h3><%=glp("ui.analytics.SearchReportAgent.searchCount-section") %></h3>
			<p class="help-block" ><%=glp("ui.analytics.SearchReportAgent.searchCount-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart().addSeries(searchSeries, acSearchSeries).setRoundXAxis("day") %>'/>
		</div>
		<div class="col-md-6 report-element search-top-words">
			<h3><%=glp("ui.analytics.SearchReportAgent.textTop") %></h3>
			<p class="help-block"><%=glp("ui.analytics.SearchReportAgent.textTop-section.help") %></p>
			<table class="table-data">
				<thead>
					<tr>
            <th class="fit"></th>
						<th class="spacer"><%=glp("ui.analytics.SearchReportAgent.textTop.word") %></th>
						<th class="fit"><%= glp("ui.analytics.SearchReportAgent.textTop.number") %></th>
					</tr>
				</thead>
				<tbody>
          <% if (Util.isEmpty(topWordMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topWordMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td class="spacer"><%=encodeForHTML(entry.getKey()) %></td>
						<td class="text-overflow text-right"><%=entry.getValue() %></td>
					</tr>
          </jalios:foreach>          
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
	
  
  <div class="row-fluid">   
    <div class="col-md-6 report-element categoryTop">
      <h3><%=glp("ui.analytics.SearchReportAgent.categoryTop-section") %></h3>
      <p class="help-block"><%=glp("ui.analytics.SearchReportAgent.categoryTop-section.help") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th class="fit"></th>
            <th class="spacer text-overflow"><%=glp("ui.analytics.SearchReportAgent.categoryTop.category") %></th>
            <th class="fit spacer text-overflow"><%= glp("ui.analytics.SearchReportAgent.categoryTop.number") %></th>
          </tr>
        </thead>
        <tbody>
          <% if (Util.isEmpty(topCatMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topCatMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
          <%
              String key = entry.getKey();
              //check the associated member if any
              Category cat = channel.getCategory(key);
              boolean isRealCat = true;
              if(cat == null || Util.isEmpty(cat.getName(userLang))){
                 key = "unknown category - "+key;
                 isRealCat = false;
              }
          %>
          <tr>
            <td class="text-right"><%= itCounter %></td>
            <td class="spacer"> <jalios:icon src="category"/>
            <%if(isRealCat){ %>
                    <jalios:link data="<%=cat%>"/><%
            } else { 
              %><%=key %><%
            }%></td>
            <td class="text-right"><%=entry.getValue() %></td>
          </tr>
          </jalios:foreach>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>
	<div class="row-fluid">		
		<jalios:include target="JCMS_ANALYTICS_DAY_SEARCH_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>	