<%--
  @Summary: Display JCMS Monitoring information managed by com.jalios.jcms.monitoring.MonitoringManager
  @Category: Admin / Channel
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
--%><%@page import="com.jalios.jcms.monitoring.RestartEvent"%>
<%@page import="com.jalios.jcms.chart.*"%>
<%@page import="com.jalios.jcms.monitoring.ChartDataWrapper"%>
<%@page import="com.jalios.jcms.chart.series.*"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
  if (!checkAccess("admin/monitoring/monitoring")) {
    sendForbidden(request, response);
    return;
  }
long freeMemory = Runtime.getRuntime().freeMemory();
long totalMemory = Runtime.getRuntime().totalMemory();
long usedMemory = totalMemory - freeMemory;

com.jalios.jstore.LoadReport loadReport = channel.getStoreLoadReport(); 
long storeMemory = loadReport.getMemoryUsed();

// Force Garbage collection 
long memBefore = getLongParameter("memBefore", 0);
if (isAdmin && hasParameter("forceGarbageCollection")) {
  Util.forceFullGarbageCollection(2000);
  sendRedirect("admin/monitoring.jsp?memBefore="+ memBefore, request, response);
}
%>
<jsp:useBean id='handler' scope='page' class='com.jalios.jcms.monitoring.MonitoringChartHandler'>
<jsp:setProperty name='handler' property='request' value='<%= request %>'/>
<jsp:setProperty name='handler' property='response' value='<%= response %>'/>
<jsp:setProperty name='handler' property='*' />
</jsp:useBean>
<%
handler.validate();
request.setAttribute("monitoringSubAdminMenu", "true"); 
int counter = 0;

%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<style type="text/css">
.result .row {
	max-height: 200px;
	border-top: 1px solid #EEEEEE;
	padding-top: 10px;
	margin-bottom: 10px;
}
.legend DIV{
   display:inline-block;
}
.legend .color-box {
	width : 15px;
	height:15px;
	margin : 0 5px;
	border : 2px solid black;
}
</style>
<jalios:buffer name="defaultChartOptions">
{
	options: { 
		maintainAspectRatio: false, 
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
				afterFit : function(axis){
					axis.width = 50;	
				}
			}]
		}
	}
}
</jalios:buffer>
<div class="page-header">
  <h1 class='boTitle icon iconMonitoring'><%= glp("ui.adm.mn.info.monitoring") %></h1>
</div>
<div class=''>
	<div class='row'>
	  	<div class="col-md-9">
			<form name="chartOptionsForm" class="form-horizontal">		
		  		<fieldset>
					<legend><%= glp("ui.adm.ch-status.mem.select-label") %></legend>				 
				   	<jalios:field label='ui.analytics.report.predefined-period' name='preDefinedPeriod' id="preDefinedPeriod" value='<%=handler.getPreDefinedPeriod() %>'>
				   		<%
				   			Map<String, String> predefinedPeriodMap = handler.getPredefinedPeriodMap();
				   		%>
				   		<jalios:control settings='<%= new EnumerateSettings().select().enumValues(predefinedPeriodMap.keySet()).enumLabels(predefinedPeriodMap.values()).required() %>' />
				   		<input type="hidden" name="periodChangeTrigger" class="periodChangeTrigger" value="" />				   		
					</jalios:field>
					<%
						String customEltStyle = "custom".equals(handler.getPreDefinedPeriod()) ?"":"hide";
					%>
		    		<jalios:field name="startDate" label='<%= glp("monitoring.chart.start-date") %>' value="<%= handler.getAvailableStartDate() %>" css="<%=customEltStyle %>">
		      			<jalios:control settings='<%= new DateSettings().displayTime() %>' />
		    		</jalios:field>
		    
				    <jalios:field name="endDate" label='<%= glp("monitoring.chart.end-date") %>' value="<%= handler.getAvailableEndDate() %>" css="<%=customEltStyle %>">
				      <jalios:control settings='<%= new DateSettings().displayTime() %>' />
				    </jalios:field>
				    <div class="form-group">
					    <div class="col-md-9 col-md-offset-3">
						    <button class="btn btn-default refresh-button <%=customEltStyle %>" type="submit"><%= glp("ui.com.btn.refresh") %></button>
					    </div>
				    </div>
				</fieldset>	
			</form>
		</div>
		<div class="well well-small col-md-3">
	    	<div class="br">
		    	<h4><%= glp("ui.adm.ch-status.mem.infos") %></h4>
		    	<% if (memBefore != 0 && memBefore-usedMemory > 0) { %><span style="color:green"><%= glp("ui.adm.ch-status.mem.saved-by-gc") %> <%= Util.formatFileSize(memBefore-usedMemory, userLocale) %> (<%= (int)((memBefore-usedMemory) * 100 / totalMemory)%>%)</span><br /><% } %>
		  		<span style="color:blue"><%= glp("ui.adm.ch-status.mem.used") %> <%= Util.formatFileSize(usedMemory, userLocale) %> (<%= (int)(usedMemory * 100 / totalMemory)%>%)</span><br />
		  		<span style="color:gray"><%= glp("ui.adm.ch-status.mem.store-load") %> <%= Util.formatFileSize(storeMemory, userLocale) %> (<%= (int)(storeMemory * 100 / totalMemory)%>%)</span><br />
		    	<%= glp("ui.adm.ch-status.mem.total") %> <%= Util.formatFileSize(totalMemory, userLocale) %>
	    	</div>
			<% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
	    	<input class='btn btn-danger' type='button' value='<%= glp("ui.adm.ch-status.mem.garbage-coll") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/monitoring.jsp?forceGarbageCollection=true&memBefore=<%= usedMemory %>")' />
	  	</div>
		
	</div><%-- row --%>
