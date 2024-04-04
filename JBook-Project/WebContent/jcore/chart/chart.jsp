<%@page import="com.jalios.jcms.chart.*"%><%
%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
%><%@page import="java.util.UUID"%><%
%><%@ include file="/jcore/doInitPage.jspf"%><%
  jcmsContext.addJavaScript("js/lib/chart/chartjs/Chart.js");
  jcmsContext.addJavaScript("js/lib/chart/chartjs-plugin-labels.js");
  jcmsContext.addJavaScript("js/lib/chart/chartjs-lines-plugin.js");
  jcmsContext.addJavaScript("js/lib/chart/patternomaly.js");
  jcmsContext.addJavaScript("js/jalios/chart/chart.js");
  jcmsContext.addCSSHeader("css/jalios/chart/chart.css");

  String jsLang = channel.getProperty("datepicker.languagekey-mapping." + userLang, userLang);
  if (!"en".equals(userLang)) {
    jcmsContext.addJavaScript("js/lib/moment/locale/" + jsLang + ".js");
  }
  
  String css = getIncludeString("css", "");
  AbstractChart chart = (AbstractChart) getIncludeObject("chart", null);
  String chartId =  getIncludeString("id", null);
  String tagBody = getIncludeBody();

  chartId = chartId != null ? chartId :  UUID.randomUUID().toString();
%><div class="chart-container <%=chart.getClass().getSimpleName()%>"
	style="position: relative;">
	<canvas class='chart <%=encodeForHTMLAttribute(css)%>'
		data-jalios-chart-id='<%=encodeForHTMLAttribute(chartId)%>'></canvas>
	<%
	  
	%><jalios:javascript>
!function ($) {

    var isDebug = /\?chartDebug\=|&chartDebug\=/i.test(location.href);
	var instanceConfiguration=<%=new ObjectMapper().writeValueAsString(chart.getJsonConfiguration())%>
		<%
		  if (chart.isAddPattern()) {
		%>
		var patternConfiguration = jQuery.jalios.chart.updatePattern(instanceConfiguration);
	    instanceConfiguration = $.extend(true, {}, instanceConfiguration, patternConfiguration);
	<%
		  }
		%>	
	var eventConfiguration = {
		options: {
			onClick:  jQuery.jalios.chart.onChartClick
		}
	}
	instanceConfiguration = $.extend(true, {}, instanceConfiguration, eventConfiguration);
	<%if(chart instanceof PieChart){%>
		var pieAlignedLegend = {
 		   options: {
		        legend : {
                	labels: {                	
	                	generateLabels: $.jalios.chart.generateAlignedLegend
                	}
                }
			}
		}
		instanceConfiguration = $.extend(true, {}, instanceConfiguration, pieAlignedLegend);
	
	<%} %>
	
	
	var tagConfig=<%=Util.isEmpty(tagBody) ? "{}" : tagBody%>
	var config = $.extend(true, {}, instanceConfiguration, tagConfig);	
	if(isDebug){
		$debug = jQuery("<pre class='chartDebug'></pre>");
		$debug.html(JSON.stringify(config, null, 2));
		jQuery("[data-jalios-chart-id='<%=encodeForJavaScript(chartId)%>']").before($debug);
	}
	var plotChart = function(){
		var $ctx = jQuery("[data-jalios-chart-id='<%=encodeForJavaScript(chartId)%>']");
		<%if (!"en".equals(userLang)) { %>
			moment.locale('<%=jsLang %>');
	  	<%}%>	
		var chart = new Chart($ctx, config);		
	}

  // ------------------------------------------
  // DOM READY CODE
  // ------------------------------------------

  $(document).ready(function($) {
    plotChart();
  });

}(window.jQuery);
</jalios:javascript>
</div>
<%
  
%>