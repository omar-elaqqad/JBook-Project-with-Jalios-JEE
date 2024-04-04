<%@page import="com.jalios.jcms.chart.RatioData"%>
<%@page import="com.jalios.jcms.chart.PieChart"%>
<%@page import="com.jalios.jcms.chart.series.RatioSeries"%>
<%@page import="com.jalios.jcms.chart.ChartUtil"%>
<%@page import="com.jalios.jcms.chart.ChartManager"%>
<%@page import="com.jalios.jcms.chart.TimeChart"%>
<%@page import="com.jalios.jcms.chart.DataPoint"%>
<%@page import="com.jalios.jcms.chart.series.LineSeries"%>
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
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, AccessReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{
  TimeChartSeries visitSeries = new TimeChartSeries(glp("ui.analytics.DayAccessAgent.visitCount")).fill();
  TimeChartSeries printSeries = new TimeChartSeries(glp("ui.analytics.DayAccessAgent.printViewCount")).fill();
  TimeChartSeries downloadSeries = new TimeChartSeries(glp("ui.analytics.DayAccessAgent.downloadCount")).fill();
  TimeChartSeries visitorSeries = new TimeChartSeries(glp("ui.analytics.DayAccessAgent.visitorCount")).fill();
  TimeChartSeries loggedVisitorSeries = new TimeChartSeries(glp("ui.analytics.DayAccessAgent.loggedVisitorCount")).fill();
  

	Map<String, Integer> aggregatedMemberMap = new HashMap();
  Map<String, Integer> aggregatedCategoryMap = new HashMap();
	Map<String, Integer> aggregatedAnonymousUriMap = new HashMap();
	Map<String, Integer> aggregatedWorkspaceMap = new HashMap();
	Map<String, ContentTopValue> aggregatedContentMap = new HashMap();
	
	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, AccessReportMetric.class);
	Set<AbstractReportMetric> uridMetricSet = new TreeSet<AbstractReportMetric>(new AbstractStatisticAgent.AbstractReportMetricComparator());
	uridMetricSet.addAll(metricSet);
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet,AccessReportMetric.class);
	
	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
	  AccessReportMetric metric = (AccessReportMetric) metricIt.next();
	  Date reportStartDate =  metric.getStartDate();
	  Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
	  visitSeries.add(cal, metric.getVisitCount());
	  downloadSeries.add(cal,metric.getDownloadCount());
	  printSeries.add(cal, metric.getPrintViewCount());
	
	  visitorSeries.add(cal, metric.getVisitorCount());
	  loggedVisitorSeries.add(cal, metric.getLoggedVisitorCount());
		  
	  AnalyticsManager.aggregateKeyIntegerMap(aggregatedMemberMap, metric.getMemberTop());
    AnalyticsManager.aggregateKeyIntegerMap(aggregatedCategoryMap, metric.getPortalCategoryTop());
	  AnalyticsManager.aggregateKeyIntegerMap(aggregatedWorkspaceMap, metric.getWorkspaceTop());	  
	  AnalyticsManager.aggregateKeyIntegerMap(aggregatedAnonymousUriMap, metric.getAnonymousPageTop());
	  AnalyticsManager.aggregateKeyContentTopMap(aggregatedContentMap,AnalyticsManager.getDeserializedContentTopMap(metric.getContentTop()));
	}
	SortedMap<String, Integer> topMbrMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedMemberMap, 10);
  SortedMap<String, Integer> topCatMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedCategoryMap, 10);
	SortedMap<String, Integer> topWkMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedWorkspaceMap, 10);
	SortedMap<String, Integer> topAnonymousUriMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedAnonymousUriMap, 10);
	SortedMap<String, ContentTopValue> topContentMap = AnalyticsManager.getSortedContentTopMap(aggregatedContentMap, 10);
