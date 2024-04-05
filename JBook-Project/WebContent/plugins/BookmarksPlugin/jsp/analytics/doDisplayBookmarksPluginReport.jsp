<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.Instant"%>
<%@page import="com.jalios.jcms.chart.RatioData"%>
<%@page import="com.jalios.jcms.chart.series.Series.PointStyle"%>
<%@page import="com.jalios.jcms.chart.TimeChart"%>
<%@page import="com.jalios.jcms.chart.ChartUtil"%>
<%@page import="com.jalios.jcms.chart.series.TimeChartSeries"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.analytics.BookmarksReportMetric"%>
<%@page import="java.util.Map.Entry"%><%
%><%@page import="com.jalios.jcms.analytics.agent.*"%><%
%><%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><%
  AnalyticsManager instance = AnalyticsManager.getInstance();
  
  ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");
  Date endDate = formHandler.getAvailableEndDate();
  endDate = DateUtil.getDayEndDate(endDate, userLocale);
  Date beginDate = formHandler.getAvailableBeginDate();
  String wkId = formHandler.getAnalyticsWS();
  Workspace wk = channel.getData(Workspace.class, wkId);
  Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, BookmarksReportMetric.class);
  AnalyticsManager.removeToDayMetric(metricSet);
  
  TimeChartSeries averageBookmarkSeries  = new TimeChartSeries(glp("jcmsplugin.bookmarks.analytics.report.average-bookmarks")).fill();  
  
  if(Util.isEmpty(metricSet)){
    %><%=glp("ui.analytics.report.no-result")%><%
  }else{
    Map<String, Integer> aggregatedBookmarksMap = new HashMap<String, Integer>();
    Map<String, Integer> replacedBookmarksTotalMap = new HashMap<String, Integer>();
    Map<String, Integer> replacedBookmarksPubMap = new HashMap<String, Integer>();
  
    //fill with empty report in period if report are missing
    AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, BookmarksReportMetric.class);
    metricSet = AnalyticsManager.aggregateAllUrid(metricSet,BookmarksReportMetric.class);    
    
    
    Iterator<AbstractReportMetric> metricIt = metricSet.iterator(); 
    while(metricIt.hasNext()){
      BookmarksReportMetric metric = (BookmarksReportMetric) metricIt.next();
      Date reportStartDate =  metric.getStartDate();
      long time = AnalyticsManager.getUtcTime(reportStartDate, userLocale).getTimeInMillis();
      
      Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
      AnalyticsManager.aggregateKeyIntegerMap(aggregatedBookmarksMap, metric.getBookmarksTypeTop());
      averageBookmarkSeries.add(time, metric.getAverageBookmarks());  
      
      Map<String, Integer> bookmarksTotalTop = metric.getBookmarksTotalTop();
      for (Map.Entry<String, Integer> entry : bookmarksTotalTop.entrySet())
      {
        if(replacedBookmarksTotalMap.containsKey(entry.getKey())){
          Integer totalBookmarks = replacedBookmarksTotalMap.get(entry.getKey());   
          if(entry.getValue() > totalBookmarks){
            replacedBookmarksTotalMap.put(entry.getKey(), entry.getValue());
          }
        }else{
         replacedBookmarksTotalMap.put(entry.getKey(), entry.getValue()); 
        }
      }
      
      Map<String, Integer> bookmarksPubTop = metric.getBookmarksPubTop();
      for (Map.Entry<String, Integer> entry : bookmarksPubTop.entrySet())
      {
        if(replacedBookmarksPubMap.containsKey(entry.getKey())){
          Integer pubBookmarks = replacedBookmarksPubMap.get(entry.getKey());   
          if(entry.getValue() > pubBookmarks){
            replacedBookmarksPubMap.put(entry.getKey(), entry.getValue());
          }
        }else{
         replacedBookmarksPubMap.put(entry.getKey(), entry.getValue()); 
        }
      }
    }
  
  SortedMap<String, Integer> topBookmarksMap = instance.getSortedTopMap(aggregatedBookmarksMap, 10);
  SortedMap<String, Integer> bookmarksTotalMap = instance.getSortedTopMap(replacedBookmarksTotalMap, 10);
  SortedMap<String, Integer> bookmarksPubMap = instance.getSortedTopMap(replacedBookmarksPubMap, 10);
  
  DecimalFormat df = new DecimalFormat("0.##");  