</div>
<div class="">
	<div class='row'>
  		<div class="col-md-12 container-fluid result">
			<div class='row'>
				<%
				TimeChart memoryChart = handler.getMemoryChart();
			  	%>
  				<div class="col-lg-9 col-md-9 col-xs-9">
  	   				<jalios:chart chart='<%=memoryChart %>'>
				  	   {
					  		options: {
        						maintainAspectRatio: false,
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
					                        	if(value / 1000000 >= 1){
					                        		return (value / 1000000)+" TB"
					                        	}	                    
					                        	if(value / 1000 >= 1){
					                        		return (value / 1000)+" GB"
					                        	}
					                        	return value;
					                    	}
					                	},
				                		afterFit : function(axis){
				                			axis.width = 50;
					                	}
									}]
					        	}
					    	}
				    	}
  	   				</jalios:chart>
  				</div>
  				<div class="col-lg-3 col-md-3 col-xs-3">
	  				<%=ChartUtil.writeLegend(memoryChart, userLang)%>	  
	  				<ul class="legend list-unstyled"><li><span><div class="color-box" style="border-color:#CCCBCA;height:2px;"></div><div>Restart</div></span></li></ul>
  				</div>
			</div>  
			<div class='row'>
				<%
					TimeChart requestChart = handler.getRequestChart();
					requestChart.getSeriesList().get(0).fill().setBorderWidth(1);
				%>
				<div class="col-lg-9 col-md-9 col-xs-9">
					<jalios:chart chart='<%= requestChart%>'>
						<%=defaultChartOptions %>
					</jalios:chart>
				</div>
				<div class="col-lg-3 col-md-3 col-xs-3">
					<%=ChartUtil.writeLegend(requestChart, userLang)%>
				</div>
			</div>  
			<div class='row'>
			  <%  TimeChart sessionChart = handler.getSessionChart();
			  	sessionChart.getSeriesList().get(0).setBorderWidth(1).fill();
			 	sessionChart.getSeriesList().get(1).setBorderWidth(1).fill();
			 	sessionChart.getSeriesList().get(2).setBorderWidth(1).fill();
			 	sessionChart.getSeriesList().get(3).setBorderWidth(1).fill();
			  %>
			  <div class="col-lg-9 col-md-9 col-xs-9">
					<jalios:chart chart='<%= sessionChart%>'>
						{
					  		options: {
					  			maintainAspectRatio: false,
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
				                		afterFit : function(axis){
				                			axis.width = 50;
					                	}
									}]
					        	}
					    	}
				    	}
					</jalios:chart>
	          </div>
			  <div class="col-lg-3 col-md-3 col-xs-3">
				  <%=ChartUtil.writeLegend(sessionChart, userLang)%>
			  </div>
			</div>  
			<div class='row'>
  				<%  TimeChart objectChart = handler.getObjectChart(); 
  				
  					objectChart.getSeriesList().get(0).setBorderWidth(1).fill();
  					objectChart.getSeriesList().get(1).setBorderWidth(1).fill();
  					objectChart.getSeriesList().get(2).fill();
  				%>
			  	<div class="col-lg-9 col-md-9 col-xs-9">
				 <jalios:chart chart='<%= objectChart%>'>
				  	   {
					  		options: {
					  			maintainAspectRatio: false,
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
					                    	callback: function(label) {
					                    	    var order = Math.log(label)/Math.log(10);
					                    	    if(Math.floor(order) == order ){
					                        		return "10^"+order;
					                        	}
					                        	else{
					                        		return null;
					                        	}
					                    	}
					                	},					                	
				                		afterFit : function(axis){
				                			axis.width = 50;
					                	}
									}]
					        	}
					    	}
				    	}
				 </jalios:chart>
			  </div>
		  		<div class="col-lg-3 col-md-3 col-xs-3">
			  		<%=ChartUtil.writeLegend(objectChart, userLang)%>
				</div>
			</div> 
			<div class='row'>
				<% 	TimeChart threadsChart = handler.getThreadsChart();
					threadsChart.getSeriesList().get(0).setBorderWidth(1).fill();
			  %>
		  		<div class="col-lg-9 col-md-9 col-xs-9">
					<jalios:chart chart='<%= threadsChart%>'>
				 			<%=defaultChartOptions %>
					</jalios:chart>
		  		</div>
		  		<div class="col-lg-3 col-md-3 col-xs-3">
			  		<%=ChartUtil.writeLegend(threadsChart, userLang)%>
		  		</div>
			</div> 
		</div>
	</div>
</div>
<%@ include file='/admin/doAdminFooter.jspf' %><%

%>