%>
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-4">
	      <div class="indicator">
	        <div class="indicator-value"><%= (int) ChartUtil.sum(visitSeries) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.DayAccessAgent.visit-section") %></div>
	      </div>
      </div>
      <div class="col-md-4 col-xs-6 col-sm-4">
	      <div class="indicator">
	      <%
	      double meanVisitor = ChartUtil.mean(visitorSeries);
	      %>
	        <div class="indicator-value"><%= Double.toString(Math.round(meanVisitor*100)/100d) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.DayAccessAgent.visitor-key-indicator") %></div>
	      </div>       
      </div>
      <div class="col-md-4 col-xs-6 col-sm-4">
	      <div class="indicator">
	        <div class="indicator-value"><%= (int)ChartUtil.sum(downloadSeries) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.DayAccessAgent.download-section") %></div>
	      </div>   
      </div>
    </div>
  </div>
  
  
	<div class="row">
		<div class="col-md-6 report-element visits-chart">
			<h3><%=glp("ui.analytics.DayAccessAgent.visit-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.visit-section.help") %></p>
			
			<jalios:chart chart='<%=new TimeChart(glp("ui.analytics.DayAccessAgent.visit-section")).addSeries(visitSeries).hideTitle().setRoundXAxis("day") %>'/>
		</div>		
		<div class="col-md-6 report-element download-chart">
			<h3><%=glp("ui.analytics.DayAccessAgent.download-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.download-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart(glp("ui.analytics.DayAccessAgent.download-section")).addSeries(downloadSeries, printSeries).hideTitle().setRoundXAxis("day") %>'/>
		</div>
	</div>
	<div class="row-fluid">
		<div class="col-md-6 report-element members-chart">
			<h3><%=glp("ui.analytics.DayAccessAgent.visitor-section") %></h3>			
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.visitor-section.help") %></p>
			<jalios:chart chart='<%= new TimeChart(glp("ui.analytics.DayAccessAgent.visitor-section")).addSeries(visitorSeries, loggedVisitorSeries).hideTitle().setRoundXAxis("day") %>'/>
		</div>
		<%
			RatioSeries uridSeries = new RatioSeries();
			Iterator<AbstractReportMetric> uridMetricIt = uridMetricSet.iterator();
			while(uridMetricIt.hasNext()){
		  		AccessReportMetric metric = (AccessReportMetric) uridMetricIt.next();
		  		String urid = metric.getUrid();
		  		if(Util.isEmpty(urid)){
		  		  continue;
		  		}
		  		Date reportStartDate =  metric.getStartDate();
		  		Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
		  		RatioData ratioValue = uridSeries.getDataMap().get(urid);
		  		Double value = 0d;
		  		if(ratioValue == null){
		  		  value = new Double(metric.getVisitCount());
		  		}
		  		else{
		  		  value = new Double(ratioValue.getValue().doubleValue() + metric.getVisitCount());
		  		}
		  		uridSeries.add(urid, value);
			}
			if(uridSeries.getDataMap().size() > 1){
			%><div class="col-md-6 report-element urid-chart">
				<h3><%=glp("ui.analytics.DayAccessAgent.urid-section") %></h3>			
				<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.urid-section.help") %></p>
				<jalios:chart chart='<%= new PieChart("").hideTitle().doughnut().showPercent().addSeries(uridSeries) %>'/>
			</div>
			<%} 
		%>
		<% if(wk == null){ %>
		<div class="col-md-6 report-element topWorkspace">
			<h3><%=glp("ui.analytics.DayAccessAgent.topWorkspace-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.topWorkspace-section.help") %></p>
			<%
			  RatioSeries wkSeries = new RatioSeries();
			{
			    for (Map.Entry<String, Integer> entry : topWkMap.entrySet()) {
			      String key = entry.getKey();
			      Workspace tmpWk = channel.getWorkspace(key);
				  String label = tmpWk == null ? key : tmpWk.getTitle(userLang);
			      double value = 0;
			      if (entry.getValue() != null) {
			        value = entry.getValue().doubleValue();
			      }
			      RatioData data = wkSeries.get(label);
			      if (data != null) {
			        wkSeries.add(label, Double.valueOf(data.getValue() + value));
			      } else {
			        wkSeries.add(label, value);
			      }
			    }
			}
			 %>
			 <jalios:chart chart='<%= new PieChart("").hideTitle().doughnut().showValue().addSeries(wkSeries) %>'/>
		</div>			
		<%}%>
	</div>
  
  
	<div class="row-fluid">		
		<div class="col-md-6 report-element memberTop">
			<h3><%=glp("ui.analytics.DayAccessAgent.memberTop-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.memberTop-section.help") %></p>
			<table class="table-data">
				<thead>
					<tr>
            <th class="fit"></th>
						<th class="spacer text-overflow"><%=glp("ui.analytics.DayAccessAgent.memberTop.member") %></th>
						<th class="fit spacer text-overflow"><%= glp("ui.analytics.DayAccessAgent.memberTop.number") %></th>
					</tr>
				</thead>
				<tbody>
          <% if (Util.isEmpty(topMbrMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topMbrMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
 					<%
					    String key = entry.getKey();
			  		  	//check the associated member if any
			  		  	Member mbr = channel.getMember(key);
			  		  	boolean isRealMember = false;
			  		  	if(mbr == null || Util.isEmpty(mbr.getFullName())){
			 	  		    key = "unknown user - "+key;
			 	  		}
			 	  		else{
			 	  		   key = mbr.getFullName();
			 	  		  isRealMember= true;
			 	  		}
					%>
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td class="spacer">
						<%if(isRealMember){ %>
	      				    <jalios:memberphoto member="<%= mbr %>" size="<%= PhotoSize.ICON %>"/>
	          				<jalios:link data="<%=mbr%>"/><%
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
		<div class="col-md-6 report-element contentTop">
			<h3><%=glp("ui.analytics.DayAccessAgent.contentTop-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.contentTop-section.help") %></p>
			<table class="table-data">
				<thead>
					<tr>
            <th></th>
						<th class="spacer text-overflow"><%=glp("ui.analytics.DayAccessAgent.contentTop.name") %></th>
						<th class="text-overflow"><%= glp("ui.analytics.DayAccessAgent.contentTop.number") %></th>
					</tr>
				</thead>
				<tbody>
          <% if (Util.isEmpty(topContentMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topContentMap.entrySet() %>" name="entry" type="Map.Entry<String, ContentTopValue>">
					<%
					    String pubId = entry.getKey();
					    ContentTopValue topValue  = entry.getValue();
					    Publication pub = channel.getData(Publication.class, pubId);
					    String title = pub == null ? topValue.getTitle() : pub.getTitle(userLang);
					    int nbr = topValue.getRequestCount();
					%>
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td class="spacer"><%
						if(pub == null) {
						  %><%=title %><%
						}else{
						  %><jalios:dataicon data="<%= pub %>" /> <%
						  %><jalios:link data="<%=pub%>"/><%
						}
						%></td>
						<td class="text-right"><%=nbr%></td>
					</tr>
          </jalios:foreach>
					<% } %>
				</tbody>
			</table>
		</div>		
	</div>
	
  
  <div class="row-fluid">   
    <div class="col-md-6 report-element categoryTop">
      <h3><%=glp("ui.analytics.DayAccessAgent.categoryTop-section") %></h3>
      <p class="help-block"><%=glp("ui.analytics.DayAccessAgent.categoryTop-section.help") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th class="fit"></th>
            <th class="spacer text-overflow"><%=glp("ui.analytics.DayAccessAgent.categoryTop.category") %></th>
            <th class="fit spacer text-overflow"><%= glp("ui.analytics.DayAccessAgent.categoryTop.number") %></th>
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
            <td class="spacer">
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
		<jalios:include target="JCMS_ANALYTICS_DAY_ACCESS_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>