%>
<div class="chart-result" style="overflow: hidden;">
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-4 row">  
     <div class="col-md-4 col-xs-4 col-sm-4">
       <div class="indicator">
         <div class="indicator-value"><%= Math.round(ChartUtil.mean(averageBookmarkSeries)) %></div>
         <div class="indicator-text"><%=glp("jcmsplugin.bookmarks.analytics.indicator.average-bookmarks") %></div>
       </div>
     </div>
   </div>
  </div>  
  <div class="clearfix"></div>
  <div class="row">
    <div class="col-md-6 report-element">  
      <h3><%=averageBookmarkSeries.getName() %></h3>  
      <span class="help-block"><%=glp("jcmsplugin.bookmarks.analytics.report.average-bookmarks.h") %></span>       
      <jalios:chart chart='<%=new TimeChart().addSeries(averageBookmarkSeries).setRoundXAxis("day")%>'/>
    </div>
    <div class="col-md-6 report-element">
      <h3><%=glp("jcmsplugin.bookmarks.analytics.report.pub-bookmarks") %></h3>
      <p class="help-block"><%=glp("jcmsplugin.bookmarks.analytics.report.pub-bookmarks.h") %></p> 
      <table class="table-data">
        <thead>
          <tr>
            <th><%= glp("jcmsplugin.bookmarks.analytics.rank-number-column.label") %></th>
            <th><%= glp("jcmsplugin.bookmarks.analytics.report.pub-bookmarks.table.pub.title") %></th>
            <th><%= glp("jcmsplugin.bookmarks.analytics.bookmark-number-column.label") %></th>
          </tr>
        </thead>
        <tbody>
          <% int index = 0; %>
          <jalios:foreach collection="<%= bookmarksPubMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
            <% 
              index++; 
              String bookmarkDataId = entry.getKey();
              if(Util.notEmpty(bookmarkDataId)){

              String dataId = bookmarkDataId.substring(Bookmark.JCMS_SCHEMA.length());
              Integer topValue  = entry.getValue();
              Data data = channel.getData(dataId);
              if(data != null){ %>
              <tr>
                <td class="fit"><%= index %></td>
                <td>
                  <jalios:dataicon data="<%= data %>"/> 
                  <jalios:link data="<%= data %>" />  
                </td>
                <td class="text-right fit"><%= topValue %></td>
              </tr>
              <% } %>
            <% } %>
          </jalios:foreach>
        </tbody>
      </table>  
    </div>
  </div>
  
  <div class="row">
    <div class="col-md-6 report-element">
      <h3><%=glp("jcmsplugin.bookmarks.analytics.top-bookmarks-section") %></h3>
      <p class="help-block"><%=glp("jcmsplugin.bookmarks.analytics.top-bookmarks-section.help") %></p> 
      <table class="table-data">
        <thead>
          <tr>
            <th><%= glp("jcmsplugin.bookmarks.analytics.rank-number-column.label") %></th>
            <th><%= glp("jcmsplugin.bookmarks.analytics.author-column.label") %></th>
            <th><%= glp("jcmsplugin.bookmarks.analytics.bookmark-number-column.label") %></th>
          </tr>
        </thead>
        <tbody>
          <% index = 0; %>
          <jalios:foreach collection="<%= bookmarksTotalMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
            <% 
              index++; 
              String dataId = entry.getKey();
              Integer topValue  = entry.getValue();
              
              Data data = channel.getData(dataId);
              if(data != null){ %>
            <tr>
              <td class="fit"><%= index %></td>
              <td>
              <%
              	//check the associated member if any
          		Member mbr = channel.getMember(dataId);
          		boolean isRealMember = false;
          		if (mbr == null || Util.isEmpty(mbr.getFullName())){
          		  dataId = "unknown user - "+dataId;
          		} else{
          		  dataId = mbr.getFullName();
            	  isRealMember= true;
          		}
          		if(isRealMember){ %>
		          <jalios:memberphoto member="<%= mbr %>" size="<%= PhotoSize.ICON %>"/>
				  <jalios:link data="<%=mbr%>" /> <%
	            } else { 
	              %><%=dataId %> <%
	            }%>  
              </td>
              <td class="text-right fit"><%= topValue %></td>
            </tr>
            <% } %>
          </jalios:foreach>
        </tbody>
      </table>  
    </div>
    
     <div class="col-md-6 report-element">
      <h3><%=glp("jcmsplugin.bookmarks.analytics.top-section") %></h3>
      <p class="help-block"><%=glp("jcmsplugin.bookmarks.analytics.top-section.help") %></p> 
      <table class="table-data">
        <thead>
          <tr>
            <th><%= glp("jcmsplugin.bookmarks.analytics.rank-number-column.label") %></th>
            <th><%= glp("jcmsplugin.bookmarks.analytics.bookmark-column.label") %></th>
            <th><%= glp("jcmsplugin.bookmarks.analytics.bookmark-add-column.label") %></th>
          </tr>
        </thead>
        <tbody>
          <% index = 0; %>
          <jalios:foreach collection="<%= topBookmarksMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
            <% 
              index++; 
              String dataId = entry.getKey();
              Integer topValue  = entry.getValue();
              Data data = channel.getData(dataId);
              if(data != null){ %>
	            <tr>
	              <td class="fit"><%= index %></td>
	              <td>
	                <jalios:dataicon data="<%= data %>"/> 
	                <jalios:link data="<%= data %>" />  
	              </td>
	              <td class="text-right fit"><%= topValue %></td>
	            </tr>
            <% } %>
          </jalios:foreach>
        </tbody>
      </table>  
    </div>
  </div>
</div>
<%}%>