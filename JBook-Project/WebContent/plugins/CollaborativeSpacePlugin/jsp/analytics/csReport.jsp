<%@page import="com.jalios.jcms.chart.PieChart"%>
<%@page import="com.jalios.jcms.chart.RatioData"%>
<%@page import="com.jalios.jcms.chart.series.RatioSeries"%>
<%@page import="java.util.Map.Entry"%><%
%><%@page import="com.jalios.jcms.analytics.agent.*"%><%  
%><%@page import="com.jalios.jcms.analytics.*"%><%  
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%  
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%  
%><%@page import="com.jalios.jcmsplugin.collaborativespace.*"%><%  
%><%@page import="com.jalios.jcmsplugin.collaborativespace.analytics.*"%><%  
%><%@ include file='/jcore/doInitPage.jspf' %><%  
  
%><div class="chart-result cs-report" style="overflow:hidden;"><%  
ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");  
if (formHandler == null) {
  sendRedirect("index.jsp");
  return;
}
Date endDate = formHandler.getAvailableEndDate();  
endDate = DateUtil.getDayEndDate(endDate, userLocale);  
Date beginDate = formHandler.getAvailableBeginDate();  
Workspace wk = channel.getData(Workspace.class, formHandler.getAnalyticsWS());  
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk, beginDate, endDate, null, CSReportMetric.class);  
  
if (Util.isEmpty(metricSet)){  
  %><%=glp("ui.analytics.report.no-result")%><%  
}  
else{  
  Map<String, Integer> aggregatedTypologyMap     = new HashMap<String, Integer>();
  Map<String, Integer> aggregatedAccessPolicyMap = new HashMap<String, Integer>();
  Map<String, Integer> aggregatedMemberMap       = new HashMap<String, Integer>();
  Map<String, Integer> aggregatedActivityMap     = new HashMap<String, Integer>();
  
  //fill with empty report in period if report are missing  
  AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, CSReportMetric.class);  
  metricSet = AnalyticsManager.aggregateAllUrid(metricSet,CSReportMetric.class);  

  int mtopCounter = 0;
  int emptyMetricCount = 0;
  for(AbstractReportMetric abstractMetric:  metricSet) {
    CSReportMetric metric = (CSReportMetric)abstractMetric;
    Date reportStartDate =  metric.getStartDate();  
    Date time = AnalyticsManager.getUtcTime(reportStartDate, userLocale).getTime();
    
    AnalyticsManager.aggregateKeyIntegerMap(aggregatedTypologyMap, metric.getTypologyTop());
    AnalyticsManager.aggregateKeyIntegerMap(aggregatedAccessPolicyMap, metric.getAccessPolicyTop());
    Map<String, Integer> mtop = metric.getMemberTop();
    if (Util.notEmpty(mtop)) {
      mtopCounter++;
      Map<String, Integer> consolidatedMtop = new HashMap<>(); 
      for (Map.Entry<String, Integer> itEntry :  mtop.entrySet()) {
        consolidatedMtop.put(itEntry.getKey(), itEntry.getValue());
        if (channel.getWorkspace(itEntry.getKey()) == null) {
          CollaborativeSpace itCS = channel.getData(CollaborativeSpace.class, itEntry.getKey());
          if (itCS != null) {
            consolidatedMtop.put(itCS.getWorkspaceId(), itEntry.getValue());
            consolidatedMtop.remove(itCS.getId());
          }
        }
      }
      AnalyticsManager.aggregateKeyIntegerMap(aggregatedMemberMap, consolidatedMtop);
    }
    AnalyticsManager.aggregateKeyIntegerMap(aggregatedActivityMap, metric.getActivityTop());
    
    if(Util.getSize(metric.getTypologyTop()) == 0){
      // empty metric, ignore the current day for average computation
      emptyMetricCount++;
    }
  }
  
  SortedMap<String, Integer> topTypologyMap     = AnalyticsManager.getInstance().getSortedTopMap(aggregatedTypologyMap, 10);
  SortedMap<String, Integer> topAccessPolicyMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedAccessPolicyMap, 10);
  SortedMap<String, Integer> topMemberMap       = AnalyticsManager.getInstance().getSortedTopMap(aggregatedMemberMap, 10);
  SortedMap<String, Integer> topActivityMap     = AnalyticsManager.getInstance().getSortedTopMap(aggregatedActivityMap, 10);
  
  int dayCount = metricSet.size() - emptyMetricCount;
  if(dayCount == 0){ 
    dayCount = 1; 
    //avoid /0 error 
  }
  
  boolean isJCMS9 = JcmsInfo.RELEASE_MAJOR >= 9;

  int publicSummary = Util.toInt(aggregatedAccessPolicyMap.get("public"), 0);
  publicSummary = (int) (Math.round(Double.valueOf(publicSummary) * 10.0 / dayCount) / 10.0) ;
  int privateSummary = Util.toInt(aggregatedAccessPolicyMap.get("private"), 0);
  privateSummary = (int) (Math.round(Double.valueOf(privateSummary) * 10.0 / dayCount) / 10.0) ;
  int secretSummary = Util.toInt(aggregatedAccessPolicyMap.get("secret"), 0);
  secretSummary =(int) (Math.round(Double.valueOf(secretSummary) * 10.0 / dayCount) / 10.0) ;

