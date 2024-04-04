<%@page import="java.util.Map.Entry"%>
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
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><div class="chart-result" style="overflow: hidden;"><%

AnalyticsManager instance = AnalyticsManager.getInstance();

ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");
Date endDate = formHandler.getAvailableEndDate();
endDate = DateUtil.getDayEndDate(endDate, userLocale);
Date beginDate = formHandler.getAvailableBeginDate();
String wkId = formHandler.getAnalyticsWS();
Workspace wk = channel.getData(Workspace.class, wkId);
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, WriteReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{
  long pubCount = 0;
  String othersKey = glp( "ui.analytics.WriteAccessAgent.others_workspace");
  TimeChartSeries pubCreateSeries = new TimeChartSeries(glp("ui.analytics.WriteAccessAgent.pubCreateCount")).fill();
  TimeChartSeries pubUpdateSeries = new TimeChartSeries(glp("ui.analytics.WriteAccessAgent.pubUpdateCount")).fill();
  TimeChartSeries pubDeleteSeries = new TimeChartSeries(glp("ui.analytics.WriteAccessAgent.pubDeleteCount")).fill();

  long docCount= 0;
  TimeChartSeries docCreateSeries = new TimeChartSeries(glp("ui.analytics.WriteAccessAgent.docCreateCount")).fill();
  TimeChartSeries docUpdateSeries = new TimeChartSeries(glp("ui.analytics.WriteAccessAgent.docUpdateCount")).fill();
  TimeChartSeries docDeleteSeries = new TimeChartSeries(glp("ui.analytics.WriteAccessAgent.docDeleteCount")).fill();

  Map<String, Integer> aggregatedPubMap = new HashMap<String, Integer>();
  Map<String, Integer> aggregatedMbrMap = new HashMap<String, Integer>();
  
  Map<String, ContentTopValue> aggregatedCreationMap = new HashMap<String, ContentTopValue>();
  Map<String, ContentTopValue> aggregatedWriteMap = new HashMap<String, ContentTopValue>();
  Map<String, ContentTopValue> aggregatedLikeMap = new HashMap();

  //fill with empty report in period if report are missing
  AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, WriteReportMetric.class);
  metricSet = AnalyticsManager.aggregateAllUrid(metricSet,WriteReportMetric.class);
  
  Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
  int nbReport = 0;
  while(metricIt.hasNext()){
    nbReport ++;
    WriteReportMetric metric = (WriteReportMetric) metricIt.next();
    Date reportStartDate =  metric.getStartDate();
    Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
    pubCount = metric.getPubCount();
    pubCreateSeries.add(cal, metric.getPubCreateCount());
    pubUpdateSeries.add(cal, metric.getPubUpdateCount());
    pubDeleteSeries.add(cal, metric.getPubDeleteCount());

    docCount = metric.getDocCount();
    docCreateSeries.add(cal, metric.getDocCreateCount());
    docUpdateSeries.add(cal, metric.getDocUpdateCount());
    docDeleteSeries.add(cal, metric.getDocDeleteCount());
    
    AnalyticsManager.aggregateKeyIntegerMap(aggregatedPubMap, metric.getPublicationTypeTop());
    AnalyticsManager.aggregateKeyIntegerMap(aggregatedMbrMap, metric.getMemberTop());    
    AnalyticsManager.aggregateKeyContentTopMap(aggregatedLikeMap,AnalyticsManager.getDeserializedContentTopMap(metric.getPublicationLikeTop()));
  }
  
  if(wk == null){ 
       // get all workspace report to create a aggregate indicator about creation an write
    Set<AbstractReportMetric> wkMetricSet = AbstractStatisticAgent.getWorkspacesMetricObjectSet(beginDate,endDate, null, WriteReportMetric.class);
    AnalyticsManager.removeToDayMetric(wkMetricSet);
    AnalyticsManager.completeMetricObjectSet(wkMetricSet, beginDate, endDate, userLocale, WriteReportMetric.class);
    wkMetricSet = AnalyticsManager.aggregateAllUrid(wkMetricSet,WriteReportMetric.class);
    
    for(AbstractReportMetric abstractMetric: wkMetricSet){  
      WriteReportMetric wkMetric = (WriteReportMetric) abstractMetric;
      String tmpWKId = wkMetric.getWorkspaceId();
        if(Util.isEmpty(tmpWKId)){
          continue;
        }
      int value = wkMetric.getPubCreateCount() + wkMetric.getPubUpdateCount() + wkMetric.getPubDeleteCount();
        value += wkMetric.getCatCreateCount() + wkMetric.getCatUpdateCount() + wkMetric.getCatDeleteCount();
        value += wkMetric.getDocCreateCount() + wkMetric.getDocUpdateCount() + wkMetric.getDocDeleteCount();
      
        int creationValue = wkMetric.getPubCreateCount() + wkMetric.getCatCreateCount() + wkMetric.getDocCreateCount();
        
        Workspace tmpWK = channel.getWorkspace(tmpWKId);
        String wkTitle =  (tmpWK == null) ?tmpWKId:tmpWK.getTitle(userLang);
        
        //fill creation map
        ContentTopValue  creationTopValue = aggregatedCreationMap.get(tmpWKId);
        if(creationTopValue == null){
            creationTopValue = new ContentTopValue(wkTitle, creationValue);
            aggregatedCreationMap.put(tmpWKId, creationTopValue);
        }
        else{
          creationTopValue.add(creationValue);
        }
        
        // fill write map
        ContentTopValue  writeTopValue = aggregatedWriteMap.get(tmpWKId);
        if(writeTopValue == null){
          writeTopValue = new ContentTopValue(wkTitle, value);
          aggregatedWriteMap.put(tmpWKId, writeTopValue);
        }
        else{
          writeTopValue.add(value);
        }
    }
  }
  SortedMap<String, Integer> topPubMap = instance.getSortedTopMap(aggregatedPubMap, 10);
  SortedMap<String, Integer> topMbrMap = instance.getSortedTopMap(aggregatedMbrMap, 10);
  SortedMap<String, ContentTopValue> sortedAggregatedCreationMap = AnalyticsManager.getSortedContentTopMap(aggregatedCreationMap, 9);
  SortedMap<String, ContentTopValue> sortedAggregatedWriteMap = AnalyticsManager.getSortedContentTopMap(aggregatedWriteMap, 9);
  SortedMap<String, ContentTopValue> sortedAggregatedLikeMap = AnalyticsManager.getSortedContentTopMap(aggregatedLikeMap, 10);
  %>
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">  
     <div class="col-md-4 col-xs-6 col-sm-6">
	     <div class="indicator">
	       <div class="indicator-value"><%= (int)ChartUtil.sum(pubCreateSeries) %></div>
	       <div class="indicator-text"><%=glp("ui.analytics.WriteAccessAgent.pubCreateCount") %></div>
	     </div>
     </div>
     <div class="col-md-4 col-xs-6 col-sm-6">
	     <div class="indicator">
	       <div class="indicator-value"><%= (int)ChartUtil.sum(pubUpdateSeries) %></div>
	       <div class="indicator-text"><%=glp("ui.analytics.WriteAccessAgent.pubUpdateCount") %></div>
	     </div> 
     </div>
     <div class="col-md-4 col-xs-6 col-sm-6">
	     <div class="indicator">
	       <div class="indicator-value"><%= (int)ChartUtil.sum(pubDeleteSeries) %></div>
	       <div class="indicator-text"><%=glp("ui.analytics.WriteAccessAgent.pubDeleteCount") %></div>
	     </div>
     </div>
   </div>
  </div>  
  <div class="clearfix"></div>
  <div class="row">
    <div class="col-md-6 report-element publication-chart">
      <h3><%=glp("ui.analytics.WriteAccessAgent.pub-section") %>
        (<%=pubCount %>)
      </h3>
      <p class="help-block"><%=glp("ui.analytics.WriteAccessAgent.pub-section.help") %></p>
      <jalios:chart chart='<%= new TimeChart().addSeries(pubCreateSeries, pubUpdateSeries, pubDeleteSeries).setRoundXAxis("day") %>' />
    </div>
    <div class="col-md-6 report-element doc-chart">
      <h3><%=glp("ui.analytics.WriteAccessAgent.doc-section") %>
        (<%=docCount %>)
      </h3>
      <p class="help-block"><%=glp("ui.analytics.WriteAccessAgent.doc-section.help") %></p>
      <jalios:chart chart='<%= new TimeChart().addSeries(docCreateSeries, docUpdateSeries, docDeleteSeries).setRoundXAxis("day") %>' />  
    </div>
  </div>
  <%
  if(wk == null){%>
  <div class="row">
    <div class="col-md-6 report-element doc-chart">
      <h3><%=glp("ui.analytics.WriteAccessAgent.wk-create-section") %></h3>
      <p class="help-block"><%=glp("ui.analytics.WriteAccessAgent.wk-create-section.help") %></p>
      <%
      RatioSeries wkCreationSeries = new RatioSeries();
      //group others
      for(Entry<String, ContentTopValue> entry: aggregatedCreationMap.entrySet()){
        ContentTopValue value = entry.getValue();
        Set<String> keys = new HashSet(sortedAggregatedCreationMap.keySet());
          if(!keys.contains(entry.getKey())){
            if(wkCreationSeries.get(othersKey) == null){
              wkCreationSeries.add(othersKey,0d);
            }
            Double tmpValue = wkCreationSeries.get(othersKey).getValue();
            wkCreationSeries.add(othersKey, Double.valueOf((tmpValue == null ? 0:tmpValue) + entry.getValue().getRequestCount()));
          }
          else{
            wkCreationSeries.add(value.getTitle(), value.getRequestCount());
          }
      }
      // sort workspace by value
      ChartUtil.sortRatioSeriesByValue(wkCreationSeries);
      // put others at the end of the list
      {
	      RatioData othersVal = wkCreationSeries.getDataMap().remove(othersKey);
	      if( othersVal != null){
	        wkCreationSeries.add(othersKey, othersVal);
	      }
      }
      %>
	 <jalios:chart chart='<%= new PieChart("").hideTitle().doughnut().showPercent().addSeries(wkCreationSeries) %>'/>
    </div>
    <div class="col-md-6 report-element doc-chart">
      <h3><%=glp("ui.analytics.WriteAccessAgent.wk-section") %></h3>
      <p class="help-block"><%=glp("ui.analytics.WriteAccessAgent.wk-section.help") %></p><%
      RatioSeries wkWriteSeries = new RatioSeries();
      //group others
      for(Entry<String, ContentTopValue> entry: aggregatedWriteMap.entrySet()){
        ContentTopValue value = entry.getValue();
        Set<String> keys = new HashSet(sortedAggregatedWriteMap.keySet());
          if(!keys.contains(entry.getKey())){
            if(wkWriteSeries.get(othersKey) == null){
              wkWriteSeries.add(othersKey,0d);
            }
            Double tmpValue = wkWriteSeries.get(othersKey).getValue();
            wkWriteSeries.add(othersKey, Double.valueOf((tmpValue == null ? 0:tmpValue) + entry.getValue().getRequestCount()));
          }
          else{
            wkWriteSeries.add(value.getTitle(), Double.valueOf(value.getRequestCount()));
          }
      }   
      // sort workspace by value
      ChartUtil.sortRatioSeriesByValue(wkWriteSeries);
      // put others at the end of the list
      {
	      RatioData othersVal = wkWriteSeries.getDataMap().remove(othersKey);
	      if( othersVal != null){
	        wkWriteSeries.add(othersKey, othersVal);
	      }
      }
      %>
	 <jalios:chart chart='<%= new PieChart("").hideTitle().doughnut().showPercent().addSeries(wkWriteSeries) %>'/>
    </div>
  </div>
  <%} %>
  <div class="row">
    <div class="col-md-6 report-element pubTop">
      <h3><%=glp("ui.analytics.WriteAccessAgent.pubTop-section") %></h3>
      <p class="help-block"><%=glp("ui.analytics.WriteAccessAgent.pubTop-section.help") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th class="fit"></th>
            <th class="spacer"><%=glp("ui.analytics.WriteAccessAgent.pubTop.name") %></th>
            <th class="fit text-overflow"><%= glp("ui.analytics.WriteAccessAgent.pubTop.number") %></th>
          </tr>
        </thead>
        <tbody>
          <% if (Util.isEmpty(topPubMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topPubMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
          <%
              String key = entry.getKey();
              String icon = "";
              Class clazz = null;
              try{
                clazz = channel.getClass(key);
                if(clazz != null){
                  key = channel.getTypeLabel(clazz, userLang);
                  icon = com.jalios.util.HtmlUtil.getHtmlIcon(channel.getProperty("types."+clazz.getSimpleName()+".icon", "s.gif"), key);
                }
              }
              catch(ClassNotFoundException e){
                // do nothing. key will be the classname instead of it's title
              }             
          %>
            <tr>
              <td class="text-right"><%= itCounter %></td>
              <td class="spacer"><jalios:dataicon class="<%=clazz %>" /> <%=key %></td>
              <td class="text-overflow text-right"><%=entry.getValue() %></td>
            </tr>
          </jalios:foreach>
          <% } %>
        </tbody>
      </table>
    </div>
    <div class="col-md-6 report-element mbrTop">
      <h3><%=glp("ui.analytics.WriteAccessAgent.mbrTop-section") %></h3>
      <p class="help-block"><%=glp("ui.analytics.WriteAccessAgent.mbrTop-section.help") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th class="fit"></th>
            <th class="spacer"><%=glp("ui.analytics.WriteAccessAgent.mbrTop.name") %></th>
            <th class="fix text-overflow"><%= glp("ui.analytics.WriteAccessAgent.mbrTop.number") %></th>
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
          if (mbr == null || Util.isEmpty(mbr.getFullName())){
            key = "unknown user - "+key;
          } else{
            key = mbr.getFullName();
            isRealMember= true;
          }
          %>
            <tr>
              <td class="text-right"><%= itCounter %></td>
              <td class="spacer">
                <% if(isRealMember){ %>
		                <jalios:memberphoto member="<%= mbr %>" size="<%= PhotoSize.ICON %>"/>
										<jalios:link data="<%=mbr%>" /> <%
            } else { 
              %><%=key %> <%
            }%>
              </td>
              <td class="text-overflow text-right"><%=entry.getValue() %></td>
            </tr>
          </jalios:foreach>
          <% } %>
        </tbody>
      </table> 
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 report-element contentTop">
      <h3><%=glp("ui.analytics.WriteAccessAgent.contentLikeTop-section") %></h3>
      <p class="help-block"><%=glp("ui.analytics.WriteAccessAgent.contentLikeTop-section.help") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th></th>
            <th class="spacer text-overflow"><%=glp("ui.analytics.WriteAccessAgent.contentLikeTop.name") %></th>
            <th class="text-overflow"><%= glp("ui.analytics.WriteAccessAgent.contentLikeTop.number") %></th>
          </tr>
        </thead>
        <tbody>
          <% if (Util.isEmpty(sortedAggregatedLikeMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= sortedAggregatedLikeMap.entrySet() %>" name="entry" type="Map.Entry<String, ContentTopValue>">
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
    <jalios:include target="JCMS_ANALYTICS_WRITE_REPORT_CONTENT" targetContext="DIV" />
  </div>
  <div class="row">
    <jalios:include target="JCMS_ANALYTICS_WRITE_REPORT" targetContext="DIV" />
  </div>
  <%}%>
</div>