%>  
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-4">
        <div class="indicator"  style="background-color: #9BD716; border-color:#9BD716; color:#FFF; ">
          <div class="indicator-value"><%= publicSummary %></div>
          <div class="indicator-text"><%= glp("jcmsplugin.collaborativespace.create.info.access.public") %></div>          
        </div>
      </div>
      <div class="col-md-4 col-xs-6 col-sm-4">
        <div class="indicator"  style="background-color: #66D1E2; border-color:#66D1E2; color:#FFF; ">
          <div class="indicator-value"><%= privateSummary %></div>
          <div class="indicator-text"><%= glp("jcmsplugin.collaborativespace.create.info.access.private") %></div>
        </div>       
      </div>
      <div class="col-md-4 col-xs-6 col-sm-4">
        <div class="indicator" style="background-color: #E61717; border-color:#E61717; color:#FFF; ">
          <div class="indicator-value"><%= secretSummary %></div>
          <div class="indicator-text"><%= glp("jcmsplugin.collaborativespace.create.info.access.secret") %></div>
        </div>   
      </div>
    </div>
  </div>
  
  <div class="row">   
  
    <div  class="col-md-6 report-element cs-typology">
      <h3><%=glp("ui.analytics.CSAgent.report.typology") %></h3>
      <p class="help-block"><%=glp("ui.analytics.CSAgent.report.typology.h") %></p>
      <%
      	RatioSeries typologySeries = new RatioSeries("");
        if(Util.notEmpty(topTypologyMap)){
          for(Entry<String, Integer> entry : topTypologyMap.entrySet()){
            String filterName = entry.getKey();
            String catId = entry.getKey();
            Category cat = channel.getCategory(catId);
            String label;
            if (cat == null) {
              label = glp("ui.com.lbl.unknown") + " (" + catId + ")";
            } else {
              label = cat.getName(userLang);
            }
            Double value = new Double(0);
            if(entry.getValue() != null){
              value = Math.round(Double.valueOf(entry.getValue().doubleValue()) * 10.0 / dayCount) / 10.0 ;
            }
            typologySeries.add(label, value);
          }          
        }
        else{
          typologySeries.add(glp("ui.analytics.report.no-result"), new RatioData(100d, "#CCCCCC", null));
        }
        %>
        <jalios:chart chart='<%= new PieChart("").hideTitle().showPercent().doughnut().addSeries(typologySeries) %>'/>
    </div>    
    
    <div  class="col-md-6 report-element cs-access-policy">
      <h3><%=glp("ui.analytics.CSAgent.report.access-policy") %></h3>
      <p class="help-block"><%=glp("ui.analytics.CSAgent.report.access-policy.h") %></p>
      <%
      	RatioSeries topAccessPolicySeries = new RatioSeries("");
        if(Util.notEmpty(topAccessPolicyMap)){
          for(Entry<String, Integer> entry : topAccessPolicyMap.entrySet()){
            String filterName = entry.getKey();
            String accessPolicy = entry.getKey();
            String label = glp("jcmsplugin.collaborativespace.create.info.access." + accessPolicy);
            if (label.startsWith("jcmsplugin")) {
              label = glp("ui.com.lbl.unknown") + " (" + accessPolicy + ")"; 
            }
            Double value = new Double(0);
            if(entry.getValue() != null){
              value = Math.round(Double.valueOf(entry.getValue().doubleValue()) * 10.0 / dayCount) / 10.0 ;
            }
            topAccessPolicySeries.add(label, value);
          }
        }else{
          topAccessPolicySeries.add(glp("ui.analytics.report.no-result"), new RatioData(100d, "#CCCCCC", null));
        }%>        
        <jalios:chart chart='<%= new PieChart("").hideTitle().showPercent().doughnut().addSeries(topAccessPolicySeries) %>'/>
    </div>   
  </div>

  <div class="row">   
    <div class="col-md-6 report-element cs-members">
      <h3><%=glp("ui.analytics.CSAgent.report.members") %></h3>
      <p class="help-block"><%=glp("ui.analytics.CSAgent.report.members.h") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th class="fit"></th>
            <th class="spacer nowrap"><%=glp("jcmsplugin.collaborativespace.lbl.cs") %></th>
            <th class="fit nowrap"><%= glp("ui.com.lbl.members") %></th>
          </tr>
        </thead>
        <tbody>
          <% if (Util.isEmpty(topMemberMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topMemberMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
          <%
          String dataId = entry.getKey();
          int value = (int)(entry.getValue().intValue() / mtopCounter);
          Workspace csWs = channel.getWorkspace(dataId);
          CollaborativeSpace cs = CSManager.getInstance().getCollaborativeSpace(csWs);
          %>
          <tr>
            <td class="text-right"><%= itCounter %></td>
            <td class="spacer"><jalios:icon src="<%= CSHelper.getIcon(cs) %>" /> <% if (cs != null) { %><jalios:link data="<%= cs %>" /><% } else { %><%= glp("ui.com.lbl.unknown") + " (" + dataId + ")" %><% } %></td>
            <td class="text-right"><%= value %></td>
          </tr>
          </jalios:foreach>
          <% } %>
        </tbody>
      </table>
    </div>  

    <div class="col-md-6 report-element cs-activity">
      <h3><%=glp("ui.analytics.CSAgent.report.activity") %></h3>
      <p class="help-block"><%=glp("ui.analytics.CSAgent.report.activity.h") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th class="fit"></th>
            <th class="spacer nowrap"><%=glp("jcmsplugin.collaborativespace.lbl.cs") %></th>
            <th class="fit nowrap"><%= glp("ui.analytics.CSAgent.report.activity.count") %></th>
          </tr>
        </thead>
        <tbody>
          <% if (Util.isEmpty(topActivityMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topActivityMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
          <%
          String csId = entry.getKey();
          int value = entry.getValue();
          CollaborativeSpace cs = channel.getData(CollaborativeSpace.class, csId);
          %>
          <tr>
            <td class="text-right"><%= itCounter %></td>
            <td class="spacer"><jalios:icon src="<%= CSHelper.getIcon(cs) %>" /> <% if (cs != null) { %><jalios:link data="<%= cs %>" /><% } else { %><%= glp("ui.com.lbl.unknown") + " (" + csId + ")" %><% } %></td>
            <td class="text-right"><%= value %></td>
          </tr>
          </jalios:foreach>
          <% } %>
        </tbody>
      </table>
    </div>  

  </div>
<% } %>  
</div>  